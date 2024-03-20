// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_bottom_nav_pembeli/cubit_detail_produk_nav_pembeli.dart';
import 'package:foosel/blocs/bloc_bottom_nav_penjual/cubit_detail_produk_nav_penjual.dart';
import 'package:foosel/blocs/bloc_default/bloc/cubit_connection_example.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_roles.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_size_device.dart';
import 'package:foosel/blocs/bloc_detail_products/cubit_detail_navigasi_product.dart';
import 'package:foosel/blocs/bloc_detail_products/detail_product/cubit_detail_product_connect.dart';
import 'package:foosel/blocs/bloc_detail_products/detail_product/cubit_detail_products_disconnect.dart';
import 'package:foosel/blocs/bloc_detail_products/state_products.dart';
import 'package:foosel/routes/route_name.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_card_horizontal.dart';
import 'package:foosel/ui/widgets/componen_loading.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
class ListHorizontalHome extends HookWidget with SizeDevice, SharedPref, LoadingScrollData, RoleAcces{
  late int lengthList;
  late dynamic data;
  late dynamic scrollControl;
  late bool loading, connection;
  late double heightPage;

  ListHorizontalHome({Key? key,
    required this.lengthList,
    required this.data,
    required this.scrollControl,
    required this.connection,
    required this.loading,
    required this.heightPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sharedPref();
    ThemeBox(context);
    getsizeDevice(context);
    rolesUser();
    final int columnCount = (sizeWidth / ThemeBox.defaultWidthBox215).round();
    final double widthGambar = sizeWidth / columnCount;
    context.read<CubitDetailNavigasiProduct>().navigationDetailProduct();
    return (data.isNotEmpty)
    ? LayoutBuilder(
        builder: (context, constraints) {
          return BlocBuilder<CubitDetailNavigasiProduct, DataStateDetailProduct>(
            builder: (context, state) => Stack(
              children: [
                SizedBox(
                  height: heightPage,
                  width: sizeWidth,
                  child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: ThemeBox.defaultWidthBox20),
                  itemCount: lengthList,
                  controller: scrollControl,
                  scrollDirection: Axis.vertical, // Menentukan arah scroll vertical
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columnCount, // Jumlah kolom sesuai ukuran layar
                    crossAxisSpacing: ThemeBox.defaultHeightBox10,
                    mainAxisSpacing: ThemeBox.defaultWidthBox10,// Rasio aspek untuk setiap item
                    childAspectRatio: ThemeBox.defaultWidthBox1_5/ThemeBox.defaultHeightBox2,
                  ),
                  itemBuilder: (context, index) => (connection == false)
                  ? ComponenCardHorizontal(
                      nama: data[index]['name'].toString(), 
                      jenis: data[index]['nameCategory'].toString(), 
                      harga: data[index]['price'].toString(), 
                      gambar: "disconnect_image.jpg", 
                      navigation: '${RouteName.detailProductPembeli}?idProduct=${data[index]['tokenId'].toString()}', 
                      widthCardGambar: widthGambar, 
                      connect: false,
                      onTap: () async{
                        prefs.setString('detailTokenId', data[index]['tokenId'].toString());
                        prefs.setString('navDetailRole', state.navigation);
                        context.read<CubitConnectionExample>().connectCheck(
                          readBlocConnect: {}, 
                          readBlocDisconnect: {
                            if(role == "PENJUAL"){
                              context.read<CubitDetailProdukNavPenjual>().detailProdukNavPenjual(
                                jenisDetail: "AllProduct",
                                readDetail: context.read<CubitDetailProductsDisconnect>().getDetailProductDisconnect(tokenId: data[index]['tokenId'].toString()),
                              ),
                            }else{
                              context.read<CubitDetailProdukNavPembeli>().detailProdukNavPembeli(
                                jenisDetail: "AllProduct",
                                readDetail: context.read<CubitDetailProductsDisconnect>().getDetailProductDisconnect(tokenId: data[index]['tokenId'].toString()),
                              ),
                            } 
                          }
                        );
                        context.go(state.navigation);
                      },
                    )
                  : ComponenCardHorizontal(
                      nama: data[index].name.toString(), 
                      jenis: data[index].category.name.toString(), 
                      harga: data[index].price.toString(), 
                      gambar: data[index].urlImage.toString(), 
                      navigation: '${RouteName.detailProductPembeli}?idProduct=${data[index].tokenId.toString()}', 
                      widthCardGambar: widthGambar, 
                      connect: true,
                      onTap: (){
                        prefs.setString('detailTokenId', data[index].tokenId.toString());
                        prefs.setString('navDetailRole', state.navigation);
                        context.read<CubitConnectionExample>().connectCheck(
                          readBlocConnect: {
                            context.read<CubitDetailProdukNavPembeli>().detailProdukNavPembeli(
                              jenisDetail: "AllProduct",
                              readDetail: context.read<CubitDetailProductConnect>().getDetailProductConnect(idProduct: data[index].tokenId.toString()),
                            ),
                          }, 
                          readBlocDisconnect: {},
                        );
                        context.go(state.navigation);
                      }, 
                    )
                  ),
                ),
                LoadingScrollHeight(
                  context: context,
                  heightLoading: ThemeBox.defaultHeightBox200, 
                  loadingScrollName: loading, 
                  rightLoading: ThemeBox.defaultWidthBox20, 
                  withLoading: constraints.maxWidth,
                ),
              ],
            )
          );
        }
      )
    : Center(child: ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200));
  }
}