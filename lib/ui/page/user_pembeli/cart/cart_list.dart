// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_bottom_nav_pembeli/cubit_detail_produk_nav_pembeli.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/cubit_connection_example.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/state_default/state_connection.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_detail_products/cubit_detail_navigasi_product.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_detail_products/detail_product/cubit_detail_product_connect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_detail_products/state_products.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_api/cubit_get_transaksi_product.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_local/cubit_delete_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_local/cubit_get_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_local/cubit_get_transaksi_product_local.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_local/cubit_update_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_local/state_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_user/cubit_connection_main_user.dart';
import 'package:flutter_laravel_toko_sepatu/routes/route_name.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_advanced/componen_bottom_cart_button.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_advanced/componen_card_vertical(image_&_text_&_button_add_&_button_min_&_button_delete).dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_basic/componen_dash_border_box.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_header/componen_header_cart.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_loading.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_page_kosong.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_text_button_152x44.dart';
import 'package:go_router/go_router.dart';

class Cart extends StatelessWidget{
  Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    context.read<CubitGetTransaksiLocal>().GetDataTransaksi();
    context.read<cubitDetailNavigasiProduct>().navigationDetailProduct();
    context.read<CubitGetTransaksiProduct>().GetDataTransaksiHistory();
    context.read<CubitGetTransaksiProductLocal>().GetDataTransaksi();
    context.read<cubitConnectionExample>().connectCheck(readBlocConnect: {}, readBlocDisconnect: {});
   
