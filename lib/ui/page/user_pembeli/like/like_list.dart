import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_bottom_nav_pembeli/cubit_detail_produk_nav_pembeli.dart';
import 'package:foosel/blocs/bloc_default/bloc/cubit_connection_example.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_show_snack_bar.dart';
import 'package:foosel/blocs/bloc_default/state/state_connection.dart';
import 'package:foosel/blocs/bloc_detail_products/cubit_detail_navigasi_product.dart';
import 'package:foosel/blocs/bloc_detail_products/detail_product/cubit_detail_product_connect.dart';
import 'package:foosel/blocs/bloc_detail_products/state_products.dart';
import 'package:foosel/blocs/bloc_like/cubit_get_like.dart';
import 'package:foosel/blocs/bloc_like/cubit_like.dart';
import 'package:foosel/blocs/bloc_like/state_like.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_card_vertical(image_&_text_&_like).dart';
import 'package:foosel/ui/widgets/componen_loading.dart';
import 'package:foosel/ui/widgets/componen_page_kosong.dart';
import 'package:go_router/go_router.dart';

class Like extends StatelessWidget with ShowSnackBar{
  Like({Key? key}) : super(key: key);

  void read(BuildContext context) async{
    await context.read<CubitConnectionExample>().connectCheck(readBlocConnect: {}, readBlocDisconnect: {});
  }

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    read(context);
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<CubitGetLike, DataStateGetLike>(
      builder: (context1, state) => (state.loadingLike == false)
      ? Stack(
          children: [
            if(state.getData.isEmpty)...[
              ComponenPageKosongBasic(
                image: "asset/animations/like_lottie.json", 
                titleText: "Opss no message yet?", 
                messageText: "You have never done a transaction", 
                sizeHeight: size.height, 
                sizeWidth: size.width,
              ),
            ]else...[
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: state.getData.length,
                itemBuilder: (BuildContext context , int index){
                  context.read<CubitDetailNavigasiProduct>().navigationDetailProduct();
                  return BlocBuilder<CubitDetailNavigasiProduct, DataStateDetailProduct>(
                    builder: (context2, state0) => GestureDetector(
                      onTap: () {
                        context.read<CubitConnectionExample>().connectCheck(
                          readBlocConnect: {context.read<CubitDetailProdukNavPembeli>().detailProdukNavPembeli(
                            jenisDetail: "Like",
                            readDetail: context.read<CubitDetailProductConnect>().getDetailProductConnect(idProduct: state.getData[index]['tokenId'].toString()),
                          )},
                          readBlocDisconnect: {context.read<CubitDetailProdukNavPembeli>().detailProdukNavPembeli(
                            jenisDetail: "Like", 
                            readDetail: context.read<CubitGetLike>().getDataLikeWhereIdLocal(tokenId: state.getData[index]['tokenId'].toString())
                          )},
                        );
                        context.go(state0.navigation);
                      },
                      child:  Column(
                        children: [
                          BlocBuilder<CubitConnectionExample, DataStateConnection>(
                            builder: (context3, stateConnect) => BlocBuilder<CubitLike, DataStateLike>(
                              builder: (context4, state1) => ComponenCardVertical_ImageAndTextAndLike(
                                image: state.getData[index]['imagePath'].toString(), 
                                title: state.getData[index]['name'].toString(), 
                                harga: state.getData[index]['price'].toString(),  
                                startList: false, 
                                onPressedLike: () {
                                  context.read<CubitLike>().getLikeDelete(tokenId: state.getData[index]['tokenId'].toString());
                                  voidShowSnackBar(
                                    context: context, 
                                    color: (state1.statusLike == true) ? kRedColor : kBlueColor2,
                                    vertical: ThemeBox.defaultHeightBox12, 
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(ThemeBox.defaultRadius8), topRight: Radius.circular(ThemeBox.defaultRadius8)), 
                                    behavior: SnackBarBehavior.floating,
                                    duration: const Duration(milliseconds: 1000),
                                    content: Text((state1.statusLike == true) ? "Has been removed from the Wishlist" : "Has been added to the Wishlist", 
                                      style: whiteTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont12),
                                      textAlign: TextAlign.center),
                                  );          
                                  context.read<CubitGetLike>().getDataLike();
                                }, 
                                connection: stateConnect.connectionBoolean, 
                              )
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }, 
              ),
            ]
          ],
        )
      : ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200),
    );
  }
}