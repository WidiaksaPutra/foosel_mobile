// ignore_for_file: must_be_immutable, unused_element, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_bottom_nav_penjual/cubit_detail_produk_nav_penjual.dart';
import 'package:foosel/blocs/bloc_bottom_nav_penjual/state_bottom_nav_pembeli.dart';
import 'package:foosel/blocs/bloc_default/class/class/refresh_dialog.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_navigasi_role.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_show_snack_bar.dart';
import 'package:foosel/blocs/bloc_detail_products/detail_product/cubit_detail_product_connect.dart';
import 'package:foosel/blocs/bloc_detail_products/state_products.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/cubit_get_detail_transaksi_product.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
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
import 'package:flutter_hooks/flutter_hooks.dart';

class DetailBodyConnectionProductPenjual extends HookWidget with NavigasiRole, NavigasiRoleBarRead, SharedPref, ShowSnackBar{
  DetailBodyConnectionProductPenjual({Key? key}) : super(key: key);

  void navigationBack({
    required BuildContext context,
    required String jenisDetail,
  }){
    (jenisDetail == "AllProduct")
    ? navigasiRBR(context: context, value: 0)
    : navigasiRBR(context: context, value: 2);
    navigasiR();
    (jenisDetail == "Transaksi") 
    ? context.go(RouteName.cartProduct)
    : context.go(navigation);
  }
  
  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    Size size = MediaQuery.of(context).size;
    final listImageProduct = useState([]);
    sharedPref();
    return BlocConsumer<CubitDetailProductConnect, DataStateProducts>(
      listener: (context1, state) async{
        bool loading = await state.loading;
        if(loading == true){
          ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200);
          Future.delayed(
            Duration(milliseconds: 2),
            () => RefreshDialog().basicRefresh(context: context, onTap: () => context.go(navigation)),
          );
        }
        if(loading == false){
          prefs.setString('emailPenerima', state.dataProducts.user!.email.toString());
          state.dataProducts.galleries!.forEach((data) => listImageProduct.value.add(data.url.toString()));
        }
      },
      builder: (context1, state) => (listImageProduct.value.isEmpty)
      ? Center(child:ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200))
      : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<CubitDetailProdukNavPenjual, DataStateDetailProdukNavPenjual>(
              builder: (context2, state){
                return headerDetailProduct(
                  context: context, 
                  guestUser: true, 
                  onPressedBack: () => navigationBack(context: context, jenisDetail: state.jenisDetail.toString()),
                  onPressedChart: () => context.go(RouteName.cart), 
                  icon: 'asset/icon/cart_Icon4.png',
                );
              },
            ),
            ComponenCarouselSliderImage(sizeWidth: size.width, imageProduct: listImageProduct.value, connect: true,),
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
                      ComponenTextColumn_CrossStartAndWhiteGray2AndFont18Font12AndSemiBoldRegular(title: state.dataProducts.name.toString(), content: state.dataProducts.category!.name.toString()),
                      BlocBuilder<CubitDetailProdukNavPenjual, DataStateDetailProdukNavPenjual>(
                        builder: (context2, state2) => (state2.jenisDetail.toString() == "AllProduct")
                        ? ComponenContainerHarga(
                            titleHarga: "Harga",
                            harga: (state.dataProducts.price == null) ? "0.0" : state.dataProducts.price.toString(),
                          )
                        : BlocBuilder<CubitGetDetailTransaksiProduct, DataStateGetTransaksi>(
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
                      ),
                      ComponenTextDetail(title: "Description", data: state.dataProducts.description.toString()),
                      BlocBuilder<CubitDetailProdukNavPenjual, DataStateDetailProdukNavPenjual>(
                        builder: (context2, state2) => (state2.jenisDetail.toString() == "AllProduct")
                        ? SizedBox()
                        : BlocBuilder<CubitGetDetailTransaksiProduct, DataStateGetTransaksi>(
                          builder: (context3, state3) {
                            return (state3.dataTransaksi.isEmpty)
                            ? ComponenLoadingLottieHorizontal(height: ThemeBox.defaultHeightBox100)
                            : (state3.dataTransaksi[0].productsId != state.dataProducts.tokenId)
                              ? ComponenLoadingLottieHorizontal(height: ThemeBox.defaultHeightBox100)
                              : ComponenTextDetail(title: "Email Pembeli", data: state3.dataTransaksi[0].usersEmailPembeli.toString());
                          })
                      ),
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