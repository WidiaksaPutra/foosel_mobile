// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:foosel/blocs/bloc_all_products/state_all_products.dart';
// import 'package:foosel/service/api_products/option/api_get_products_popular.dart';

// class CubitProductRefresh extends Cubit<dynamic> with apiGetProductsPopular{
//   CubitProductRefresh() : super(DataRefreshProduct(false));
//   refresh(BuildContext context, bool connect)async{
//     Future refreshApiProduct({required BuildContext context, required bool connect}) async{
//       // (connect == true)
//       // ? context.read<BlocAllProductConnect>().add(Product(connect: connect))
//       // : context.read<BlocAllProductDisconnect>().add(Product(connect: connect));
//     }
//     await Future.delayed(const Duration(milliseconds: 1000));
//     emit(DataRefreshProduct(refreshApiProduct(context: context, connect: connect)));
//   }
// }