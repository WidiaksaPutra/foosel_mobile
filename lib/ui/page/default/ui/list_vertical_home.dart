// ignore_for_file: must_be_immutable
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_bottom_nav_pembeli/cubit_detail_produk_nav_pembeli.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_bottom_nav_penjual/cubit_detail_produk_disconnect_nav_penjual.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/cubit_connection_example.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_roles.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_detail_products/cubit_detail_navigasi_product.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_detail_products/detail_product/cubit_detail_product_connect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_detail_products/detail_product/cubit_detail_products_disconnect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_detail_products/state_products.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_konstanta.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/user_penjual/bottomNav/home_menu_action_card_product_penjual.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_advanced/componen_card_vertical(image_&_text).dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_loading.dart';
import 'package:go_router/go_router.dart';

class ListVerticalHome extends HookWidget with loadingScrollData, roleAcces, defaultSharedPref{
  late int lengthList;
  late List data;
  late String labelList;
  late dynamic scrollControl;
  late bool loading, connection;
  late double hightListView;
  ListVerticalHome({Key? key,
    required this.lengthList, 
    required this.data, 
    required this.labelList, 
    required this.scrollControl, 
    required this.loading,
    required this.connection,
    required this.hightListView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final roleData = useState("");
    rolesUser();
    sharedPref();
    Timer(
      const Duration(seconds: 2),
      (){
        roleData.value = role;
      }
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Text(labelList, style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont22)),
        Container(
          padding: EdgeInsets.only(top: themeBox.defaultHeightBox14, right: themeBox.defaultWidthBox30),
          height: hightListView,
          child: LayoutBuilder(//perbedaan layout builder dengan mediaquery adalah:
          //layoutbuilder memberikan ukuran berdasarkan parent/induk dari layout builder, contohnya pada kasus ini induknya adalah continer maka ukuran maksimum layout builder mengikuti ukuran maksimum yang dimiliki container.
          //sedangkan mediaquery merupakah ukuran layar secara menyeluruh.
            builder: (context, constraints) {
              context.read<cubitDetailNavigasiProduct>().navigationDetailProduct();
              return BlocBuilder<cubitDetailNavigasiProduct, DataStateDetailProduct>(
                builder: (context, state) => Stack(
                  children: [
                    ListView.builder(
                      controller: scrollControl,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: lengthList,
                      itemBuilder: (BuildContext context, int index) {
                      return (connection == false)
                      ? GestureDetector(
                          child: ComponenCardVertical_ImageAndText(
                            type: data[index]['nameCategory'].toString(),
                            nama: data[index]['name'].toString(), 
                            harga: data[index]['price'].toString(), 
                            gambar: "asset/image/sampel_sepatu_home_small_4.png",
                            connection: false,
                          ),
                          onTap: () {
                            prefs.setString('detailTokenId', data[index]['tokenId'].toString());
                            prefs.setString('navDetailRole', state.navigation);
                            context.read<cubitConnectionExample>().connectCheck(
                              readBlocConnect: {}, 
                              readBlocDisconnect: {
                                context.read<CubitDetailProdukNavPembeli>().DetailProdukNavPembeli(
                                  jenisDetail: "AllProduct",
                                  readDetail: context.read<CubitDetailProductsDisconnect>().GetDetailProductDisconnect(tokenId: data[index]['tokenId'].toString()),
                                ),
                              }
                            );
                            context.go(state.navigation);
                          },
                        )
                      : GestureDetector(
                          child: (roleData.value == "PENJUAL")
                          ? HomeMenuActionCardProductPenjual(
                              idProduct: data[index].tokenId.toString(),
                              nama: data[index].name.toString(),
                              type: data[index].category.name.toString(),
                              harga: data[index].price.toString(),
                              gambar: data[index].urlImage.toString(), 
                              onTapImage: () {},
                            ) 
                          : ComponenCardVertical_ImageAndText(
                              type: data[index].category.name.toString(), 
                              nama: data[index].name.toString(),
                              harga: data[index].price.toString(),
                              gambar: "${Api.baseURLImage}${data[index].urlImage.toString()}", 
                              connection: true,
                            ),
                          onTap: () async{
                            prefs.setString('detailTokenId', data[index].tokenId.toString());
                            prefs.setString('navDetailRole', state.navigation);
                            if(roleData.value == "PENJUAL"){
                              context.read<cubitConnectionExample>().connectCheck(
                                readBlocConnect: {
                                  context.read<CubitDetailProdukNavPenjual>().DetailProdukNavPembeli(
                                    jenisDetail: "AllProduct",
                                    readDetail: context.read<CubitDetailProductConnect>().GetDetailProductConnect(data[index].tokenId.toString()),
                                  ),
                                }, 
                                readBlocDisconnect: {}
                              );
                            }
                            if(roleData.value != "PENJUAL"){
                              context.read<cubitConnectionExample>().connectCheck(
                                readBlocConnect: {
                                  context.read<CubitDetailProdukNavPembeli>().DetailProdukNavPembeli(
                                    jenisDetail: "AllProduct",
                                    readDetail: context.read<CubitDetailProductConnect>().GetDetailProductConnect(data[index].tokenId.toString()),
                                  ),
                                }, 
                                readBlocDisconnect: {}
                              );
                            }
                            context.go(state.navigation);
                          },
                        );
                      },
                    ),
                    loadingScrollHeight(loading, constraints.maxWidth, themeBox.defaultHeightBox200, themeBox.defaultWidthBox20),
                  ],
                ),
              );
            }
          ),
        ),
      ]
    );
  }
}











// Get.parameters['idProduct'].toString()
// RouteName.detailProductPembeli}?idProduct=${data[index].tokenId.toString()}
// ${RouteName.detailProductPembeli}?idProduct=${data[index]['tokenId'].toString()}