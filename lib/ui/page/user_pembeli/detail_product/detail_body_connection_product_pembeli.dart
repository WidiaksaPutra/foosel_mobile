// ignore_for_file: must_be_immutable, unused_element, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_bottom_nav_pembeli/cubit_detail_produk_nav_pembeli.dart';
import 'package:foosel/blocs/bloc_bottom_nav_pembeli/state_bottom_nav_pembeli.dart';
import 'package:foosel/blocs/bloc_default/class/refresh_dialog.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_navigasi_role.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_show_snack_bar.dart';
import 'package:foosel/blocs/bloc_detail_products/detail_product/cubit_detail_product_connect.dart';
import 'package:foosel/blocs/bloc_detail_products/state_products.dart';
import 'package:foosel/blocs/bloc_like/cubit_like.dart';
import 'package:foosel/blocs/bloc_like/state_like.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/cubit_get_detail_transaksi_product.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_local/cubit_get_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_local/state_transaksi.dart';
import 'package:foosel/routes/route_name.dart';
import 'package:foosel/service/api_konstanta.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_header_product.dart';
import 'package:foosel/ui/widgets/componen_carousel_slider_image.dart';
import 'package:foosel/ui/widgets/componen_container_harga.dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_detail/componen_deskripsi_detail.dart';
import 'package:foosel/ui/widgets/componen_loading.dart';
import 'package:foosel/ui/widgets/componen_row_like.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DetailBodyConnectionProductPembeli extends HookWidget with NavigasiRole, NavigasiRoleBarRead, SharedPref, ShowSnackBar{
  DetailBodyConnectionProductPembeli({Key? key}) : super(key: key);

  void navigationBack({
    required BuildContext context,
    required String jenisDetail,
  }){
    (jenisDetail == "AllProduct")
    ? navigasiRBR(context: context, value: 0)
    : navigasiRBR(context: context, value: 2);
    navigasiR();
    (jenisDetail == "Transaksi") 
    ? context.go(RouteName.cart) 
    : (jenisDetail == "TransaksiHistory")
    ? context.go(RouteName.cartHistory)
    : (jenisDetail == "TransaksiDetail")
    ? context.go(RouteName.cart)
    : context.go(navigation);
  }  

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    Size size = MediaQuery.of(context).size;
    var listImageProduct = useState([]);
    sharedPref();

    Future<void> listenerDetailProduct({
      required DataStateProducts state,
      required BuildContext context1,
      required BuildContext context,
    }) async{
      bool loading = state.loading;
      if(loading == true){
        Future.delayed(
          Duration(seconds: 2),
          () => ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200),
        );
        RefreshDialog().basicRefresh(context: context1, onTap: () => context.go(navigation));
      }
      if(loading == false){
        prefs.setString('emailPenerima', state.dataProducts.user!.email.toString());
        state.dataProducts.galleries!.forEach((data){
          listImageProduct.value.add(data.url.toString());
        });
      }
      context.read<CubitLike>().getLikeInit(tokenId: state.dataProducts.tokenId.toString());
      context.read<CubitGetTransaksiLocal>().getDataTransaksiWhereId(tokenId: state.dataProducts.tokenId.toString());
    }

    return BlocConsumer<CubitDetailProductConnect, DataStateProducts>(
      listener: (context1, state) async {
        await listenerDetailProduct(state: state, context: context, context1: context1).timeout(Duration(seconds: 10));
      },
      builder: (context1, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<CubitDetailProdukNavPembeli, DataStateDetailProdukNavPembeli>(
            builder: (context2, state){
              return headerDetailProduct(
                context: context, 
                guestUser: false, 
                onPressedBack: () => navigationBack(context: context, jenisDetail: state.jenisDetail.toString()), 
                onPressedChart: () => context.go(RouteName.cart), 
                icon: 'asset/icon/cart_Icon4.png',
              );
            },
          ),
          (listImageProduct.value.isNotEmpty)
          ? ComponenCarouselSliderImage(sizeWidth: size.width, imageProduct: listImageProduct.value, connect: true)
          : Center(child:ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200)),
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
                    BlocBuilder<CubitLike, DataStateLike>(
                      builder: (context, state1){
                      return (listImageProduct.value.isEmpty && state1.loadingLike == true)
                      ? Center(child:ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200))
                      : ComponenRowLike(
                          name: state.dataProducts.category!.name.toString(), 
                          categoryName: state.dataProducts.name.toString(),
                          like: state1.statusLike,
                          onTap: (){
                            context.read<CubitLike>().getLikeOnClick(
                              tokenId: state.dataProducts.tokenId.toString(), 
                              name: state.dataProducts.name.toString(),
                              email: state.dataProducts.email.toString(),
                              categoryName: state.dataProducts.category!.name.toString(),
                              description: state.dataProducts.description.toString(), 
                              price: state.dataProducts.price.toString(), 
                              imagePath: "${Api.linkURL}/${state.dataProducts.urlImage.toString()}", 
                              context: context,
                              like: state1.statusLike,
                            );
                            voidShowSnackBar(
                              context: context, 
                              color: (state1.statusLike == true) ? kRedColor : kBlueColor2,
                              vertical: ThemeBox.defaultHeightBox12,
                              behavior: SnackBarBehavior.floating,
                              duration: const Duration(milliseconds: 1000),
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(ThemeBox.defaultRadius8), topRight: Radius.circular(ThemeBox.defaultRadius8)), 
                              content: Text((state1.statusLike == true) ? "Has been removed from the Wishlist" : "Has been added to the Wishlist", 
                                style: whiteTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont12),
                                textAlign: TextAlign.center),
                            );
                          }, 
                        );
                      }
                    ),
                    BlocBuilder<CubitDetailProdukNavPembeli, DataStateDetailProdukNavPembeli>(
                      builder: (context2, state2) => (state2.jenisDetail.toString() == "AllProduct" || state2.jenisDetail.toString() == "Like")
                      ? ComponenContainerHarga(
                          titleHarga: "Harga",
                          harga: (state.dataProducts.price == null) ? "0.0" : state.dataProducts.price.toString(),
                        )
                      : (state2.jenisDetail.toString() == "TransaksiHistory")
                        ? BlocBuilder<CubitGetDetailTransaksiProduct, DataStateGetTransaksi>(
                          builder: (context3, state3) {
                            return (state3.dataTransaksi.isEmpty)
                            ? ComponenLoadingLottieHorizontal(height: ThemeBox.defaultHeightBox100)
                            : (state3.dataTransaksi[0].productsId != state.dataProducts.tokenId)
                              ? ComponenLoadingLottieHorizontal(height: ThemeBox.defaultHeightBox100)
                              : ComponenContainerHarga(
                                  titleHarga: "Harga",
                                  harga: (state.dataProducts.price == null) ? "0.0" : state.dataProducts.price.toString(),
                                  titleItem: "Jumlah Barang",
                                  jumlahItem: state3.dataTransaksi[0].quantity.toString(),
                                  titleTotalHarga: "Total Harga",
                                  jumlahTotalHarga: state3.dataTransaksi[0].totalPrice.toString(),
                                );
                          })
                        : BlocBuilder<CubitGetTransaksiLocal, DataStateGetTransaksiLocal>(
                            builder: (context3, state3) => (state3.loadingTransaksi == false)
                            ? ComponenContainerHarga(
                                titleHarga: "Harga",
                                harga: (state.dataProducts.price == null) ? "0.0" : state.dataProducts.price.toString(),
                                titleItem: "Jumlah Barang",
                                jumlahItem: state3.getData[0]["jumlah"].toString(),
                                titleTotalHarga: "Total Harga",
                                jumlahTotalHarga: state3.getData[0]["hargaTotal"].toString(),
                              )
                            : ComponenLoadingLottieHorizontal(height: ThemeBox.defaultHeightBox50)
                          ),
                    ),
                    ComponenTextDetail(title: "Description", data: state.dataProducts.description.toString()),
                    ComponenTextDetail(title: "Email Penjual", data: state.dataProducts.email.toString()),
                    // ComponenSmallHorizontal(titleImage: "Fimiliar Product"),
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