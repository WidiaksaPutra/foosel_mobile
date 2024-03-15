// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:foosel/blocs/bloc_all_products/bloc_event_all_products.dart';
// import 'package:foosel/blocs/bloc_all_products/main/bloc_main_all_products_disconnect.dart';
// import 'package:foosel/blocs/bloc_all_products/main/cubit_main_product_refresh.dart';
// import 'package:foosel/blocs/bloc_default/bloc_state_default/bloc_state_connection.dart';

// class cubitConnectionAllProduct extends Cubit<dynamic>{
//   cubitConnectionAllProduct() : super(DataStateConnection(false));
//   connectCheck(BuildContext context, dynamic connection) async{
//     try {
//       final result = await InternetAddress.lookup('example.com');
//       if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//         await context.read<CubitProductRefresh>().refresh(context, connection);
//         emit(DataStateConnection(true));
//       }
//     } on SocketException catch (_) {
//       await connection(context);
//       context.read<BlocAllProductDisconnect>().add(Product(context: context));
//       emit(DataStateConnection(false));
//     }
//   }
// }