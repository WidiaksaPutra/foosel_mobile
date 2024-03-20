// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:foosel/blocs/bloc_all_products/bloc_event_all_products.dart';
// import 'package:foosel/blocs/bloc_all_products/bloc_state_all_products.dart';
// import 'package:foosel/blocs/bloc_default/default/default_konstanta.dart';
// import 'package:foosel/helpers/products/product_popular/helper_products.dart';
// import 'package:foosel/service/api_products/api_get_products.dart';
// import 'package:foosel/service/api_products/api_get_products_popular.dart';
// import 'package:foosel/service/api_transaction_item.dart';

// class BlocAllProductConnect extends Bloc<dataEventAllProduct,DataStateAllProduct> with apiGetProducts, apiGetProductsPopular, apiTransactionItem, helperProducts, helperProductsPopular, DefaultSharedPref implements InterfaceScrollList{
//   BlocAllProductConnect() : super(DataAllProduct([], false, false, false, [], false)){
//     // StreamBuilder streamData = StreamBuilder(
//     //   stream: getProducts(), 
//     //   builder: ,
//     // );
//     on<Product>((event, emit){
//       // popularProduct(event.scrollControl);
//       allProductConnection(event.scrollControl, event.context);
//       // getData(event.scrollControl);
//       // scrollControl(event.scrollControl, event.context);
//     });
//   }
  
// //   @override
// //   getData(ScrollController scrollCont) async{
// //     await getProducts();
// //     emit(DataAllProduct(dataListProducts, loadingAll, scrollCont, loadingApiAll, dataListProductsPopular, loadingApiPopular));
// //   }
  
// //   @override
// //   scrollControl(ScrollController scrollCont, BuildContext context) async{
// //     await getProducts();
// //     emit(DataAllProduct(dataListProducts, loadingAll, scrollCont, loadingApiAll, dataListProductsPopular, loadingApiPopular));
// //     scrollCont.addListener(() async {
// //       if(scrollCont.position.pixels == scrollCont.position.maxScrollExtent){
// //         await deleteDataProducts();
// //         loadingAll = true;
// //         await getProducts();
// //         // ignore: invalid_use_of_visible_for_testing_member
// //         emit(DataAllProduct(dataListProducts, loadingAll, scrollCont, loadingApiAll, dataListProductsPopular, loadingApiPopular));
// //         await Future.delayed(const Duration(milliseconds: 1000));
// //         loadingAll = false;
// //         // ignore: invalid_use_of_visible_for_testing_member
// //         emit(DataAllProduct(dataListProducts, loadingAll, scrollCont, loadingApiAll, dataListProductsPopular, loadingApiPopular));
// //       }
// //     });
// //   }

// //   allProductConnection(ScrollController scrollControl, BuildContext context) async{
// //     await deleteDataProducts();
// //     print("test mmm");
// //     streamData;
// //     // print(dataListProducts);
// //     emit(DataAllProduct(dataListProducts, loadingAll, scrollControl, loadingApiAll, dataListProductsPopular, loadingApiPopular));
// //     scrollControl.addListener(() async {
// //       if(scrollControl.position.pixels == scrollControl.position.maxScrollExtent){
// //         await deleteDataProducts();
// //         loadingAll = true;
// //         streamData;
// //         // ignore: invalid_use_of_visible_for_testing_member
// //         emit(DataAllProduct(dataListProducts, loadingAll, scrollControl, loadingApiAll, dataListProductsPopular, loadingApiPopular));
// //         await Future.delayed(const Duration(milliseconds: 1000));
// //         loadingAll = false;
// //         // ignore: invalid_use_of_visible_for_testing_member
// //         emit(DataAllProduct(dataListProducts, loadingAll, scrollControl, loadingApiAll, dataListProductsPopular, loadingApiPopular));
// //       }
// //     });
// //     late List dataListProducts2 = [];
// //     if(dataListProducts.length <= 5 || dataListProducts.length > 5 && dataListProducts.length < 10){
// //       for(int i = 0; i < dataListProducts.length; i++) {
// //         insertDataProducts(description: dataListProducts[i].description.toString(), tokenId: dataListProducts[i].tokenId.toString(), name: dataListProducts[i].name.toString(), nameCategory: dataListProducts[i].category!.name.toString(), price: dataListProducts[i].price.toString());
// //         dataListProducts2.add(dataListProducts[i]);
// //       }
// //     }else{
// //       for(int i = 0; i < 10; i++) {
// //         insertDataProducts(description: dataListProducts[i].description.toString(), tokenId: dataListProducts[i].tokenId.toString(), name: dataListProducts[i].name.toString(), nameCategory: dataListProducts[i].category!.name.toString(), price: dataListProducts[i].price.toString());
// //         dataListProducts2.add(dataListProducts[i]);
// //       }
// //     }
// //     await Future.delayed(const Duration(milliseconds: 1000));
// //     for (int i = 0; i < dataListProducts2.length; i++) { 
// //       insertDataProducts(description: dataListProducts2[i].description.toString(), tokenId: dataListProducts2[i].tokenId.toString(), name: dataListProducts2[i].name.toString(), nameCategory: dataListProducts2[i].category.name.toString(), price: dataListProducts2[i].price.toString());
// //     }
// //   }  
// //   // }
//   popularProduct(ScrollController scrollControl) async{
//     // if(dataListProductsPopular != []){
//     //   dataListProductsPopular.clear();
//     //   dataListTransactionItem.clear();
//     //   emit(DataAllProduct([], false, false, false, [], false));
//     // }
//     await transactionItem();
//     await getProducts();
//     await deleteDataProductsPopular();
//     await Future.delayed(const Duration(milliseconds: 1000)); //tujuannya untuk menunggu function transactionItem() 
//     //dan products() hingga selesai mengambil data

