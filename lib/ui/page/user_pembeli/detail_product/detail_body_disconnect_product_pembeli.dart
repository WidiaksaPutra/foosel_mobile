// ignore_for_file: must_be_immutable, unused_element
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/refresh_dialog.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/state_default/state_product_basic.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_bottom_nav_pembeli/cubit_detail_produk_nav_pembeli.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_bottom_nav_pembeli/state_bottom_nav_pembeli.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_navigasi_role.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/show_snack_bar.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_detail_products/detail_product/cubit_detail_products_disconnect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_like/cubit_get_like.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_like/state_like.dart';
import 'package:flutter_laravel_toko_sepatu/routes/route_name.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_advanced/componen_text_column(crossStart_white_and_gray2_&_font18_and_font12_&_semi_bold_and_regular).dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_carousel_slider_image.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_container_harga.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_deskripsi_detail.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_header/componen_header_product.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_loading.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_small_horizontal.dart';
import 'package:go_router/go_router.dart';

class DetailBodyDisconnectProductPembeli extends StatelessWidget with navigasiRole, navigasiRoleBarRead, showSnackBar, defaultSharedPref{
  DetailBodyDisconnectProductPembeli({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sharedPref();
    Size size = MediaQuery.of(context).size;

    navigationRole(BuildContext context) async{
      return BlocBuilder<CubitDetailProdukNavPembeli, DataStateDetailProdukNavPembeli>(
        builder: (context, state) => (state.jenisDetail == "AllProduct")
        ? navigasiRBR(context: context, value: 0)
        : navigasiRBR(context: context, value: 2)
      );
    }
    navigasiR();
    
    Widget contentDisconnect(dynamic state){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerDetailProduct(
            context: context, 
            guestUser: false, 
            onPressedBack: () async{
              prefs.remove('emailPenerima');
              prefs.remove('detailTokenId');
              prefs.remove('navDetailRole');
              context.go(navigation);
            }, 
            onPressedChart: () {
              context.go(RouteName.cartDetail);
            },
          ),
          ComponenCarouselSliderImage(sizeWidth: size.width, imageProduct: ["asset/image/sampel_sepatu_home_small_4.png"], connect: false),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: themeBox.defaultHeightBox17),
              padding: EdgeInsets.only(top: themeBox.defaultHeightBox30, left: themeBox.defaultWidthBox30, right: themeBox.defaultWidthBox30, bottom: themeBox.defaultHeightBox30),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(themeBox.defaultRadius24), topRight: Radius.circular(themeBox.defaultRadius24))
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ComponenTextColumn_CrossStartAndWhiteGray2AndFont18Font12AndSemiBoldRegular(
                      title: state.getData[0]['name'].toString(), 
                      content: state.getData[0]['nameCategory'].toString(),
                    ),
                    ComponenContainerHarga(titleHarga: "Price starts from", harga: state.getData[0]['price'].toString()),
                    ComponenDeskripsiDetail(titleDeskripsi: "Description", deskripsi: state.getData[0]['description'].toString()),
                    ComponenSmallHorizontal(titleImage: "Fimiliar Product"),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }

    return BlocBuilder<CubitDetailProdukNavPembeli, DataStateDetailProdukNavPembeli>(
    builder: (context, state) => (state.jenisDetail == "AllProduct")
    ? BlocConsumer<CubitDetailProductsDisconnect, DataStateProductBasic>(
        listener: (context, state1){
          if(state1.loadingApi == true){
            ComponenLoadingBasic(colors: kPurpleColor);
            Future.delayed(Duration(milliseconds: 5000));
            RefreshDialog().basicRefresh(context: context, onTap: () {
              prefs.remove('emailPenerima');
              prefs.remove('detailTokenId');
              context.go(navigation);
            });
          }
        },
        builder: (context, state1) => (state1.loadingApi == true)
        ? ComponenLoadingBasic(colors: kPurpleColor)
        : contentDisconnect(state1)
      )
    : BlocConsumer<CubitGetLike, DataStateGetLike>(
        listener: (context, state2){
          if(state2.loadingLike == true){
            ComponenLoadingBasic(colors: kPurpleColor);
            Future.delayed(Duration(milliseconds: 5000));
            RefreshDialog().basicRefresh(context: context, onTap: () {
              prefs.remove('emailPenerima');
              prefs.remove('detailTokenId');
              context.go(navigation);
            });
          }
        },
        builder: (context, state2) => (state2.loadingLike == true)
        ? ComponenLoadingBasic(colors: kPurpleColor)
        : contentDisconnect(state2)
      )
    );
  }
}