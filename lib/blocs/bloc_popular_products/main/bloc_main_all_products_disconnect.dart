// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_laravel_toko_sepatu/blocs/bloc_all_products/event_all_products.dart';
// import 'package:flutter_laravel_toko_sepatu/blocs/bloc_all_products/state_all_products.dart';
// import 'package:flutter_laravel_toko_sepatu/blocs/bloc_all_products/interfaces_all_products.dart';
// import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_get_data_product_storage_local.dart';

// ScrollController scrollController = ScrollController();
// class BlocAllProductDisconnect extends Bloc<dataEventAllProduct,DataStateAllProduct> implements interfacesAllProductDisconnect{
//   interfaceGetDataProductStorageLocal dataGetProductLocal;
//   BlocAllProductDisconnect(this.dataGetProductLocal) : super(
//     DataAllProduct(
//       scrollControl: scrollController, 
//       getData: [],
//       loadingScroll: true,
//       loadingApi: true,
//     ),
//   ){
//     on<Product>((event, emit) async{
//       await GetDataAllProduct();
//     });
//   }

//   @override
//   GetDataAllProduct() async{
//     late List<Map<String, dynamic>> dataGetLocal = [];
//     final dataLocal = await dataGetProductLocal.GetDataProductLocal();
//     dataGetLocal = dataLocal;
//     emit(DataAllProduct(
//       scrollControl: scrollController, 
//       getData: dataGetLocal,
//       loadingScroll: false,
//       loadingApi: false,
//     ));
//   }
// }