// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_bottom_nav_pembeli/cubit_detail_produk_nav_pembeli.dart';
import 'package:foosel/blocs/bloc_default/bloc/bloc/cubit_connection_example.dart';
import 'package:foosel/blocs/bloc_default/state/state_connection.dart';
import 'package:foosel/blocs/bloc_detail_products/cubit_detail_navigasi_product.dart';
import 'package:foosel/blocs/bloc_detail_products/detail_product/cubit_detail_product_connect.dart';
import 'package:foosel/blocs/bloc_detail_products/state_products.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/cubit_get_transaksi_product.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_local/cubit_delete_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_local/cubit_get_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_local/cubit_get_transaksi_product_local.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_local/cubit_update_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_local/state_transaksi.dart';
import 'package:foosel/routes/route_name.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_bottom_cart_button.dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_card_vertical(image_&_text_&_button_add_&_button_min_&_button_delete).dart';
import 'package:foosel/ui/widgets/componen_basic/componen_dash_border_box.dart';
import 'package:foosel/ui/widgets/componen_loading.dart';
import 'package:foosel/ui/widgets/componen_page_kosong.dart';
import 'package:go_router/go_router.dart';

class Cart extends StatelessWidget{
  Cart({Key? key}) : super(key: key);

  void read(BuildContext context) async{
    await context.read<CubitGetTransaksiLocal>().getDataTransaksi();
    context.read<CubitDetailNavigasiProduct>().navigationDetailProduct();
    await context.read<CubitGetTransaksiProduct>().getDataTransaksiHistory();
    await context.read<CubitGetTransaksiProductLocal>().getDataTransaksi();
    await context.read<CubitConnectionExample>().connectCheck(readBlocConnect: {}, readBlocDisconnect: {});
  }

