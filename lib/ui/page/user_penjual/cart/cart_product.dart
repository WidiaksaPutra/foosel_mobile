// ignore_for_file: must_be_immutable, body_might_complete_normally_nullable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_bottom_nav_penjual/cubit_detail_produk_nav_penjual.dart';
import 'package:foosel/blocs/bloc_default/bloc/bloc/cubit_connection_example.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_dialog_basic.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_navigasi_role.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/blocs/bloc_default/state/state_connection.dart';
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
import 'package:foosel/ui/widgets/componen_loading.dart';
import 'package:foosel/ui/widgets/componen_page_kosong.dart';
import 'package:go_router/go_router.dart';

class CartProduct extends HookWidget with DialogBasic, NavigasiRoleBarRead, SharedPref{
  CartProduct({Key? key}) : super(key: key);
  
  void navigationRole(BuildContext context) async{
    await navigasiRBR(context: context, value: 2);
  }

  void read(BuildContext context) async{
    context.read<CubitConnectionExample>().connectCheck(
      readBlocConnect: context.read<CubitGetTransaksiProduct>().getDataTransaksiProductPenjual(), 
      readBlocDisconnect: {},
    );
    context.read<CubitDetailNavigasiProduct>().navigationDetailProduct();
  }

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    final statusApproval = useState<bool>(false);
    final statusRejected = useState<bool>(false);
    navigationRole(context);
    sharedPref();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBlackColor6,
      appBar: PreferredHeaderCart(
        titleCart: 'Product Cart', 
        statusLeading: true,
        onPressed: (){
          prefs.remove('usersEmailPembeli');
          context.go(RouteName.bottomNavPenjual);
        },
      ),
      body: BlocBuilder<CubitConnectionExample, DataStateConnection>(
        builder: (context1, state) => (state.connectionBoolean == true)
        ? BlocBuilder<CubitGetTransaksiProduct, DataStateGetTransaksi>(
          builder: (context2, state1) => (state1.dataTransaksi.isNotEmpty)
          ? ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: state1.dataTransaksi.length,
              itemBuilder: (context3, index){
              return BlocBuilder<CubitDetailNavigasiProduct, DataStateDetailProduct>(
                builder: (context4, stateNavDetail) => ComponenCardVertical_ImageAndTextAndButtonRejectedAndButtonSuccess(
                  textTitle: state1.dataTransaksi[index].productsName.toString(), 
                  harga: state1.dataTransaksi[index].totalPrice.toString(), 
                  connection: true,
                  image: state1.dataTransaksi[index].productsUrlImage.toString(), 
                  type: state1.dataTransaksi[index].productCategoriesName.toString(), 
                  status: state1.dataTransaksi[index].status.toString().toUpperCase(),
                  kondisi: state1.dataTransaksi[index].status.toString(), 
                  bukanTujuanKondisi: "approved",
                  onTapCard: (){
                    context.read<CubitDetailProdukNavPenjual>().detailProdukNavPenjual(
                      jenisDetail: "Transaksi",
                      readDetail: {
                        context.read<CubitGetDetailTransaksiProduct>().getDataTransaksiDetail(transactionsId: state1.dataTransaksi[index].transactionsId.toString()),
                        context.read<CubitDetailProductConnect>().getDetailProductConnect(jenisDetail: false, idProduct: state1.dataTransaksi[index].productsId.toString()),
                      }
                    );
                    context.go(stateNavDetail.navigation);
                  },
                  onTapApprove: () => voidDialogBasic(
                    context: context, 
                    margin: EdgeInsets.symmetric(horizontal: ThemeBox.defaultWidthBox30, vertical: MediaQuery.of(context).size.height * 0.3),
                    padding: EdgeInsets.only(left: ThemeBox.defaultWidthBox30, right: ThemeBox.defaultWidthBox30, top: ThemeBox.defaultHeightBox30),
                    borderRadius: BorderRadius.circular(ThemeBox.defaultRadius10),
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
                              context.read<CubitPatchTransaksi>().updateDataTransaksi(
                                transactionsId: state1.dataTransaksi[index].transactionsId.toString(), 
                                status: "approved", context: context,
                              );
                              statusApproval.value = true;
                              Future.delayed(Duration(seconds: 5), (){
                                read(context);
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
                    margin: EdgeInsets.symmetric(horizontal: ThemeBox.defaultWidthBox30, vertical: MediaQuery.of(context).size.height * 0.3),
                    padding: EdgeInsets.only(left: ThemeBox.defaultWidthBox30, right: ThemeBox.defaultWidthBox30, top: ThemeBox.defaultHeightBox30),
                    borderRadius: BorderRadius.circular(ThemeBox.defaultRadius10),
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
                              context.read<CubitPatchTransaksi>().updateDataTransaksi(
                                transactionsId: state1.dataTransaksi[index].transactionsId.toString(), 
                                status: "rejected", context: context,
                              );
                              context.read<CubitDetailNavigasiProduct>().navigationDetailProduct();
                              statusRejected.value = true;
                              Future.delayed(Duration(seconds: 5), (){
                                read(context);
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
                      : Center(child: ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200))
                    ),
                    onTapCloseDialog: () => Navigator.of(context).pop(), 
                  ),
                ),
              );
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