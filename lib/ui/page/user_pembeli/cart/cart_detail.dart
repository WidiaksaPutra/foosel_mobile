import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_bottom_nav_pembeli/cubit_detail_produk_nav_pembeli.dart';
import 'package:foosel/blocs/bloc_default/bloc/bloc/cubit_connection_example.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_dialog_basic.dart';
import 'package:foosel/blocs/bloc_detail_products/cubit_detail_navigasi_product.dart';
import 'package:foosel/blocs/bloc_detail_products/detail_product/cubit_detail_product_connect.dart';
import 'package:foosel/blocs/bloc_detail_products/state_products.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/cubit_post_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_local/cubit_get_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_local/state_transaksi.dart';
import 'package:foosel/blocs/bloc_user/main/connect/cubit_main_user_connect.dart';
import 'package:foosel/blocs/bloc_user/state_user.dart';
import 'package:foosel/routes/route_name.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_bottom_cart_button.dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_content_dialog(image_&_text).dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_header_cart.dart';
import 'package:foosel/ui/widgets/componen_cart_card_address.dart';
import 'package:foosel/ui/widgets/componen_cart_card_total.dart';
import 'package:foosel/ui/widgets/componen_cart_item_detail_vertical.dart';
import 'package:go_router/go_router.dart';

class CartDetail extends StatelessWidget with DialogBasic{
  CartDetail({Key? key}) : super(key: key);

  void read(BuildContext context) async{
    await context.read<CubitConnectionExample>().connectCheck(readBlocConnect: {}, readBlocDisconnect: {});
    context.read<CubitDetailNavigasiProduct>().navigationDetailProduct();
    await context.read<CubitMainUserConnect>().fetchUser();
  }

  void listener({
    required DataStatePostTransaksi state2,
    required BuildContext context,
  }){
    voidDialogBasic(
      context: context, 
      margin: EdgeInsets.symmetric(horizontal: ThemeBox.defaultWidthBox30, vertical: MediaQuery.of(context).size.height * 0.3),
      padding: EdgeInsets.only(left: ThemeBox.defaultWidthBox30, right: ThemeBox.defaultWidthBox30, top: ThemeBox.defaultHeightBox30),
      borderRadius: BorderRadius.circular(ThemeBox.defaultRadius10),
      color: kBlackColor6,
      closeIconStatus: false,
      barrierDismissible: true,
      contentDialog: (state2.loadingTransaksi == true)
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
          ),
      onTapCloseDialog: () => Navigator.of(context).pop(),
    );
    if(state2.loadingTransaksi == false && state2.status == true){
      Future.delayed(Duration(seconds: 2),() => context.go(RouteName.cart));
    }
  }

  void onPressed({
    required DataStateGetTransaksiLocal state,
    required BuildContext context,
  }){
    state.getData.forEach((data) async{
      await context.read<CubitPostTransaksi>().saveDataTransaksi(
        emailPembeli: data['emailPembeli'].toString(),
        emailPenjual: data['emailPenjual'].toString(),
        productsId: data['tokenId'].toString(),
        categoryId: data['idCategory'].toString(),
        total: data['hargaTotal'].toString(),
        totalPrice: data['hargaTotal'].toString(),
        shippingPrice: "0",
        quantity: data['jumlah'].toString(),
        status: "pending",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    read(context);
    Widget listCard(dynamic data){
      return BlocBuilder<CubitDetailNavigasiProduct, DataStateDetailProduct>(
        builder: (context2, state1) => ComponenCartItemDetailVertical(
          image: data['imagePath'].toString(),
          type: data['nameCategory'].toString(),
          harga: data['hargaTotal'].toString(),
          textTitle: data['name'].toString(),
          jumlah: data['jumlah'].toString(),
          onTapCard: (){
            context.read<CubitConnectionExample>().connectCheck(
              readBlocConnect: {context.read<CubitDetailProdukNavPembeli>().detailProdukNavPembeli(
                jenisDetail: "TransaksiDetail",
                readDetail: {
                  context.read<CubitDetailProductConnect>().getDetailProductConnect(idProduct: data['tokenId'].toString()),
                  context.read<CubitGetTransaksiLocal>().getDataTransaksiWhereId(tokenId: data['tokenId'].toString()),
                }
              )},
              readBlocDisconnect: {context.read<CubitDetailProdukNavPembeli>().detailProdukNavPembeli(
                jenisDetail: "TransaksiDetail", 
                readDetail: context.read<CubitGetTransaksiLocal>().getDataTransaksiWhereId(tokenId: data['tokenId'].toString()),
              )},
            );
            context.go(state1.navigation);
          }, 
        ),
      ); 
    }

    return BlocBuilder<CubitGetTransaksiLocal, DataStateGetTransaksiLocal>(
      builder: (context1, state){
        return Scaffold(
          backgroundColor: kBlackColor6,
          appBar: headerCart(
            context: context, 
            titleCart: "Checkout Details", 
            statusLeading: true,
            onPressed: () => context.go(RouteName.cart),
          ),
          bottomNavigationBar: BlocListener<CubitPostTransaksi, DataStatePostTransaksi>(
            listener: (context2, state2){
              listener(context: context2, state2: state2);
            },
            child: ComponenBottomCartButton(
              connection: true,
              harga: "", 
              textButton: "Checkout Now",
              listCart: false, 
              onPressed: () => onPressed(context: context1, state: state),
            ),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: ThemeBox.defaultWidthBox30),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.only(top: ThemeBox.defaultHeightBox30),
                  child: Text("List Items", style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16)),
                ),
                if(state.getData.isNotEmpty)...[
                  for(int i = 0; i < state.getData.length; i++)...[
                    listCard(state.getData[i]),
                  ],
                  BlocBuilder<CubitMainUserConnect, DataStateUser>( 
                    builder: (context, state1) => 
                    BlocBuilder<CubitDetailProductConnect, DataStateProducts>( 
                      builder: (context, state2){
                        return ComponenCartCardAddress(
                          storeLocation:(state2.dataProducts.user!.alamat != null) 
                          ? state2.dataProducts.user!.alamat.toString()
                          : "-",
                          yourLocation:(state1.dataUser.alamat != null)
                          ? state1.dataUser.alamat.toString()
                          : "-",
                        );
                      }
                    )
                  ),
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