    Widget History(){
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox22),
        child: ComponenDashBorderBox(
          borderRadiusBox: themeBox.defaultRadius5, 
          borderSideColor: kWhiteColor, 
          borderSideWidth: 1.0, 
          dashLengthBox: 5.0,
          contentBox: TextButton(
            onPressed: () => context.go(RouteName.cartHistory),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: themeBox.defaultHeightBox20,
                horizontal: themeBox.defaultWidthBox20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.update, color: kWhiteColor, weight: themeBox.defaultWidthBox35),
                      Text(" History", style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16)),
                    ],
                  ),
                  const Icon(Icons.arrow_forward_ios, color: kPurpleColor,)
                ],
              ),
            ),
          )
        ),
      );
    }

    return BlocBuilder<CubitGetTransaksiLocal, DataStateGetTransaksiLocal>(
      builder: (context1, state){
        return Scaffold(
          backgroundColor: kBlackColor6,
          appBar: headerCart(
            context: context, 
            titleCart: 'Your Cart', 
            statusLeading: true, 
            statusNav: '', 
            navigationCart: RouteName.bottomNavPembeli, 
            navBack: '',
          ),
          bottomNavigationBar: (state.getData.isNotEmpty)
          ? BlocBuilder<cubitConnectionExample, DataStateConnection>(
              builder: (context, stateConnect) => ComponenBottomCartButton(
                connection: stateConnect.connectionBoolean,
                harga: state.totalHarga.toString(),
                textButton: "Continue to Checkout",
                listCart: true,
                onPressed: () async{
                  if(state.getData.isNotEmpty){
                    for(int i = 0 ; i < state.getData.length; i++){
                      await context.read<CubitDetailProductConnect>().GetDetailProductConnect(state.getData[i]['tokenId'].toString());
                    }
                  }
                  await context.read<cubitConnectionMainUser>().connectCheck(context);
                  context.go(RouteName.cartDetail);
                },
              )
            )
          : SizedBox(),
          body: (state.loadingTransaksi == false)
          ? (state.getData.isEmpty)
            ? SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: themeBox.defaultHeightBox16,),
                  BlocBuilder<cubitConnectionExample, DataStateConnection>(
                    builder: (context, stateConnect) => (stateConnect.connectionBoolean == true)
                    ? BlocBuilder<CubitGetTransaksiProduct, DataStateGetTransaksi>(
                        builder: (context2, state) => (state.dataTransaksi.isNotEmpty) ? History() : SizedBox(),
                      )
                    : BlocBuilder<CubitGetTransaksiProductLocal, DataStateGetTransaksi>(
                        builder: (context2, state) => (state.dataTransaksi.isNotEmpty) ? History() : SizedBox(),
                      )
                  ),
                  ComponenPageKosong(
                    image: "asset/animations/cart_lottie.json",
                    titleText: "Opss! Your Cart is Empty", 
                    messageText: "Let's find your favorite product", 
                    componenTextButton_152x44: ComponenTextButton_152x44_Basic(
                      text: "Explore Store", 
                      page: RouteName.bottomNavPembeli, 
                      buttonColor: kPurpleColor,), 
                    sizeHeight: size.height - themeBox.defaultHeightBox250, 
                    sizeWidth: size.width,
                  ),
                ],
              ),
            )
            : SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(children: [
                SizedBox(height: themeBox.defaultHeightBox16,),
                BlocBuilder<cubitConnectionExample, DataStateConnection>(
                  builder: (context, stateConnect) => (stateConnect.connectionBoolean == true)
                  ? BlocBuilder<CubitGetTransaksiProduct, DataStateGetTransaksi>(
                      builder: (context2, state) => (state.dataTransaksi.isNotEmpty) ? History() : SizedBox(),
                    )
                  : BlocBuilder<CubitGetTransaksiProductLocal, DataStateGetTransaksi>(
                      builder: (context2, state) => (state.dataTransaksi.isNotEmpty) ? History() : SizedBox(),
                    )
                ),
                for(int index = 0; index < state.getData.length; index++)...[
                  BlocBuilder<cubitConnectionExample, DataStateConnection>(
                    builder: (context, stateConnect) => BlocBuilder<cubitDetailNavigasiProduct, DataStateDetailProduct>(
                      builder: (context, state1) => ComponenCardVertical_ImageAndTextAndButtonAddAndButtonMinAndButtonDelete(
                        image: state.getData[index]['imagePath'].toString(),
                        iconAdd: "asset/icon/add_item.png",
                        iconMin: "asset/icon/minus_item.png",
                        textTitle: state.getData[index]['name'].toString(),
                        harga: state.getData[index]['hargaTotal'].toString(),
                        jumlah: state.getData[index]['jumlah'].toString(),
                        onTapAdd: ()async{
                          await context.read<CubitUpdateTransaksiLocal>().UpdateDataTransaksiLocal(
                            tokenId: state.getData[index]['tokenId'].toString(), 
                            jumlah: double.parse(state.getData[index]['jumlah'].toString()).toInt()+1, 
                            hargaTotal: ((double.parse(state.getData[index]['hargaSatuan'].toString()).toInt()) * (double.parse(state.getData[index]['jumlah'].toString()).toInt()+1)).toString(),
                          );
                          await context.read<CubitGetTransaksiLocal>().GetDataTransaksi();
                        },
                        onTapMin: () {
                          if(double.parse(state.getData[index]['jumlah'].toString()).toInt() == 1){
                            context.read<CubitDeleteTransaksiLocal>().DeleteDataTransaksi(tokenId: state.getData[index]['tokenId'].toString());
                            context.read<CubitGetTransaksiLocal>().GetDataTransaksi();
                          }
                          if(double.parse(state.getData[index]['jumlah'].toString()).toInt() > 1){
                            context.read<CubitUpdateTransaksiLocal>().UpdateDataTransaksiLocal(
                              tokenId: state.getData[index]['tokenId'].toString(), 
                              jumlah: double.parse(state.getData[index]['jumlah'].toString()).toInt()-1, 
                              hargaTotal: ((double.parse(state.getData[index]['hargaSatuan'].toString()).toInt()) * (double.parse(state.getData[index]['jumlah'].toString()).toInt()-1)).toString(),
                            );
                            context.read<CubitGetTransaksiLocal>().GetDataTransaksi();
                          }
                        },
                        onTapDelete: () {
                          context.read<CubitDeleteTransaksiLocal>().DeleteDataTransaksi(tokenId: state.getData[index]['tokenId'].toString());
                          context.read<CubitGetTransaksiLocal>().GetDataTransaksi();
                        }, 
                        onTapCard: () {
                          context.read<cubitConnectionExample>().connectCheck(
                            readBlocConnect: {context.read<CubitDetailProdukNavPembeli>().DetailProdukNavPembeli(
                              jenisDetail: "Transaksi",
                              readDetail: context.read<CubitDetailProductConnect>().GetDetailProductConnect(state.getData[index]['tokenId'].toString())
                            )},
                            readBlocDisconnect: {context.read<CubitDetailProdukNavPembeli>().DetailProdukNavPembeli(
                              jenisDetail: "Transaksi", 
                              readDetail: context.read<CubitGetTransaksiLocal>().GetDataTransaksiWhereId(tokenId: state.getData[index]['tokenId'].toString())
                            )},
                          );
                          context.go(state1.navigation);
                        }, 
                        connection: stateConnect.connectionBoolean,
                      ),
                    ),
                  ),
                ]
              ],),
            )
          : ComponenLoadingBasic(colors: kPurpleColor)
        );
      }
    );
  }
}