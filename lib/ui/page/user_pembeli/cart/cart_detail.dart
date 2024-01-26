import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_bottom_nav_pembeli/cubit_detail_produk_nav_pembeli.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/cubit_connection_example.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/show_dialog_basic.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_detail_products/cubit_detail_navigasi_product.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_detail_products/detail_product/cubit_detail_product_connect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_detail_products/state_products.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_api/cubit_post_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_local/cubit_get_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_local/state_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_user/main/connect/cubit_main_user_connect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_user/state_user.dart';
import 'package:flutter_laravel_toko_sepatu/routes/route_name.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_advanced/componen_bottom_cart_button.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_advanced/componen_content_dialog(image_&_text).dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_cart_card_address.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_cart_card_total.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_cart_item_detail_vertical.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_header/componen_header_cart.dart';
import 'package:go_router/go_router.dart';

class CartDetail extends StatelessWidget with dialogBasic{
  CartDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<cubitConnectionExample>().connectCheck(readBlocConnect: {}, readBlocDisconnect: {});
    context.read<cubitDetailNavigasiProduct>().navigationDetailProduct();
    return BlocBuilder<CubitGetTransaksiLocal, DataStateGetTransaksiLocal>(
      builder: (context1, state){
        return Scaffold(
          backgroundColor: kBlackColor6,
          appBar: headerCart(
            context: context, 
            titleCart: "Checkout Details", 
            statusLeading: true, 
            statusNav: 'true', 
            navigationCart: '', 
            navBack: RouteName.cart,
          ),
          bottomNavigationBar: BlocListener<CubitPostTransaksi, DataStatePostTransaksi>(
            listener: (context, state2) async{
              voidDialogBasic(
                context: context, 
                margin: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox30, vertical: MediaQuery.of(context).size.height * 0.3),
                padding: EdgeInsets.only(left: themeBox.defaultWidthBox30, right: themeBox.defaultWidthBox30, top: themeBox.defaultHeightBox30),
                borderRadius: BorderRadius.circular(themeBox.defaultRadius10),
                color: kBlackColor6,
                closeIconStatus: false,
                barrierDismissible: true,
                contentDialog: (state2.loadingTransaksi == true)
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
                    ),
                onTapCloseDialog: () => Navigator.of(context).pop(),
              );
              if(state2.loadingTransaksi == false && state2.status == true){
                await Future.delayed(Duration(seconds: 2));
                context.go(RouteName.cart);
              }
            },
            child: ComponenBottomCartButton(
            connection: true,
            harga: "", 
            textButton: "Checkout Now",
            listCart: false, 
            onPressed: () async{
              for(int i = 0 ; i < state.getData.length; i++){
                context.read<CubitPostTransaksi>().SaveDataTransaksi(
                  emailPembeli: state.getData[i]['emailPembeli'].toString(),
                  emailPenjual: state.getData[i]['emailPenjual'].toString(),
                  productsId: state.getData[i]['tokenId'].toString(),
                  categoryId: state.getData[i]['idCategory'].toString(),
                  total: state.getData[i]['hargaTotal'].toString(),
                  totalPrice: state.getData[i]['hargaTotal'].toString(),
                  shippingPrice: "0",
                  quantity: state.getData[i]['jumlah'].toString(),
                  status: "pending",
                );
              }
            }),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox30),
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: themeBox.defaultHeightBox30),
                  child: Text("List Items", style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16)),
                ),
                if(state.getData.isNotEmpty)...[
                  Column(children: [
                    for(int i = 0 ; i < state.getData.length; i++)...[
                      BlocBuilder<cubitDetailNavigasiProduct, DataStateDetailProduct>(
                        builder: (context, state1) => ComponenCartItemDetailVertical(
                          image: state.getData[i]['imagePath'].toString(),
                          harga: state.getData[i]['hargaTotal'].toString(),
                          textTitle: state.getData[i]['name'].toString(),
                          jumlah: state.getData[i]['jumlah'].toString(),
                          onTapCard: () {
                            context.read<cubitConnectionExample>().connectCheck(
                              readBlocConnect: {context.read<CubitDetailProdukNavPembeli>().DetailProdukNavPembeli(
                                jenisDetail: "Transaksi",
                                readDetail: context.read<CubitDetailProductConnect>().GetDetailProductConnect(state.getData[i]['tokenId'].toString()),
                                // context.read<CubitDetailProductConnect>().GetDetailProductConnect(state.getData[i]['tokenId'].toString())
                              )},
                              readBlocDisconnect: {context.read<CubitDetailProdukNavPembeli>().DetailProdukNavPembeli(
                                jenisDetail: "Transaksi", 
                                readDetail: context.read<CubitDetailProductConnect>().GetDetailProductConnect(state.getData[i]['tokenId'].toString()),
                                // context.read<CubitGetTransaksi>().GetDataTransaksiWhereIdLocal(tokenId: state.getData[i]['tokenId'].toString())
                              )},
                            );
                            context.go(state1.navigation);
                          },
                        ),
                      ),
                    ],
                    BlocBuilder<CubitMainUserConnect, DataStateUser>( 
                      builder: (context, state1) => BlocBuilder<CubitDetailProductConnect, DataStateProducts>( 
                        builder: (context, state2) => ComponenCartCardAddress(
                          storeLocation: (state2.dataProducts.user!.alamat != null) 
                          ? state2.dataProducts.user!.alamat.toString()
                          : "-",
                          yourLocation: (state1.dataUser.alamat != null)
                          ? state1.dataUser.alamat.toString()
                          : "-",
                        ),
                      )
                    ),
                  ],),
                ],
                ComponenCartCardTotal(
                  productQuantity: state.getData.length.toString(), 
                  productPrice: state.totalHarga.toString(), 
                  shipping: 'Free', 
                  total: state.totalHarga.round().toString(),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}