//     if(dataListProducts.isNotEmpty){
//       loadingApiPopular = true;
//     }
    
//     late List idProduct = [];
//     late List nameProduct = [];
//     late List quantityProduct = [];

//     idProduct.clear();
//     nameProduct.clear();
//     quantityProduct.clear();

//     for(int i = 0; i < dataListTransactionItem.length; i++){
//       for(int j = 0; j < dataListTransactionItem[i].transactionItem!.length ; j++){
//         idProduct.add(dataListTransactionItem[i].transactionItem![j].productsId);
//         quantityProduct.add(dataListTransactionItem[i].transactionItem![j].quantity);
//         nameProduct.add(dataListTransactionItem[i].transactionItem![j].products![0].name);
//       }
//     }
    
//     for(int o = 0; o < 2; o++){
//       for(int i = 0; i < idProduct.length; i++){
//         num n = 0;
//         num n2 = 0;
//         for(int j = 0; j < idProduct.length; j++){
//           if(o == 0){
//             if(i!=j && idProduct[i] == idProduct[j]){
//               n = n + quantityProduct[i] + quantityProduct[j]; 
//               idProduct.removeAt(j);
//               nameProduct.removeAt(j);
//               quantityProduct.removeAt(j);
//             }
//           }
//           else{
//             if(i!=j && quantityProduct[j] <= quantityProduct[i]){
//               n = quantityProduct[j];
//               quantityProduct[j] = quantityProduct[i];
//               quantityProduct[i] = n;

//               n2 = idProduct[j];
//               idProduct[j] = idProduct[i];
//               idProduct[i] = n2;

//               String n3 = nameProduct[j];
//               nameProduct[j] = nameProduct[i];
//               nameProduct[i] = n3;
//             }
//           }
//         }
//         if(n != 0.0 && o == 0){
//           quantityProduct[i] = n;
//         }
//       }
//     }

//     for(int i = 0; i < idProduct.length; i++){
//         getProductsPopular(name: nameProduct[i]);
//     }
//     await Future.delayed(const Duration(milliseconds: 1000));

//     for(int j = 0; j < dataListProductsPopular.length; j++){
//       for(int k = 0; k < dataListProductsPopular.length; k++){
//         if(j!=k){
//           if(dataListProductsPopular[j].name == dataListProductsPopular[k].name){
//             dataListProductsPopular.removeAt(k);
//           }
//         }
//       }
//     }
//     await Future.delayed(const Duration(milliseconds: 1000));

//     var tukar; 
//     for(int i = 0; i < idProduct.length; i++){
//       for(int j = 0; j < dataListProductsPopular.length; j++){
//         if(nameProduct[i] == dataListProductsPopular[j].name){
//           tukar = dataListProductsPopular[j];
//           dataListProductsPopular[j] = dataListProductsPopular[i];
//           dataListProductsPopular[i] = tukar;
//         }
//       }
//     }    
//     await Future.delayed(const Duration(milliseconds: 1000));
    
//     emit(DataAllProduct(dataListProducts, loadingAll, scrollControl, loadingApiAll, dataListProductsPopular, loadingApiPopular));
//     for (int i = 0; i < dataListProductsPopular.length; i++) {
//       // insertDataProductsPopular(description: dataListProductsPopular[i].description.toString(), tokenId: dataListProductsPopular[i].tokenId.toString(), name: dataListProductsPopular[i].name.toString(), nameCategory: dataListProductsPopular[i].category!.name.toString(), price: dataListProductsPopular[i].price.toString());
//     }
//   }
// }