  Widget cardListTransaction(dynamic data){
    return BlocBuilder<CubitConnectionExample, DataStateConnection>(
      builder: (context, stateConnect) => BlocBuilder<CubitDetailNavigasiProduct, DataStateDetailProduct>(
        builder: (context, state1) => ComponenCardVertical_ImageAndTextAndButtonAddAndButtonMinAndButtonDelete(
          image: data['imagePath'].toString(),
          iconAdd: "asset/icon/add_item.png",
          iconMin: "asset/icon/minus_item.png",
          type: data['nameCategory'].toString(),
          textTitle: data['name'].toString(),
          harga: data['hargaTotal'].toString(),
          jumlah: data['jumlah'].toString(),
          onTapAdd: () {
            context.read<CubitUpdateTransaksiLocal>().updateDataTransaksiLocal(
              tokenId: data['tokenId'].toString(), 
              jumlah: double.parse(data['jumlah'].toString()).toInt()+1, 
              hargaTotal: ((double.parse(data['hargaSatuan'].toString()).toInt()) * (double.parse(data['jumlah'].toString()).toInt()+1)).toString(),
            );
            context.read<CubitGetTransaksiLocal>().getDataTransaksi();
          },
          onTapMin: () {
            if(double.parse(data['jumlah'].toString()).toInt() == 1){
              context.read<CubitDeleteTransaksiLocal>().deleteDataTransaksi(tokenId: data['tokenId'].toString());
              context.read<CubitGetTransaksiLocal>().getDataTransaksi();
            }
            if(double.parse(data['jumlah'].toString()).toInt() > 1){
              context.read<CubitUpdateTransaksiLocal>().updateDataTransaksiLocal(
                tokenId: data['tokenId'].toString(), 
                jumlah: double.parse(data['jumlah'].toString()).toInt()-1, 
                hargaTotal: ((double.parse(data['hargaSatuan'].toString()).toInt()) * (double.parse(data['jumlah'].toString()).toInt()-1)).toString(),
              );
              context.read<CubitGetTransaksiLocal>().getDataTransaksi();
            }
          },
          onTapDelete: () {
            context.read<CubitDeleteTransaksiLocal>().deleteDataTransaksi(tokenId: data['tokenId'].toString());
            context.read<CubitGetTransaksiLocal>().getDataTransaksi();
          }, 
          onTapCard: () {
            context.read<CubitConnectionExample>().connectCheck(
              readBlocConnect: {context.read<CubitDetailProdukNavPembeli>().detailProdukNavPembeli(
                jenisDetail: "Transaksi",
                readDetail: {
                  context.read<CubitDetailProductConnect>().getDetailProductConnect(idProduct: data['tokenId'].toString()),
                  context.read<CubitGetTransaksiLocal>().getDataTransaksiWhereId(tokenId: data['tokenId'].toString()),
                }
              )},
              readBlocDisconnect: {context.read<CubitDetailProdukNavPembeli>().detailProdukNavPembeli(
                jenisDetail: "Transaksi", 
                readDetail: context.read<CubitGetTransaksiLocal>().getDataTransaksiWhereId(tokenId: data['tokenId'].toString())
              )},
            );
            context.go(state1.navigation);
          }, 
          connection: stateConnect.connectionBoolean,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    Size size = MediaQuery.of(context).size;
    read(context);
    Widget History(){
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: ThemeBox.defaultWidthBox22),
        child: ComponenDashBorderBox(
          borderRadiusBox: ThemeBox.defaultRadius5, 
          borderSideColor: kWhiteColor, 
          borderSideWidth: 1.0, 
          dashLengthBox: 5.0,
          contentBox: TextButton(
            onPressed: (){
              context.read<CubitConnectionExample>().connectCheck(
                readBlocConnect: context.read<CubitGetTransaksiProduct>().getDataTransaksiHistory(), 
                readBlocDisconnect: context.read<CubitGetTransaksiProductLocal>().getDataTransaksi(),
              );
              context.read<CubitDetailNavigasiProduct>().navigationDetailProduct();
              return context.go(RouteName.cartHistory);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: ThemeBox.defaultHeightBox20,
                horizontal: ThemeBox.defaultWidthBox20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.update, color: kWhiteColor, weight: ThemeBox.defaultWidthBox35),
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
          bottomNavigationBar: (state.getData.isNotEmpty)
          ? BlocBuilder<CubitConnectionExample, DataStateConnection>(
              builder: (context, stateConnect) => ComponenBottomCartButton(
                connection: stateConnect.connectionBoolean,
                harga: state.totalHarga.toString(),
                textButton: "Continue to Checkout",
                listCart: true,
                onPressed: () async{
                  if(state.getData.isNotEmpty){
                    for(int i = 0; i < state.getData.length; i++){
                      await context.read<CubitDetailProductConnect>().getDetailProductConnect(idProduct: state.getData[i]['tokenId'].toString());
                    }
                    context.go(RouteName.cartDetail);
                  }
                },
              )
            )
          : SizedBox(),
          body: (state.loadingTransaksi == false)
          ? SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: ThemeBox.defaultHeightBox16,),
                  BlocBuilder<CubitConnectionExample, DataStateConnection>(
                    builder: (context, stateConnect) => (stateConnect.connectionBoolean == true)
                    ? BlocBuilder<CubitGetTransaksiProduct, DataStateGetTransaksi>(
                        builder: (context2, state) => (state.dataTransaksi.isEmpty) ? SizedBox() : History(),
                      )
                    : BlocBuilder<CubitGetTransaksiProductLocal, DataStateGetTransaksi>(
                        builder: (context2, state) => (state.dataTransaksi.isEmpty) ? SizedBox() : History(),
                      )
                  ),
                  if(state.getData.isEmpty)...[
                    ComponenPageKosongBasic(
                      image: "asset/animations/cart_lottie.json", 
                      titleText: "Opss! Your Cart is Empty", 
                      messageText: "Let's find your favorite product", 
                      sizeHeight: size.height, 
                      sizeWidth: size.width,
                    )
                  ]else...[
                    for(int i = 0; i < state.getData.length; i++)...[
                      cardListTransaction(state.getData[i]),
                    ]
                  ]
                ],
              ),
            )
          : ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200)
        );
      }
    );
  }
}