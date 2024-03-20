// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:foosel/blocs/bloc_default/state_default/state_connection.dart';

// class CubitConnectionAllProduct extends Cubit<DataStateConnection>{
//   CubitConnectionAllProduct() : super(DataConnection(false));
//   connectCheck(BuildContext context, dynamic connection) async{
//     try {
//       final result = await InternetAddress.lookup('example.com');
//       if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//         // await context.read<CubitProductRefresh>().refresh(context, true);
//         emit(DataConnection(true));
//       }
//     } on SocketException catch (_) {
//       await connection(context);
//       // await context.read<CubitProductRefresh>().refresh(context, false);
//       emit(DataConnection(false));
//     }
//   }
// }