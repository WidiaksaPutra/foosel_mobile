// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:foosel/blocs/bloc_all_products/bloc_event_all_products.dart';
// import 'package:foosel/blocs/bloc_all_products/bloc_state_all_products.dart';
// import 'package:foosel/blocs/bloc_all_products/interfaces_all_products.dart';
// import 'package:foosel/interface/default/interface_delete_data_storage_local.dart';
// import 'package:foosel/interface/interface_local/service/interface_get_data_product.dart';
// import 'package:foosel/interface/interface_local/helpers/interface_insert_data_products_local.dart';

// ScrollController scrollController = ScrollController();
// class BlocAllProductConnect extends Bloc<dataEventAllProduct,DataStateAllProduct> implements interfacesAllProductConnect{
//   InterfaceGetDataProduct dataGetProduct;
//   InterfaceInsertDataProductsLocal dataGetProductLocal;
//   interfaceDeleteDataStorageLocal dataDeleteProductLocal;
//   BlocAllProductConnect(this.dataGetProduct, this.dataGetProductLocal, this.dataDeleteProductLocal) : super(
//     DataAllProduct(
//       scrollControl: scrollController,
//       getData: [], 
//       loadingScroll: true,
//       loadingApi: true,
//     ),
//   ){
//     on<Product>((event, emit) async{
//       await GetDataAllProduct(event.pages);
//       await ScrollControlAllProduct(event.pages);
//       await SaveLocalDataAllProduct();
//     });
//   }

//   @override
//   GetDataAllProduct(int pages) async{
//     dynamic dataList = await dataGetProduct.GetDataProduct(loadingApiService: true, pages: pages);
//     emit(
//       DataAllProduct(
//         scrollControl: scrollController,
//         getData: await dataList,
//         loadingScroll: false,
//         loadingApi: false,
//       ),
//     );
//   }
  
//   @override
//   ScrollControlAllProduct(int pages) async{
//     scrollController.addListener(() async {
//       if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
//         pages = pages + 5;
//         dynamic dataList = await dataGetProduct.GetDataProduct(loadingApiService: true, pages: pages);
//         emit(
//           DataAllProduct(
//             scrollControl: scrollController,
//             getData: await dataList, 
//             loadingScroll: true,
//             loadingApi: false,
//           ),
//         );
//         await Future.delayed(const Duration(milliseconds: 1000));
//         emit(
//           DataAllProduct(
//             scrollControl: scrollController,
//             getData: await dataList,
//             loadingScroll: false,
//             loadingApi: false,
//           ),
//         );
//       }
//     });
//   }

//   @override
//   SaveLocalDataAllProduct() async{
//     await dataDeleteProductLocal.DeleteDataLocal();
//     dynamic dataList = await dataGetProduct.GetDataProduct(loadingApiService: true, pages: pages);
//     if((dataList.length <= 5 || dataList.length > 5) && dataList.length < 10){
//       for(int i = 0; i < dataList.length; i++) {
//         await dataGetProductLocal.InsertDataLocal(
//           description: dataList[i].description.toString(),
//           tokenId: dataList[i].tokenId.toString(),
//           name: dataList[i].name.toString(),
//           nameCategory: dataList[i].category!.name.toString(),
//           price: dataList[i].price.toString(),
//         );
//       }
//     }
//   }
// }