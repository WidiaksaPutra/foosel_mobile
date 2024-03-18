// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foosel/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:foosel/blocs/bloc_default/default/show_dialog_basic.dart';
import 'package:foosel/blocs/bloc_detail_products/detail_product/cubit_detail_product_connect.dart';
import 'package:foosel/blocs/bloc_detail_products/state_products.dart';
import 'package:foosel/blocs/bloc_message/event_message.dart';
import 'package:foosel/blocs/bloc_message/main/bloc_main_detail_message_connect.dart';
import 'package:foosel/blocs/bloc_message/main/cubit_main_list_message_connect.dart';
import 'package:foosel/blocs/bloc_message/main/cubit_nav_message.dart';
import 'package:foosel/blocs/bloc_message/state_message.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_local/cubit_get_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_local/cubit_insert_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_local/state_transaksi.dart';
import 'package:foosel/routes/route_name.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_content_dialog(image_&_text).dart';
import 'package:foosel/ui/widgets/componen_bottom_product.dart';
import 'package:foosel/ui/widgets/componen_loading.dart';
import 'package:go_router/go_router.dart';

class DetailBottomNavigationBarConnectionProductPembeli extends HookWidget with defaultSharedPref, dialogBasic{
  DetailBottomNavigationBarConnectionProductPembeli({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var loadingMessage = useState<bool>(true);
    var tokenPenerima = useState<String>("-");
    var getDataTransaksi = useState([]);
    sharedPref();
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: context.read<cubitListMessageConnect>().getStreamFirebaseListMessage,
      builder: (context1, snapshot){
        if(snapshot.connectionState == ConnectionState.active){
          context.read<cubitListMessageConnect>().getListMessage(snapshot.data!.docs);
          return BlocListener<cubitListMessageConnect, DataStateListMessage>(
            listener: (context2, listMessage){
              if(listMessage.loading == false){
                listMessage.dataUser.forEach((data) { 
                  if(data.email.toString() == prefs.getString('emailPenerima').toString()){               
                    tokenPenerima.value = data.tokenNotive.toString();
                  }
                });
                loadingMessage.value = listMessage.loading;
              }
            },
            child: (loadingMessage.value == false) 
            ? BlocBuilder<CubitDetailProductConnect, DataStateProducts>(
                builder: (context3, state) => BlocBuilder<CubitGetTransaksiLocal, DataStateGetTransaksiLocal>(
                builder: (context4, state1) {
                  getDataTransaksi.value = state1.getData;
                  return (state1.loadingTransaksi == true)
                  ? ComponenLoadingLottieBasic(height: themeBox.defaultHeightBox200)
                  : BottomProduct(
                      navigationCart: RouteName.cartDetail, 
                      navBack: RouteName.detailProductPembeli, 
                      onPressedMessage: () {
                        context.read<cubitListMessageConnect>().updateListMessage();
                        if(tokenPenerima.value == "-"){
                          context.read<BlocDetailMessageConnect>().add(
                            DataEventPostMessage(
                              message: "Hi ${prefs.getString('emailPenerima').toString()}...", 
                              tokenPenerima: "-",
                            )
                          );
                          context.go(RouteName.detailProductPembeli);
                        }else{
                          context.read<cubitNavMessageDetail>().navigation(tokenPenerima: tokenPenerima.value, roleBar: 0, detailMessage: true);
                          context.go(RouteName.detailMessage);
                        }
                      },
                      onTapTransaksi: () {
                        context.read<CubitInsertTransaksiLocal>().SaveLocalDataTransaksi(
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
                        context.read<CubitGetTransaksiLocal>().GetDataTransaksiWhereId(tokenId: state.dataProducts.tokenId.toString());
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
                          builder: (context5, state2) => (state2.loadingTransaksi == true)
                          ? ComponenContentDialog_ImageAndTitleText(
                              image: 'asset/animations/loading_dialog_lottie.json', 
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
                          onTapCloseDialog: () => Navigator.of(context).pop(), 
                        );
                      }, 
                      statusTransaksi: (getDataTransaksi.value.isNotEmpty) ? false : true,
                    );
                  },
                )
              )
            : Center(child: ComponenLoadingLottieBasic(height: themeBox.defaultHeightBox200)),
          );
        }else{
          return Center(child: ComponenLoadingLottieBasic(height: themeBox.defaultHeightBox200));
        }
      }
    );
  }
}