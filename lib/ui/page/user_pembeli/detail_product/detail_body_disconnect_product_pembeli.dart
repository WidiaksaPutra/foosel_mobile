// ignore_for_file: must_be_immutable, unused_element
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/class/refresh_dialog.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_navigasi_role.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_show_snack_bar.dart';
import 'package:foosel/blocs/bloc_default/state/state_product_basic.dart';
import 'package:foosel/blocs/bloc_bottom_nav_pembeli/cubit_detail_produk_nav_pembeli.dart';
import 'package:foosel/blocs/bloc_bottom_nav_pembeli/state_bottom_nav_pembeli.dart';
import 'package:foosel/blocs/bloc_detail_products/detail_product/cubit_detail_products_disconnect.dart';
import 'package:foosel/blocs/bloc_like/cubit_get_like.dart';
import 'package:foosel/blocs/bloc_like/state_like.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_local/cubit_get_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_local/cubit_get_transaksi_product_local.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_local/state_transaksi.dart';
import 'package:foosel/routes/route_name.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_header_product.dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_text_column(crossStart_white_and_gray2_&_font18_and_font12_&_semi_bold_and_regular).dart';
import 'package:foosel/ui/widgets/componen_carousel_slider_image.dart';
import 'package:foosel/ui/widgets/componen_container_harga.dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_detail/componen_deskripsi_detail.dart';
import 'package:foosel/ui/widgets/componen_loading.dart';
import 'package:go_router/go_router.dart';

class DetailBodyDisconnectProductPembeli extends StatelessWidget with NavigasiRole, NavigasiRoleBarRead, ShowSnackBar, SharedPref{
  DetailBodyDisconnectProductPembeli({Key? key}) : super(key: key);

  void navigationBack({
    required BuildContext context,
    required String jenisDetail,
  }) async{
    (jenisDetail == "AllProduct")
    ? await navigasiRBR(context: context, value: 0)
    : await navigasiRBR(context: context, value: 2);
    await navigasiR();
    (jenisDetail == "Transaksi") 
    ? context.go(RouteName.cart) 
    : (jenisDetail == "TransaksiHistory")
    ? context.go(RouteName.cartHistory)
    : (jenisDetail == "TransaksiDetail")
    ? context.go(RouteName.cartDetail)
    : context.go(navigation);
  }

  void listener({
    required BuildContext context,
    required String navigation,
    required bool loading,
  }){
    if(loading == true){
      Future.delayed(
        Duration(seconds: 5),
        () => ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200),
      );
      RefreshDialog().basicRefresh(context: context, onTap: () => context.go(navigation));
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    sharedPref();
    Size size = MediaQuery.of(context).size;
    Widget contentDisconnect({
      String jumlahItem = "-",
      String jumlahTotalHarga = "-",
      required String name,
      required String nameCategory,
      required String price,
      required String description,
      required String jenisDetail,
      required String emailPenjual,
    }){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<CubitDetailProdukNavPembeli, DataStateDetailProdukNavPembeli>(
            builder: (context2, state2){
              return headerDetailProduct(
                context: context, 
                guestUser: false, 
                onPressedBack: () => navigationBack(context: context, jenisDetail: state2.jenisDetail.toString()), 
                onPressedChart: () => context.go(RouteName.cart), 
                icon: 'asset/icon/cart_Icon4.png',
              );
            },
          ),
          ComponenCarouselSliderImage(sizeWidth: size.width, imageProduct: ["asset/image/disconnect_image.jpg"], connect: false),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: ThemeBox.defaultHeightBox17),
              padding: EdgeInsets.only(top: ThemeBox.defaultHeightBox30, left: ThemeBox.defaultWidthBox30, right: ThemeBox.defaultWidthBox30, bottom: ThemeBox.defaultHeightBox30),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(ThemeBox.defaultRadius24), topRight: Radius.circular(ThemeBox.defaultRadius24))
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ComponenTextColumn_CrossStartAndWhiteGray2AndFont18Font12AndSemiBoldRegular(
                      title: name,
                      content: nameCategory,
                    ),
                    (jenisDetail == "AllProduct" || jenisDetail == "Like")
                    ? ComponenContainerHarga(
                        titleHarga: "Harga",
                        harga: price.toString(),
                      )
                    : ComponenContainerHarga(
                        titleHarga: "Harga",
                        harga: price.toString(),
                        titleItem: "Jumlah Barang",
                        jumlahItem: jumlahItem,
                        titleTotalHarga: "Total Harga",
                        jumlahTotalHarga: jumlahTotalHarga,
                      ),
                    ComponenTextDetail(title: "Description", data: description),
                    ComponenTextDetail(title: "Email Penjual", data: emailPenjual),
                    // ComponenSmallHorizontal(titleImage: "Fimiliar Product"),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }

