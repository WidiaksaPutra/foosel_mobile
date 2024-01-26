// import 'package:connectivity/connectivity.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_laravel_toko_sepatu/blocs/bloc_all_products/bloc_event_all_products.dart';
// import 'package:flutter_laravel_toko_sepatu/blocs/bloc_all_products/bloc_state_all_products.dart';
// import 'package:flutter_laravel_toko_sepatu/blocs/bloc_all_products/main/bloc_main_all_products_connect.dart';
// import 'package:flutter_laravel_toko_sepatu/blocs/bloc_all_products/main/bloc_main_all_products_connect_test.dart';
// import 'package:flutter_laravel_toko_sepatu/blocs/bloc_all_products/main/bloc_main_all_products_disconnect.dart';
// import 'package:flutter_laravel_toko_sepatu/blocs/bloc_all_products/main/cubit_connection_all_product.dart';
// import 'package:flutter_laravel_toko_sepatu/blocs/bloc_all_products/main/cubit_main_product_refresh.dart';
// import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_konstanta.dart';
// import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_navigasi_role.dart';
// import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
// import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_loading.dart';

// class ConnectionHomeAllShoesPembeli extends StatelessWidget with defaultSharedPref, navigasiRole, loadingScrollData{
//   // final dynamic childHorizontal, childVertical, childHorizontalDisconnect, childVerticalDisconnect;
//   final dynamic childVertical;
//   // , childVerticalDisconnect;
//   // ignore: prefer_typing_uninitialized_variables
//   final connection;
//   ConnectionHomeAllShoesPembeli({Key? key,
//     required this.childVertical,
//     required this.connection,
//   }) : super(key: key);
  
//   dynamic nullAcces = null;

//   void shared(ConnectivityResult? data) async{
//     await sharedPref();
//     if(data == ConnectivityResult.none){
//       await prefs.setBool('homeUpConnect', false);
//     }else{
//       await prefs.setBool('homeUpConnect', true);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {

//     Widget statusConnect(ConnectivityResult? data){
//       shared(data);
//       return ListView(
//         physics: const BouncingScrollPhysics(),
//         scrollDirection: Axis.vertical,
//         children: [
//           // BlocBuilder<BlocAllProductConnect, DataStateAllProduct>(
//           //   builder: childHorizontal,
//           // ),
//           BlocBuilder<BlocAllProductConnect, DataStateAllProduct>(
//             builder: childVertical,
//           ),
//         ],
//       );
//     }

//     Widget statusDisconnect(ConnectivityResult? data){
//       shared(data);
//       return ListView(
//         physics: const BouncingScrollPhysics(),
//         scrollDirection: Axis.vertical,
//         children: [
//           // BlocBuilder<BlocAllProductDisconnect, DataStateAllProduct>(
//           //   builder: childHorizontalDisconnect
//           // ),
//           // BlocBuilder<BlocAllProductDisconnect, DataStateAllProduct>(
//           //   builder: childVerticalDisconnect
//           // ),
//         ],
//       );
//     }

//     return StreamBuilder<ConnectivityResult>(
//       stream: Connectivity().onConnectivityChanged,
//       builder: (_, snapshot) {
//         if(snapshot.data == ConnectivityResult.mobile || snapshot.data == ConnectivityResult.wifi || snapshot.data == ConnectivityResult.none){
//           if(snapshot.data == ConnectivityResult.mobile || snapshot.data == ConnectivityResult.wifi){
//             //Future.delayed(const Duration(milliseconds: 2000), () {
//               context.read<cubitConnectionAllProduct>().connectCheck(context, connection);
//               // context.read<BlocAllProductConnect>().add(Product(context: context));
//               Future.delayed(const Duration(milliseconds: 1000));
//               BlocAllProductConnect().close();
//             // });
//             return BlocBuilder<BlocAllProductConnect, dynamic>(
//               builder: (context, fresh) => RefreshIndicator(
//                 onRefresh: () {
//                   return fresh.refresh;
//                 },
//                 child: statusConnect(snapshot.data), 
//               ),
//             );
//           } 
//           else{
//             // Future.delayed(const Duration(milliseconds: 2000), () {
//               connection(context);
//               context.read<BlocAllProductDisconnect>().add(Product(context: context));
//               Future.delayed(const Duration(milliseconds: 1000));
//               BlocAllProductDisconnect().close();
//             // });
//             return statusDisconnect(snapshot.data);
//           }
//         }else{
//           context.read<cubitConnectionAllProduct>().connectCheck(context, connection);
//           Future.delayed(const Duration(milliseconds: 1000));
//           cubitConnectionAllProduct().close();
//           nullAcces = const ComponenLoadingBasic(colors: kPurpleColor);
//           nullAcces = BlocBuilder<cubitConnectionAllProduct, dynamic>(
//             builder: (context, state) => (state.connectionBoolean == true)
//             ? BlocBuilder<CubitProductRefresh, dynamic>(
//                 builder: (context, fresh) => RefreshIndicator(
//                   onRefresh: () {
//                     return fresh.refresh;
//                   },
//                   child: statusConnect(ConnectivityResult.wifi),
//                 ),
//               )
//             : statusDisconnect(ConnectivityResult.none),
//           );
//           Future.delayed(const Duration(milliseconds: 3000));
//           return nullAcces;
//         }
//       }
//     );
//   }
// }