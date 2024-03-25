// ignore_for_file: must_be_immutable, unused_element

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_bottom_nav_penjual/cubit_detail_produk_nav_penjual.dart';
import 'package:foosel/blocs/bloc_bottom_nav_penjual/state_bottom_nav_pembeli.dart';
import 'package:foosel/blocs/bloc_default/class/class/refresh_dialog.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_navigasi_role.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_show_snack_bar.dart';
import 'package:foosel/blocs/bloc_default/state/state_product_basic.dart';
import 'package:foosel/blocs/bloc_detail_products/detail_product/cubit_detail_products_disconnect.dart';
import 'package:foosel/blocs/bloc_like/cubit_get_like.dart';
import 'package:foosel/blocs/bloc_like/state_like.dart';
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

class DetailBodyDisconnectProductPenjual extends StatelessWidget with NavigasiRole, NavigasiRoleBarRead, ShowSnackBar, SharedPref{
  DetailBodyDisconnectProductPenjual({Key? key}) : super(key: key);

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

    navigationRole(BuildContext context) async{
      return BlocBuilder<CubitDetailProdukNavPenjual, DataStateDetailProdukNavPenjual>(
        builder: (context, state) => (state.jenisDetail == "AllProduct")
        ? navigasiRBR(context: context, value: 0)
        : navigasiRBR(context: context, value: 2)
      );
    }
    navigasiR();
  
    Widget contentDisconnect({
      required String name,
      required String category,
      required String harga,
      required String description,
    }){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerDetailProduct(
            context: context, 
            guestUser: true, 
            onPressedBack: () => context.go(navigation), 
            onPressedChart: () => context.go(RouteName.cartDetail),
            icon: 'asset/icon/cart_Icon4.png',
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
                      content: category,
                    ),
                    ComponenContainerHarga(titleHarga: "Harga", harga: harga),
                    ComponenTextDetail(title: "Description", data: description),
                    // ComponenSmallHorizontal(titleImage: "Fimiliar Product"),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }

    return BlocBuilder<CubitDetailProdukNavPenjual, DataStateDetailProdukNavPenjual>(
    builder: (context1, state1) => (state1.jenisDetail == "AllProduct")
    ? BlocConsumer<CubitDetailProductsDisconnect, DataStateProductBasic>(
        listener: (context2, state2) => listener(
          context: context2,
          loading: state2.loadingApi, 
          navigation: navigation,
        ),
        builder: (context3, state3) => (state3.getData.toString() != "[]")
        ? contentDisconnect(
            name: state3.getData[0]['name'].toString(),
            category: state3.getData[0]['nameCategory'].toString(), 
            description: state3.getData[0]['description'].toString(),
            harga: state3.getData[0]['price'].toString(),
          )
        : Center(child: ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200)),
      )
    : BlocConsumer<CubitGetLike, DataStateGetLike>(
        listener: (context4, state4) => listener(
          context: context4,
          loading: state4.loadingLike, 
          navigation: navigation,
        ),
        builder: (context5, state5) => (state5.getData.toString() != "[]")
        ? contentDisconnect(
            name: state5.getData[0]['name'].toString(),
            category: state5.getData[0]['nameCategory'].toString(), 
            description: state5.getData[0]['description'].toString(),
            harga: state5.getData[0]['price'].toString(),
          )
        : Center(child: ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200)),
      ),
    );
  }
}