    return BlocBuilder<CubitDetailProdukNavPembeli, DataStateDetailProdukNavPembeli>(
    builder: (context0, state0) => (state0.jenisDetail == "AllProduct")
      ? BlocConsumer<CubitDetailProductsDisconnect, DataStateProductBasic>(
          listener: (context1, state1) => listener(context: context, navigation: navigation, loading: state1.loadingApi),
          builder: (context1, state1) => (state1.loadingApi == true)
          ? ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200)
          : (state1.getData.toString() != "[]")
            ? contentDisconnect(
                name: state1.getData[0]['name'].toString(),
                nameCategory: state1.getData[0]['nameCategory'].toString(),
                price: state1.getData[0]['price'].toString(),
                description: state1.getData[0]['description'].toString(),
                emailPenjual: state1.getData[0]['email'].toString(),
                jenisDetail: "AllProduct",
              )
            : Center(child: ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200)),
        )
      : (state0.jenisDetail == "Like")
      ? BlocConsumer<CubitGetLike, DataStateGetLike>(
          listener: (context2, state2) => listener(context: context, navigation: navigation, loading: state2.loadingLike),
          builder: (context2, state2) => (state2.loadingLike == true)
          ? ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200)
          : (state2.getData.toString() != "[]")
            ? contentDisconnect(
                name: state2.getData[0]['name'].toString(),
                nameCategory: state2.getData[0]['nameCategory'].toString(),
                price: state2.getData[0]['price'].toString(),
                description: state2.getData[0]['description'].toString(),
                emailPenjual: state2.getData[0]['email'].toString(),
                jenisDetail: "Like",
              )
            : Center(child: ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200))
        )
      : (state0.jenisDetail == "TransaksiHistory")
      ? BlocConsumer<CubitGetTransaksiProductLocal, DataStateGetTransaksi>(
          listener: (context3, state3) => listener(context: context, navigation: navigation, loading: state3.loading),
          builder: (context3, state3) => (state3.loading == true)
          ? ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200)
          : (state3.dataTransaksi.toString() != "[]")
            ? contentDisconnect(
                name: state3.dataTransaksi[0]['name'].toString(),
                nameCategory: state3.dataTransaksi[0]['nameCategory'].toString(),
                price: state3.dataTransaksi[0]['price'].toString(),
                description: state3.dataTransaksi[0]['description'].toString(),
                jenisDetail: "TransaksiHistory",
                jumlahItem: state3.dataTransaksi[0]['quantity'].toString(),
                jumlahTotalHarga: state3.dataTransaksi[0]['totalPrice'].toString(),
                emailPenjual: state3.dataTransaksi[0]['usersEmailPenjual'].toString(),
              )
            : Center(child: ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200))
        )
      : BlocConsumer<CubitGetTransaksiLocal, DataStateGetTransaksiLocal>(
          listener: (context4, state4) => listener(context: context, navigation: navigation, loading: state4.loadingTransaksi),
          builder: (context4, state4) => (state4.loadingTransaksi == true)
          ? ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200)
          : (state4.getData.toString() != "[]")
            ? contentDisconnect(
                name: state4.getData[0]['name'].toString(),
                nameCategory: state4.getData[0]['nameCategory'].toString(),
                price: state4.getData[0]['hargaSatuan'].toString(),
                description: state4.getData[0]['description'].toString(),
                jenisDetail: "Transaksi",
                jumlahItem: state4.getData[0]['jumlah'].toString(),
                jumlahTotalHarga: state4.getData[0]['hargaTotal'].toString(),
                emailPenjual: state4.getData[0]['emailPenjual'].toString(),
              )
            : Center(child: ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200))
        ),
    );
  }
}