// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:foosel/blocs/bloc_all_products/bloc_event_all_products.dart';
// import 'package:foosel/blocs/bloc_all_products/bloc_state_all_products.dart';
// import 'package:foosel/helpers/products/product_all/helper_products_test.dart';
// import 'package:foosel/interface/interface_get_list_data.dart';
// import 'package:foosel/service/api_products/api_get_products.dart';

// ScrollController scrollController = ScrollController();
// late List dataProduct = [];
// late bool apiLoading = false;
// late bool scrollLoading = false;
// class BlocAllProductConnect extends Bloc<dataEventAllProduct,DataStateAllProduct> with apiGetProducts, helperProducts implements interfaceGetListData{
//   BlocAllProductConnect() : super(
//     DataAllProduct(
//       scrollControl: scrollController,
//       getData: dataProduct, 
//       loadingScroll: scrollLoading,
//       loadingApi: apiLoading,
//     ),
//   ){
//     on<Product>((event, emit) async{
//       await depedencyInversion(event.connect);
//     });
//   }

//   @override
//   depedencyInversion(connect) async{
//     final dataFuture;
//     (connect == true)
//     ? {
//         loadingScroll = true,
//         dataFuture = await getProduct(),
//         dataProduct = await dataProducts,
//         apiLoading = loadingApi,
//         await getData(dataFuture),
//         await scrollControl(),
//         await saveLocalData(),
//       }
//     : {
//         // dataFuture = await getDataProducts(),
//         // dataList = await dataFuture,
//         // await getData(connect, dataFuture, dataList),
//       };
//   }

//   @override
//   depedencyInversionScroll() async{
//     loadingScroll = true;
//     scrollLoading = loadingScroll;
//     await getProduct();
//     apiLoading = loadingApi;
//     dataProduct = await dataProducts;
//     loadingScroll = false;
//   }

//   @override
//   getData(dataFuture) async{
//     dataFuture;
//     emit(
//       DataAllProduct(
//         scrollControl: scrollController,
//         getData: dataProduct,
//         loadingScroll: false,
//         loadingApi: apiLoading,
//       ),
//     );
//   }
  
//   @override
//   scrollControl() async{
//     scrollController.addListener(() async {
//       if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
//         pages++;
//         await depedencyInversionScroll();  
//         emit(
//           DataAllProduct(
//             scrollControl: scrollController,
//             getData: dataProduct, 
//             loadingScroll: scrollLoading,
//             loadingApi: apiLoading,
//           ),
//         );
//         await Future.delayed(const Duration(milliseconds: 1000));
//         emit(
//           DataAllProduct(
//             scrollControl: scrollController,
//             getData: dataProduct,
//             loadingScroll: false,
//             loadingApi: apiLoading,
//           ),
//         );
//       }
//     });
//   }
  
//   @override
//   saveLocalData() async{
//     await deleteDataProducts();
//     late List dataListProducts2 = [];
//     if(dataListProducts.length <= 5 || dataListProducts.length > 5 && dataListProducts.length < 10){
//       for(int i = 0; i < dataListProducts.length; i++) {
//         insertDataProducts(description: dataListProducts[i].description.toString(), tokenId: dataListProducts[i].tokenId.toString(), name: dataListProducts[i].name.toString(), nameCategory: dataListProducts[i].category!.name.toString(), price: dataListProducts[i].price.toString());
//         dataListProducts2.add(dataListProducts[i]);
//       }
//     }else{
//       for(int i = 0; i < 10; i++) {
//         insertDataProducts(description: dataListProducts[i].description.toString(), tokenId: dataListProducts[i].tokenId.toString(), name: dataListProducts[i].name.toString(), nameCategory: dataListProducts[i].category!.name.toString(), price: dataListProducts[i].price.toString());
//         dataListProducts2.add(dataListProducts[i]);
//       }
//     }
//     await Future.delayed(const Duration(milliseconds: 1000));
//     for (int i = 0; i < dataListProducts2.length; i++) { 
//       insertDataProducts(description: dataListProducts2[i].description.toString(), tokenId: dataListProducts2[i].tokenId.toString(), name: dataListProducts2[i].name.toString(), nameCategory: dataListProducts2[i].category.name.toString(), price: dataListProducts2[i].price.toString());
//     }
//   }
// }