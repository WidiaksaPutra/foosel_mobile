// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/connection_dialog.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_navigasi_role.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/connection/connection_basic.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/user_penjual/detail_product/detail_body_connection_product_penjual.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/user_penjual/detail_product/detail_body_disconnect_product_penjual.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/user_penjual/detail_product/detail_bottom_navigation_bar_connection_product_penjual.dart';

class DetailProductPenjual extends HookWidget with navigasiRole, navigasiRoleBarRead, defaultSharedPref{
  DetailProductPenjual({Key? key}) : super(key: key);

  void navigationRole(BuildContext context) async{
    await navigasiRBR(context: context, value: 0);
    await navigasiR();
  }

  @override
  Widget build(BuildContext context) {
    ClassConnectionDialog connection = ClassConnectionDialog(); 
    return Scaffold(
      backgroundColor: kGreyColor6,
      body: ConnectionBasic(
        connection: connection.basicConnection, 
        childConnect: DetailBodyConnectionProductPenjual(), 
        childDisconnect: DetailBodyDisconnectProductPenjual(),
        buttonConnection: true,
      ),
      bottomNavigationBar: ConnectionBasic(
        connection: connection.basicConnection, 
        childConnect: DetailBottomNavigationBarConnectionProductPenjual(), 
        childDisconnect: SizedBox(),
        buttonConnection: true,
      ),
    );
  }
}

// navigationRole(context);
    // sharedPref();

// Size size = MediaQuery.of(context).size;
//     final listImageProduct = useState([]);
//     final loading = useState(true);

// Scaffold(
    //   backgroundColor: kGreyColor6,
    //   body: BlocConsumer<CubitDetailProductConnect, DataStateProducts>(
    //     listener: (context, state){
    //       if(state.loading == false){
    //         for(int i = 0 ; i < state.dataProducts.galleries!.length ; i++){
    //           listImageProduct.value.add(state.dataProducts.galleries![i].url.toString());
    //         }
    //         loading.value = state.loading;
    //       }
    //     },
    //     builder: (context, state){
    //       return (loading.value == false)
    //       ? Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             headerDetailProduct(
    //               context: context, 
    //               guestUser: false, 
    //               onPressedBack: () async{
    //                 prefs.remove('emailPenerima');
    //                 prefs.remove('detailTokenId');
    //                 context.go(navigation);
    //               }, 
    //               onPressedChart: () {
    //                 context.go(RouteName.cartDetail);
    //               },
    //             ),
    //             ComponenCarouselSliderImage(sizeWidth: size.width, imageProduct: listImageProduct.value, connect: true,),
    //             Expanded(
    //               child: Container(
    //                 margin: EdgeInsets.only(top: themeBox.defaultHeightBox17),
    //                 padding: EdgeInsets.only(top: themeBox.defaultHeightBox30, left: themeBox.defaultWidthBox30, right: themeBox.defaultWidthBox30, bottom: themeBox.defaultHeightBox30),
    //                 decoration: BoxDecoration(
    //                   color: kPrimaryColor,
    //                   borderRadius: BorderRadius.only(topLeft: Radius.circular(themeBox.defaultRadius24), topRight: Radius.circular(themeBox.defaultRadius24))
    //                 ),
    //                 child: SingleChildScrollView(
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       ComponenTextColumn_CrossStartAndWhiteGray2AndFont18Font12AndSemiBoldRegular(title: state.dataProducts.name.toString(), content: state.dataProducts.category!.name.toString()),
    //                       ComponenContainerHarga(titleHarga: "Price starts from", harga: state.dataProducts.price.toString()),
    //                       ComponenDeskripsiDetail(titleDeskripsi: "Description", deskripsi: state.dataProducts.description.toString()),
    //                       ComponenSmallHorizontal(titleImage: "Fimiliar Shoes"),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         )
    //       : ComponenLoadingBasic(colors: kPurpleColor);
    //     }
    //   ),
    //   bottomNavigationBar: Container(
    //     padding: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox10),
    //     color: kPrimaryColor,
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //       children: [
    //         ComponenBasicButton(paddingVertical: themeBox.defaultHeightBox10, borderRadius: themeBox.defaultRadius5, content: Text("Update", style: blackTextStyle.copyWith(fontWeight: regular)), onPressed: () {  }, primaryColor: kYellowColor, secondaryColor: kGreyColor),
    //         ComponenBasicButton(paddingVertical: themeBox.defaultHeightBox10, borderRadius: themeBox.defaultRadius5, content: Text("Delete", style: blackTextStyle.copyWith(fontWeight: regular)), onPressed: () {  }, primaryColor: kRedColor, secondaryColor: kGreyColor),
    //       ],
    //     ),
    //   ),
    // );