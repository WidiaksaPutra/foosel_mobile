// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:foosel/blocs/bloc_bottom_nav_pembeli/cubit_detail_produk_disconnect_nav_pembeli.dart';
// import 'package:foosel/blocs/bloc_default/default/cubit_connection_example.dart';
// import 'package:foosel/blocs/bloc_default/mixin/mixin_location.dart';
// import 'package:foosel/blocs/bloc_detail_products/cubit_detail_navigasi_product.dart';
// import 'package:foosel/blocs/bloc_detail_products/detail_product/cubit_detail_product_connect.dart';
// import 'package:foosel/blocs/bloc_detail_products/state_products.dart';
// import 'package:foosel/blocs/bloc_transaksi/cubit_get_transaksi.dart';
// import 'package:foosel/blocs/bloc_transaksi/state_like.dart';
// import 'package:foosel/routes/route_name.dart';
// import 'package:foosel/shared/theme_box.dart';
// import 'package:foosel/shared/theme_color.dart';
// import 'package:foosel/shared/theme_data_dummy.dart';
// import 'package:foosel/shared/theme_font.dart';
// import 'package:foosel/shared/theme_text_style.dart';
// import 'package:foosel/ui/widgets/componen_bottom_cart_button.dart';
// import 'package:foosel/ui/widgets/componen_box_white.dart';
// import 'package:foosel/ui/widgets/componen_cart_card_address.dart';
// import 'package:foosel/ui/widgets/componen_cart_card_total.dart';
// import 'package:foosel/ui/widgets/componen_cart_item_detail_vertical.dart';
// import 'package:foosel/ui/widgets/componen_header/componen_header_cart.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class CartDetail extends StatelessWidget{
//   CartDetail({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     context.read<cubitConnectionExample>().connectCheck(readBlocConnect: {}, readBlocDisconnect: {});
//     context.read<cubitDetailNavigasiProduct>().navigationDetailProduct();
//     // getLocation();
//     final CameraPosition _kGooglePlex = CameraPosition(
//       target: LatLng(-8.7160175, 115.1641399),
//       zoom: 14.4746,
//     );
//     // ignore: no_leading_underscores_for_local_identifiers
//     final Marker _kGoogleMarker = Marker(
//       markerId: const MarkerId('_kGooglePlex'),
//       infoWindow: const InfoWindow(title: 'Your Location'),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//       position: LatLng(-8.7160175, 115.1641399),
//     );
//     return Scaffold(
//       backgroundColor: kBlackColor6,
//       appBar: headerCart(
//         context: context, 
//         titleCart: "Checkout Details", 
//         statusLeading: true, 
//         statusNav: 'true', 
//         navigationCart: '', 
//         navBack: RouteName.cart,
//       ),
//       bottomNavigationBar: ComponenBottomCartButton(
//         harga: "", 
//         textButton: "Checkout Now", 
//         page: RouteName.cartCheckoutSuccess,
//         listCart: false,
//       ),
//       body: Container(
//         margin: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox30),
//         child: BlocBuilder<CubitGetTransaksi, DataStateGetTransaksi>(
//           builder: (context1, state){
//             return ListView(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(top: themeBox.defaultHeightBox30),
//                   child: Text("List Items", style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16)),
//                 ),
//                 Column(
//                   children: [
//                     for(int i = 0 ; i < state.getData.length; i++)...[
//                       BlocBuilder<cubitDetailNavigasiProduct, DataStateDetailProduct>(
//                         builder: (context, state1) => ComponenCartItemDetailVertical(
//                           image: state.getData[i]['imagePath'].toString(),
//                           harga: state.getData[i]['hargaTotal'].toString(),
//                           textTitle: state.getData[i]['name'].toString(),
//                           jumlah: state.getData[i]['jumlah'].toString(),
//                           onTapCard: () {
//                             context.read<cubitConnectionExample>().connectCheck(
//                               readBlocConnect: {context.read<CubitDetailProdukNavPembeli>().DetailProdukNavPembeli(
//                                 jenisDetail: "Transaksi",
//                                 readDetail: context.read<CubitDetailProductConnect>().GetDetailProductConnect(state.getData[i]['tokenId'].toString())
//                               )},
//                               readBlocDisconnect: {context.read<CubitDetailProdukNavPembeli>().DetailProdukNavPembeli(
//                                 jenisDetail: "Transaksi", 
//                                 readDetail: context.read<CubitGetTransaksi>().GetDataTransaksiWhereIdLocal(tokenId: state.getData[i]['tokenId'].toString())
//                               )},
//                             );
//                             context.go(state1.navigation);
//                           },
//                         ),
//                       ),
//                     ],
//                   ],
//                 ),
//                 ComponenBoxWhite(
//                   marginTop: 20.0,
//                   marginBottom: 0.0,
//                   borderRadiusBox: 5.0,
//                   colorCard: kBlackColor,
//                   contentBox: Container(
//                     width: double.infinity,
//                     margin: EdgeInsets.symmetric(
//                       horizontal: themeBox.defaultWidthBox20,
//                       vertical: themeBox.defaultHeightBox20,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text("Lokasi", style: whiteTextStyle.copyWith(fontSize: defaultFont16, fontWeight: bold)),
//                         Padding(
//                           padding: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox20),
//                           child: const Divider(color: kGreyColor3, thickness: 1),
//                         ),
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(5.0),
//                           child: SizedBox(
//                             height: 150,
//                             width: 330,
//                             child: GoogleMap(
//                               markers: {_kGoogleMarker},
//                               mapType: MapType.normal, 
//                               initialCameraPosition: _kGooglePlex,
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 ComponenCartCardAddress(
//                   storeLocation: "Adidas Core", 
//                   yourLocation: "Marsemoon",
//                 ),
//                 ComponenCartCardTotal(
//                   productQuantity: state.getData.length.toString(), 
//                   productPrice: state.totalHarga.toString(), 
//                   shipping: 'Free', 
//                   total: state.totalHarga.round().toString(),
//                 )
//               ],
//             );
//           }
//         ),
//       ),
//     );
//   }
// }