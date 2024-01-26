// ignore_for_file: must_be_immutable, unused_element, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_bottom_nav_pembeli/cubit_detail_produk_nav_pembeli.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_bottom_nav_pembeli/state_bottom_nav_pembeli.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_bottom_nav_penjual/cubit_detail_produk_disconnect_nav_penjual.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_bottom_nav_penjual/state_bottom_nav_pembeli.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_navigasi_role.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/refresh_dialog.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/show_snack_bar.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_detail_products/detail_product/cubit_detail_product_connect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_detail_products/state_products.dart';
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
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';

class DetailBodyConnectionProductPenjual extends HookWidget with navigasiRole, navigasiRoleBarRead, defaultSharedPref, showSnackBar{
  DetailBodyConnectionProductPenjual({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final listImageProduct = useState([]);
    navigationRole(BuildContext context) async{
      return BlocBuilder<CubitDetailProdukNavPenjual, DataStateDetailProdukNavPenjual>(
        builder: (context, state) => (state.jenisDetail == "AllProduct")
        ? navigasiRBR(context: context, value: 0)
        : navigasiRBR(context: context, value: 2)
      );
    }
    navigasiR();
    sharedPref();

    return BlocConsumer<CubitDetailProductConnect, DataStateProducts>(
      listener: (context, state) async{
        bool loading = await state.loading;
        if(loading == true){
          ComponenLoadingBasic(colors: kPurpleColor);
          Future.delayed(Duration(milliseconds: 5000));
          RefreshDialog().basicRefresh(context: context, onTap: () {
            prefs.remove('detailTokenId');
            context.go(navigation);
          });
        }
        if(loading == false){
          prefs.setString('emailPenerima', state.dataProducts.user!.email.toString());
          for(int i = 0 ; i < state.dataProducts.galleries!.length ; i++){
            listImageProduct.value.add(state.dataProducts.galleries![i].url.toString());
          }
        }
      },
      builder: (context, state) => (listImageProduct.value.isEmpty)
      ? Center(
          child: Lottie.asset(
            "asset/animations/loading_horizontal_lottie.json",
            height: themeBox.defaultHeightBox100,
          ),
        )
      : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerDetailProduct(
            context: context, 
            guestUser: false, 
            onPressedBack: () async{
              prefs.remove('detailTokenId');
              prefs.remove('navDetailRole');
              context.go(navigation);
            }, 
            onPressedChart: () {
              context.go(RouteName.cartDetail);
            },
          ),
          ComponenCarouselSliderImage(sizeWidth: size.width, imageProduct: listImageProduct.value, connect: true,),
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
                    ComponenTextColumn_CrossStartAndWhiteGray2AndFont18Font12AndSemiBoldRegular(title: state.dataProducts.name.toString(), content: state.dataProducts.category!.name.toString()),
                    ComponenContainerHarga(titleHarga: "Price starts from", harga: state.dataProducts.price.toString()),
                    ComponenDeskripsiDetail(titleDeskripsi: "Description", deskripsi: state.dataProducts.description.toString()),
                    ComponenSmallHorizontal(titleImage: "Fimiliar Product"),
                  ],
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}