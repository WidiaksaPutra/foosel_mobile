// ignore_for_file: must_be_immutable, body_might_complete_normally_nullable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_bottom_nav_penjual/cubit_detail_produk_nav_penjual.dart';
import 'package:foosel/blocs/bloc_default/default/cubit_connection_example.dart';
import 'package:foosel/blocs/bloc_default/default/default_navigasi_role.dart';
import 'package:foosel/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:foosel/blocs/bloc_default/default/show_dialog_basic.dart';
import 'package:foosel/blocs/bloc_default/state_default/state_connection.dart';
import 'package:foosel/blocs/bloc_detail_products/cubit_detail_navigasi_product.dart';
import 'package:foosel/blocs/bloc_detail_products/detail_product/cubit_detail_product_connect.dart';
import 'package:foosel/blocs/bloc_detail_products/state_products.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/cubit_get_detail_transaksi_product.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/cubit_get_transaksi_product.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/cubit_patch_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:foosel/routes/route_name.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_konstanta.dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_card_vertical(image_&_text_&_button_rejected_&_button_success).dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_content_dialog(image_&_text).dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_content_dialog(image_&_title_text_&_button_yes_and_button_no).dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_header_cart.dart';
import 'package:foosel/ui/widgets/componen_page_kosong.dart';
import 'package:go_router/go_router.dart';

class CartProduct extends HookWidget with dialogBasic, navigasiRoleBarRead, defaultSharedPref{
  CartProduct({Key? key}) : super(key: key);
  
  void navigationRole(BuildContext context) async{
    await navigasiRBR(context: context, value: 2);
  }

  void read(BuildContext context) async{
    context.read<cubitConnectionExample>().connectCheck(
      readBlocConnect: context.read<CubitGetTransaksiProduct>().GetDataTransaksiHistory(), 
      readBlocDisconnect: {},
    );
    await context.read<cubitDetailNavigasiProduct>().navigationDetailProduct();
  }

