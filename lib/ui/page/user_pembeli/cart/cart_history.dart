// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_bottom_nav_pembeli/cubit_detail_produk_nav_pembeli.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/connection_dialog.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/show_dialog_basic.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_detail_products/cubit_detail_navigasi_product.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_detail_products/detail_product/cubit_detail_product_connect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_detail_products/state_products.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_api/cubit_delete_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/routes/route_name.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_konstanta.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/connection/connection_history_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_advanced/componen_card_vertical(image_&_text_&_status).dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_advanced/componen_card_vertical(image_&_text_&_status_&_button_delete).dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_advanced/componen_content_dialog(image_&_text).dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_advanced/componen_content_dialog(image_&_title_text_&_button_yes_and_button_no).dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_header/componen_header_cart.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_loading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class CartHistory extends HookWidget with dialogBasic{
  CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusDelete = useState(false);
    ClassConnectionDialog connection = ClassConnectionDialog();
    return Scaffold(
      backgroundColor: kBlackColor6,
      appBar: headerCart(
        context: context, 
        titleCart: 'History Cart', 
        statusLeading: true, 
        statusNav: '', 
        navigationCart: RouteName.cart, 
        navBack: '',
      ),
      body: ConnectionHistoryTransaksi(
        connection: connection.basicConnection, 
        childConnect: (context1, state1){
          return (state1.dataTransaksi.isNotEmpty)
          ? ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: state1.dataTransaksi.length,
              itemBuilder: (context2, index){
              context.read<cubitDetailNavigasiProduct>().navigationDetailProduct();
              return BlocBuilder<cubitDetailNavigasiProduct, DataStateDetailProduct>(
                builder: (context, stateNavDetail) => ComponenCardVertical_ImageAndTextAndStatusAndButtonDelete(
                textTitle: state1.dataTransaksi[index]['name'].toString(), 
                harga: state1.dataTransaksi[index]['price'].toString(), 
                connection: true,
                image: state1.dataTransaksi[index]['urlImage'].toString(), 
                type: state1.dataTransaksi[index]['categoryName'].toString(), 
                status: state1.dataTransaksi[index]['status'].toString().toUpperCase(),
                onTapCard: () async{
                  await context.read<CubitDetailProdukNavPembeli>().DetailProdukNavPembeli(
                    jenisDetail: "Transaksi",
                    readDetail: context.read<CubitDetailProductConnect>().GetDetailProductConnect(state1.dataTransaksi[index]['productId'].toString())
                  );
                  context.go(stateNavDetail.navigation);
                },
                onTapDelete: () {
                  voidDialogBasic(
                    context: context, 
                    margin: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox30, vertical: MediaQuery.of(context).size.height * 0.3),
                    padding: EdgeInsets.only(left: themeBox.defaultWidthBox30, right: themeBox.defaultWidthBox30, top: themeBox.defaultHeightBox30),
                    borderRadius: BorderRadius.circular(themeBox.defaultRadius10),
                    color: kBlackColor6,
                    closeIconStatus: true,
                    barrierDismissible: false,
                    contentDialog: BlocBuilder<CubitDeleteTransaksi, StateDeleteTransaksi>(
                      builder: (context, state2) => (state2.loadingDeleteTransaksi == false)
                      ? (statusDelete.value == false)
                        ? ComponenContentDialog_ImageAndTitleTextAndButtonYesAndButtonNo(
                            image: 'asset/animations/peringatan_lottie.json',
                            titleText: apakahTransaksiDihapus,
                            onTapYes: () async{
                              await context.read<CubitDeleteTransaksi>().DeleteDataTransaksi(tokenId: state1.dataTransaksi[index]['transactionsId'].toString());
                              statusDelete.value = true;
                              await Future.delayed(Duration(seconds: 2));
                              Navigator.of(context).pop();
                              statusDelete.value = false;
                              context.go(RouteName.cart);
                            },
                          )
                        : (state2.statusAlert == 'berhasil')
                          ? ComponenContentDialog_ImageAndTitleText(
                              image: 'asset/animations/check_lottie.json',
                              text: 'Berhasil...',
                            )
                          : ComponenContentDialog_ImageAndTitleText(
                              image: 'asset/animations/close_lottie.json', 
                              text: 'Gagal..!',
                            )
                      : ComponenContentDialog_ImageAndTitleText(
                          image: 'asset/animations/loading_lottie.json', 
                          text: '...',
                        )
                    ),
                    onTapCloseDialog: () => Navigator.of(context).pop(), 
                  );
                }, 
              ));}
            )
          : ComponenLoadingBasic(colors: kPurpleColor);
        },
        childDisconnect: (context1, state1){
          return (state1.dataTransaksi.isNotEmpty)
          ? ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: state1.dataTransaksi.length,
              itemBuilder: (context2, index){
                return ComponenCardVertical_ImageAndTextAndStatus(
                    textTitle: state1.dataTransaksi[index]["name"].toString(), 
                    harga: state1.dataTransaksi[index]['price'].toString(), 
                    connection: false,
                    image: "asset/image/sampel_sepatu_home_small_4.png", 
                    type: state1.dataTransaksi[index]['nameCategory'].toString(), 
                    status: state1.dataTransaksi[index]['status'].toString().toUpperCase(),
                    onTapCard: () {  },
                  );
              }
            )
          : ComponenLoadingBasic(colors: kPurpleColor);
        },
    ));
  }
}