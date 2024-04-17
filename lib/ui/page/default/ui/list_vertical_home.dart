// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_bottom_nav_penjual/cubit_detail_produk_nav_penjual.dart';
import 'package:foosel/blocs/bloc_default/bloc/bloc/cubit_connection_example.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_size_device.dart';
import 'package:foosel/blocs/bloc_detail_products/cubit_detail_navigasi_product.dart';
import 'package:foosel/blocs/bloc_detail_products/detail_product/cubit_detail_product_connect.dart';
import 'package:foosel/blocs/bloc_detail_products/state_products.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/ui/page/user_penjual/bottomNav/home_menu_action_card_product_penjual.dart';
import 'package:foosel/ui/widgets/componen_loading.dart';
import 'package:go_router/go_router.dart';

class ListVerticalHome extends StatelessWidget with LoadingScrollData, SharedPref, SizeDevice{
  late int lengthList;
  late List data;
  late dynamic scrollControl;
  late bool loading, connection;
  ListVerticalHome({Key? key,
    required this.lengthList, 
    required this.data, 
    required this.scrollControl, 
    required this.loading,
    required this.connection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sharedPref();
    getsizeDevice(context);
    ThemeBox(context);
    late double heightPage = sizeHeight;
    if(heightPage < 0.0){heightPage = 0.0;};
    return (data.isNotEmpty)
    ? SizedBox(
        height: heightPage,
        child: LayoutBuilder(//perbedaan layout builder dengan mediaquery adalah:
        //layoutbuilder memberikan ukuran berdasarkan parent/induk dari layout builder, contohnya pada kasus ini induknya adalah continer maka ukuran maksimum layout builder mengikuti ukuran maksimum yang dimiliki container.
        //sedangkan mediaquery merupakah ukuran layar secara menyeluruh.
          builder: (context, constraints) {
            context.read<CubitDetailNavigasiProduct>().navigationDetailProduct();
            return BlocBuilder<CubitDetailNavigasiProduct, DataStateDetailProduct>(
              builder: (context, state) => Stack(
                children: [
                  ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: ThemeBox.defaultWidthBox20),
                    controller: scrollControl,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: lengthList,
                    itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: HomeMenuActionCardProductPenjual(
                        idProduct: data[index].tokenId.toString(),
                        nama: data[index].name.toString(),
                        type: data[index].category.name.toString(),
                        harga: data[index].price.toString(),
                        gambar: data[index].urlImage.toString(),
                        onTapImage: () {},
                      ),
                      onTap: (){
                        prefs.setString('detailTokenId', data[index].tokenId.toString());
                        prefs.setString('navDetailRole', state.navigation);
                        context.read<CubitConnectionExample>().connectCheck(
                          readBlocConnect: {
                            context.read<CubitDetailProdukNavPenjual>().detailProdukNavPenjual(
                              jenisDetail: "AllProduct",
                              readDetail: context.read<CubitDetailProductConnect>().getDetailProductConnect(idProduct: data[index].tokenId.toString()),
                            ),
                          }, 
                          readBlocDisconnect: {}
                        );
                        context.go(state.navigation);
                      },
                    );},
                  ),
                  LoadingScrollHeight(
                    context: context,
                    heightLoading: ThemeBox.defaultHeightBox300, 
                    loadingScrollName: loading, 
                    rightLoading: ThemeBox.defaultWidthBox20, 
                    withLoading: constraints.maxWidth,
                  ),
                ],
              ),
            );
          }
        ),
      )
    : Center(child: ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200));
  }
}