  @override
  Widget build(BuildContext context) {
    final statusApproval = useState<bool>(false);
    final statusRejected = useState<bool>(false);
    navigationRole(context);
    read(context);
    sharedPref();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBlackColor6,
      appBar: headerCart(
        context: context, 
        titleCart: 'Product Cart', 
        statusLeading: true,
        onPressed: (){
          prefs.remove('usersEmailPembeli');
          context.go(RouteName.bottomNavPenjual);
        },
      ),
      body: BlocBuilder<cubitConnectionExample, DataStateConnection>(
        builder: (context1, state) => (state.connectionBoolean == true)
        ? BlocBuilder<CubitGetTransaksiProduct, DataStateGetTransaksi>(
          builder: (context2, state1) => (state1.dataTransaksi.isNotEmpty)
          ? ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: state1.dataTransaksi.length,
              itemBuilder: (context3, index){
              return BlocBuilder<cubitDetailNavigasiProduct, DataStateDetailProduct>(
                builder: (context4, stateNavDetail) => Column(
                  children: [
                    if(state1.dataTransaksi[index]['usersEmailPembeli'].toString() == state1.dataTransaksi[index]['usersEmailPembeliOnClick'].toString())...[
                      ComponenCardVertical_ImageAndTextAndButtonRejectedAndButtonSuccess(
                        textTitle: state1.dataTransaksi[index]['name'].toString(), 
                        harga: state1.dataTransaksi[index]['price'].toString(), 
                        connection: true,
                        image: state1.dataTransaksi[index]['imagePath'].toString(), 
                        type: state1.dataTransaksi[index]['nameCategory'].toString(), 
                        status: state1.dataTransaksi[index]['status'].toString().toUpperCase(),
                        kondisi: state1.dataTransaksi[index]['status'].toString(), 
                        bukanTujuanKondisi: "approved",
                        onTapCard: () async {
                          context.read<CubitDetailProdukNavPenjual>().DetailProdukNavPenjual(
                            jenisDetail: "Transaksi",
                            readDetail: {
                              await context.read<CubitGetDetailTransaksiProduct>().GetDataTransaksiDetail(transactionsId: state1.dataTransaksi[index]['tokenTransaksi'].toString()),
                              context.read<CubitDetailProductConnect>().GetDetailProductConnect(jenisDetail: false, idProduct: state1.dataTransaksi[index]['tokenProduct'].toString()),
                            }
                          );
                          context.go(stateNavDetail.navigation);
                        },
                        onTapApprove: () => voidDialogBasic(
                          context: context, 
                          margin: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox30, vertical: MediaQuery.of(context).size.height * 0.3),
                          padding: EdgeInsets.only(left: themeBox.defaultWidthBox30, right: themeBox.defaultWidthBox30, top: themeBox.defaultHeightBox30),
                          borderRadius: BorderRadius.circular(themeBox.defaultRadius10),
                          color: kBlackColor6,
                          closeIconStatus: true,
                          barrierDismissible: false,
                          contentDialog: BlocBuilder<CubitPatchTransaksi, DataStatePatchTransaksi>(
                            builder: (context, state2) => (state2.loadingTransaksi == false)
                            ? (statusApproval.value == false)
                              ? ComponenContentDialog_ImageAndTitleTextAndButtonYesAndButtonNo(
                                  primaryColorYes: kGreenColor,
                                  image: 'asset/animations/peringatan_lottie.json',
                                  titleText: apakahTransaksiApproved,
                                  onTapYes: (){
                                    context.read<CubitPatchTransaksi>().UpdateDataTransaksi(
                                      transactionsId: state1.dataTransaksi[index]['tokenTransaksi'].toString(), 
                                      status: "approved", context: context,
                                    );
                                    statusApproval.value = true;
                                    Future.delayed(Duration(seconds: 5), (){
                                      statusApproval.value = false;
                                      Navigator.of(context).pop();
                                    });
                                  },
                                )
                              : (state2.status == true)
                                ? ComponenContentDialog_ImageAndTitleText(
                                    image: 'asset/animations/check_lottie.json',
                                    text: 'Berhasil...',
                                  )
                                : ComponenContentDialog_ImageAndTitleText(
                                    image: 'asset/animations/close_lottie.json', 
                                    text: 'Gagal..!',
                                  )
                            : ComponenContentDialog_ImageAndTitleText(
                                image: 'asset/animations/loading_dialog_lottie.json', 
                                text: '...',
                              )
                          ),
                          onTapCloseDialog: () => Navigator.of(context).pop(), 
                        ),
                        onTapReject: () => voidDialogBasic(
                          context: context, 
                          margin: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox30, vertical: MediaQuery.of(context).size.height * 0.3),
                          padding: EdgeInsets.only(left: themeBox.defaultWidthBox30, right: themeBox.defaultWidthBox30, top: themeBox.defaultHeightBox30),
                          borderRadius: BorderRadius.circular(themeBox.defaultRadius10),
                          color: kBlackColor6,
                          closeIconStatus: true,
                          barrierDismissible: false,
                          contentDialog: BlocBuilder<CubitPatchTransaksi, DataStatePatchTransaksi>(
                            builder: (context, state2) => (state2.loadingTransaksi == false)
                            ? (statusRejected.value == false)
                              ? ComponenContentDialog_ImageAndTitleTextAndButtonYesAndButtonNo(
                                  primaryColorYes: kGreenColor,
                                  image: 'asset/animations/peringatan_lottie.json',
                                  titleText: apakahTransaksiRejected,
                                  onTapYes: () {
                                    context.read<CubitPatchTransaksi>().UpdateDataTransaksi(
                                      transactionsId: state1.dataTransaksi[index]['tokenTransaksi'].toString(), 
                                      status: "rejected", context: context,
                                    );
                                    context.read<cubitDetailNavigasiProduct>().navigationDetailProduct();
                                    statusRejected.value = true;
                                    Future.delayed(Duration(seconds: 5), (){
                                      statusRejected.value = false;
                                      Navigator.of(context).pop();
                                    });
                                  },
                                )
                              : (state2.status == true)
                                ? ComponenContentDialog_ImageAndTitleText(
                                    image: 'asset/animations/check_lottie.json',
                                    text: 'Berhasil...',
                                  )
                                : ComponenContentDialog_ImageAndTitleText(
                                    image: 'asset/animations/close_lottie.json', 
                                    text: 'Gagal..!',
                                  )
                            : ComponenContentDialog_ImageAndTitleText(
                                image: 'asset/animations/loading_dialog_lottie.json', 
                                text: '...',
                              )
                          ),
                          onTapCloseDialog: () => Navigator.of(context).pop(), 
                        ),
                      ),
                    ]
                  ],
                ));
              }
            )
          : ComponenPageKosongBasic(
              image: "asset/animations/cart_lottie.json", 
              titleText: "Opss! Your Cart is Empty", 
              messageText: "Let's find your favorite product",
              sizeHeight: size.height, 
              sizeWidth: size.width,
            ),
          )
        : ComponenPageKosongBasic(
            image: "asset/animations/cart_lottie.json", 
            titleText: "Opss! Your Cart is Empty", 
            messageText: "Let's find your favorite product", 
            sizeHeight: size.height, 
            sizeWidth: size.width,
          ),
      ),
    );
  }
}