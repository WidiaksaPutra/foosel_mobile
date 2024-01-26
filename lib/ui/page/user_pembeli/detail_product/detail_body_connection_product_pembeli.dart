// ignore_for_file: must_be_immutable, unused_element, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_bottom_nav_pembeli/cubit_detail_produk_nav_pembeli.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_bottom_nav_pembeli/state_bottom_nav_pembeli.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_navigasi_role.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/refresh_dialog.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/show_snack_bar.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_detail_products/detail_product/cubit_detail_product_connect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_detail_products/state_products.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_like/cubit_like.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_like/state_like.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_local/cubit_get_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/routes/route_name.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_konstanta.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_carousel_slider_image.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_container_harga.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_deskripsi_detail.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_header/componen_header_product.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_loading.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_row_like.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_small_horizontal.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';

class DetailBodyConnectionProductPembeli extends HookWidget with navigasiRole, navigasiRoleBarRead, defaultSharedPref, showSnackBar{
  DetailBodyConnectionProductPembeli({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final listImageProduct = useState([]);
    // var navTransaksi = useState(false);
    navigationRole(BuildContext context) async{
      return BlocBuilder<CubitDetailProdukNavPembeli, DataStateDetailProdukNavPembeli>(
        builder: (context, state){
        return (state.jenisDetail == "AllProduct")
        ? navigasiRBR(context: context, value: 0)
        : (state.jenisDetail == "Transaksi")
          ? navigasiRBR(context: context, value: 1)
          : navigasiRBR(context: context, value: 2);}
      );
    }
    navigasiR();
    sharedPref();

    return BlocConsumer<CubitDetailProductConnect, DataStateProducts>(
      listener: (context, state) async{
        bool loading = await state.loading;
        if(loading == true){
          ComponenLoadingBasic(colors: kPurpleColor);
          RefreshDialog().basicRefresh(context: context, onTap: () {
            prefs.remove('emailPenerima');
            prefs.remove('detailTokenId');
            // (navTransaksi.value == true)
            // ? context.go(RouteName.cart)
            // : 
            context.go(navigation);
          });
        }
        if(loading == false){
          prefs.setString('emailPenerima', state.dataProducts.user!.email.toString());
          for(int i = 0 ; i < state.dataProducts.galleries!.length ; i++){
            listImageProduct.value.add(state.dataProducts.galleries![i].url.toString());
          }
        }
        context.read<cubitLike>().GetLikeInit(tokenId: state.dataProducts.tokenId.toString());
        context.read<CubitGetTransaksiLocal>().GetDataTransaksiWhereId(tokenId: state.dataProducts.tokenId.toString());
      },
      builder: (context, state) => Column(
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
          (listImageProduct.value.isNotEmpty)
          ? ComponenCarouselSliderImage(sizeWidth: size.width, imageProduct: listImageProduct.value, connect: true)
          : Center(
              child: Lottie.asset(
                "asset/animations/loading_horizontal_lottie.json",
                height: themeBox.defaultHeightBox100,
              ),
            ),
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
                    BlocBuilder<cubitLike, DataStateLike>(
                      builder: (context, state1){
                      return (listImageProduct.value.isEmpty && state1.loadingLike == true)
                      ? Center(
                          child: Lottie.asset(
                            "asset/animations/loading_horizontal_lottie.json",
                            height: themeBox.defaultHeightBox50,
                          ),
                        )
                      : ComponenRowLike(
                          name: state.dataProducts.category!.name.toString(), 
                          categoryName: state.dataProducts.name.toString(),
                          like: state1.statusLike,
                          onTap: (){
                            context.read<cubitLike>().GetLikeOnClick(
                              tokenId: state.dataProducts.tokenId.toString(), 
                              name: state.dataProducts.name.toString(), 
                              categoryName: state.dataProducts.category!.name.toString(),
                              description: state.dataProducts.description.toString(), 
                              price: state.dataProducts.price.toString(), 
                              imagePath: "${Api.baseURLImage}${state.dataProducts.urlImage.toString()}", 
                              context: context,
                              like: state1.statusLike,
                            );
                            voidShowSnackBar(
                              context: context, 
                              color: (state1.statusLike == true) ? kRedColor : kBlueColor2,
                              vertical: themeBox.defaultHeightBox12,
                              behavior: SnackBarBehavior.floating,
                              duration: const Duration(milliseconds: 1000),
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(themeBox.defaultRadius8), topRight: Radius.circular(themeBox.defaultRadius8)), 
                              content: Text((state1.statusLike == true) ? "Has been removed from the Wishlist" : "Has been added to the Wishlist", 
                                style: whiteTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont12),
                                textAlign: TextAlign.center),
                            );
                          }, 
                        );
                      }
                    ),
                    ComponenContainerHarga(titleHarga: "Price starts from", harga: (state.dataProducts.price == null) ? "0.0" : state.dataProducts.price.toString()),
                    ComponenDeskripsiDetail(titleDeskripsi: "Description", deskripsi: state.dataProducts.description.toString()),
                    ComponenSmallHorizontal(titleImage: "Fimiliar Product"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}