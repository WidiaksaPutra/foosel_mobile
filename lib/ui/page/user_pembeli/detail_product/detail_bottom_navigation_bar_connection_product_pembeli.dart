// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/show_dialog_basic.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_detail_products/detail_product/cubit_detail_product_connect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_detail_products/state_products.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_message/main/cubit_main_list_message_connect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_message/main/cubit_main_title_message_connect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_message/main/cubit_nav_message.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_message/state_message.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_local/cubit_get_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_local/cubit_insert_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_local/state_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/routes/route_name.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_advanced/componen_content_dialog(image_&_text).dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_bottom_product.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_loading.dart';
import 'package:go_router/go_router.dart';

class DetailBottomNavigationBarConnectionProductPembeli extends HookWidget with defaultSharedPref, dialogBasic{
  DetailBottomNavigationBarConnectionProductPembeli({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext contextParent) {
    var loadingMessage = useState(true);
    var titleBool = useState(false);
    var haveTitle = useState(false);
    var getDataTransaksi = useState([]);
    sharedPref();
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: contextParent.read<cubitListMessageConnect>().getStreamFirebaseListMessage,
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.active){
          contextParent.read<cubitListMessageConnect>().getListMessage(snapshot.data!.docs);
          return BlocListener<cubitListMessageConnect, DataStateListMessage>(
            listener: (context, listMessage){
              if(listMessage.loading == false){
                if(listMessage.dataUser.length == 0){
                  titleBool.value = true;
                }else{
                  for(int i = 0; i < listMessage.dataUser.length; i++){
                    if(listMessage.dataUser[i].email.toString() == prefs.getString('emailPenerima').toString()){               
                      contextParent.read<cubitTitleMessageConnect>().getTitleMessage(users: snapshot.data!.docs, message: "hai...");
                      contextParent.read<cubitNavMessageDetail>().navigation(tokenPenerima: listMessage.dataUser[i].tokenNotive.toString(), roleBar: 0, detailMessage: true);
                      haveTitle.value = true;
                    }
                  }
                  if(haveTitle.value == false){
                    titleBool.value = true;
                  }
                }
                loadingMessage.value = listMessage.loading;
              }
            },
            child: (loadingMessage.value == false) 
            ? BlocBuilder<CubitDetailProductConnect, DataStateProducts>(
                builder: (context, state) => BlocBuilder<CubitGetTransaksiLocal, DataStateGetTransaksiLocal>(
                builder: (context, state1) {
                getDataTransaksi.value = state1.getData;
                Future.delayed(Duration(milliseconds: 3000));
                return (state1.loadingTransaksi == true)
                ? const ComponenLoadingBasic(colors: kPurpleColor)
                : BottomProduct(
                    navigationCart: RouteName.cartDetail, 
                    navBack: RouteName.detailProductPembeli, 
                    onPressedMessage: () {
                      if(titleBool.value == true){
                        contextParent.read<cubitTitleMessageConnect>().getTitleMessage(users: snapshot.data!.docs, message: "hai...");
                        contextParent.read<cubitNavMessageDetail>().navigation(tokenPenerima: "-", roleBar: 0, detailMessage: true);
                      }
                      contextParent.go(RouteName.detailMessage);       
                    },
                    onTapTransaksi: () {
                      contextParent.read<CubitInsertTransaksiLocal>().SaveLocalDataTransaksi(
                        tokenId: state.dataProducts.tokenId.toString(),
                        emailPenjual: state.dataProducts.email.toString(),
                        emailPembeli: prefs.getString('email').toString(), 
                        idCategory: state.dataProducts.categoriesId.toString(),
                        name: state.dataProducts.name.toString(), 
                        description: state.dataProducts.description.toString(), 
                        nameCategory: state.dataProducts.category!.name.toString(), 
                        hargaSatuan: state.dataProducts.price.toString(),
                        hargaTotal: state.dataProducts.price.toString(),
                        jumlah: 1,
                        imagePath: state.dataProducts.urlImage.toString(),
                      );
                      contextParent.read<CubitGetTransaksiLocal>().GetDataTransaksiWhereId(tokenId: state.dataProducts.tokenId.toString()); 
                      Future.delayed(Duration(milliseconds: 3000));
                      getDataTransaksi.value = state1.getData;
                      voidDialogBasic(
                        context: context, 
                        margin: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox30, vertical: MediaQuery.of(context).size.height * 0.3),
                        padding: EdgeInsets.only(left: themeBox.defaultWidthBox30, right: themeBox.defaultWidthBox30, top: themeBox.defaultHeightBox30),
                        borderRadius: BorderRadius.circular(themeBox.defaultRadius10),
                        color: kBlackColor6,
                        closeIconStatus: false,
                        barrierDismissible: true,
                        contentDialog: BlocBuilder<CubitInsertTransaksiLocal, DataStatePostTransaksiLocal>(
                        builder: (context, state2) => (state2.loadingTransaksi == true)
                        ? ComponenContentDialog_ImageAndTitleText(
                            image: 'asset/animations/loading_lottie.json', 
                            text: '...',
                          )
                        : (state2.status == true)
                          ? ComponenContentDialog_ImageAndTitleText(
                              image: 'asset/animations/check_lottie.json', 
                              text: 'Berhasil..!',
                            )
                          : ComponenContentDialog_ImageAndTitleText(
                              image: 'asset/animations/close_lottie.json', 
                              text: 'Gagal..!',
                            ) 
                        ),
                        onTapCloseDialog: () => Navigator.of(contextParent).pop(), 
                      );
                    }, 
                    statusTransaksi: (getDataTransaksi.value.isNotEmpty) ? false : true,
                  );
                })
              )
            : const ComponenLoadingBasic(colors: kPurpleColor),
          );
        }else{
          return const ComponenLoadingBasic(colors: kPurpleColor);
        }
      }
    );
  }
}