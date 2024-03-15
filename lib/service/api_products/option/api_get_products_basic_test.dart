// import 'dart:async';
// import 'dart:convert';

// import 'package:foosel/model/products.dart';
// import 'package:foosel/service/api_konstanta.dart';

// mixin apiGetProducts{
//   late List dataListProducts = [];
//   late int perPage = 5;
//   late bool loadingScroll = false;
//   late dynamic responseProducts;
//   late bool loadingApiAll = false;
  
  // Stream getApiProduct() async* {
  //   print("test service api");
  //   Map<String, String> parameterApi = {
  //       'page' : '$pages',
  //       'limit' : '5',
  //     };
  //   String? parameterString = Uri(queryParameters: parameterApi).query;
  //   yield* Stream.periodic(Duration(seconds: 5), (_) {
  //     return Api.client.get(Uri.parse('${Api.baseURL}/products?' + parameterString));
  //   }).asyncMap((event) async => await event);
  // }

  // Stream getApiProduct() async* {
  //   if(loadingScroll == true){
  //     Map<String, String> parameterApi = {
  //       'page' : '1',
  //       'limit' : '$perPage',
  //     };
  //     String? parameterString = Uri(queryParameters: parameterApi).query;
  //     var responseProducts = await Api.client.get(Uri.parse('${Api.baseURL}/products?' + parameterString));
  //     if(responseProducts.statusCode == 200){
  //       var parse = await json.decode(responseProducts.body);
  //       Products productsDataModel = Products.fromJson(parse);
  //       dataListProducts.addAll(productsDataModel.data!.data!);
  //       perPage = perPage+5;
  //     }else{
  //       throw Exception('data gagal');
  //     }
  //     yield dataListProducts;
  //     // loadingScroll = false;
  //   }
  //   else{
  //     Map<String, String> parameterApi = {
  //       'page' : '1',
  //       'limit' : '$perPage',
  //     };
  //     String? parameterString = Uri(queryParameters: parameterApi).query;
  //     yield* Stream.periodic(Duration(seconds: 5), (_) async{
  //       var responseProducts = await Api.client.get(Uri.parse('${Api.baseURL}/products?' + parameterString));
  //       if(responseProducts.statusCode == 200){
  //         var parse = await json.decode(responseProducts.body);
  //         Products productsDataModel = Products.fromJson(parse);
  //         dataListProducts.clear();
  //         dataListProducts.addAll(productsDataModel.data!.data!);
  //       }else{
  //         throw Exception('data gagal');
  //       }
  //       return dataListProducts;
  //     }).asyncMap((event) async => await event);
  //   }
  // }

  // Stream getApiProduct() async* {
  //   if(loadingScroll == true){
  //     perPage = perPage+5;
  //     loadingScroll = false;
  //   }
  //   Map<String, String> parameterApi = {
  //     'page' : '1',
  //     'limit' : '$perPage',
  //   };
  //   String? parameterString = await Uri(queryParameters: parameterApi).query;
  //   yield* Stream.periodic(Duration(seconds: 5), (_) async{
  //     var responseProducts = await Api.client.get(Uri.parse('${Api.baseURL}/products?' + parameterString));
  //     if(responseProducts.statusCode == 200){
  //       var parse = await json.decode(responseProducts.body);
  //       Products productsDataModel = Products.fromJson(parse);
  //       dataListProducts.clear();
  //       dataListProducts.addAll(productsDataModel.data!.data!);
  //     }else{
  //       throw Exception('data gagal');
  //     }
  //     return dataListProducts;
  //   }).asyncMap((event) async => await event);
  // }
// }

// mixin apiGetProducts{
//   late List dataListProducts = [];
//   late List dataProducts = [];
//   late int pages = 5;
//   late bool loadingScroll = false;
//   late bool loadingApi = false;

//   Future getProduct() async{
//     if(loadingScroll == true){
//       print("awal product api $pages");
//       StreamSubscription subscription = getApiProduct().listen((data) {
//         dataProducts.clear();
//         dataProducts.addAll(data);
//         loadingApi = true;
//       });
//       loadingScroll = false;
//       // subscription.cancel();
//       return dataProducts;
//     }
//   }

  // Stream getApiProduct() async*{
  //   try {
  //     // if(loadingScroll == true || dataListProducts.isEmpty){
  //       pages = pages+5;
  //       Map<String, String> parameterApi = {
  //         'page' : '1',
  //         'limit' : '$pages',
  //       };
  //       String? parameterString = Uri(queryParameters: parameterApi).query;
  //       yield* Stream.periodic(Duration(seconds: 5), (_) async{
  //         var responseProducts = await Api.client.get(Uri.parse('${Api.baseURL}/products?' + parameterString));
  //         if(responseProducts.statusCode == 200){
  //           var parse = await json.decode(responseProducts.body);
  //           Products productsDataModel = Products.fromJson(parse);
  //           dataListProducts.clear();
  //           dataListProducts.addAll(productsDataModel.data!.data!);
  //         }else{
  //           throw Exception('data gagal');
  //         }
  //         return dataListProducts;
  //       }).asyncMap((event) async => await event);
  //     // }
  //   } catch (e) {
  //     throw Exception('data error');
  //   }
  // }

//   Stream getApiProduct() async*{
//     try {
//       Map<String, String> parameterApi = {
//         'page' : '1',
//         'limit' : '$pages',
//       };
//       print("akhir product api $pages");
//       String? parameterString = Uri(queryParameters: parameterApi).query;
//       final responseProducts = await Api.client.get(Uri.parse('${Api.baseURL}/products?' + parameterString));
//       if(responseProducts.statusCode == 200){
//         final parse = await json.decode(responseProducts.body);
//         Products productsDataModel = Products.fromJson(parse);
//         dataListProducts.clear();
//         dataListProducts.addAll(productsDataModel.data!.data!.toList());
//       }else{
//         throw Exception('data gagal');
//       }
//       yield dataListProducts;
//     } catch (e) {
//       throw Exception('data error');
//     }
//   }
// }

// mixin apiGetProducts{
//   late List dataListProducts = [];
//   late List dataProducts = [];
//   late int page = 1;
//   late bool loadingScroll = false;
//   // late bool loadingApiAll = false;

//   Stream getApiProduct() async*{
//     try {
//       // if(loadingScroll == true || dataListProducts.isEmpty){
//         Map<String, String> parameterApi = {
//           'page' : '$page',
//           'limit' : '5',
//         };
//         String? parameterString = Uri(queryParameters: parameterApi).query;
//         final responseProducts = await Api.client.get(Uri.parse('${Api.baseURL}/products?' + parameterString));
//         if(responseProducts.statusCode == 200){
//           final parse = await json.decode(responseProducts.body);
//           Products productsDataModel = Products.fromJson(parse);
//           dataListProducts.addAll(productsDataModel.data!.data!.toList());
//           page++;
//           // loadingScroll = false;
//         }else{
//           throw Exception('data gagal');
//         }
//       // }
//       yield dataListProducts;
//     } catch (e) {
//       throw Exception('data error');
//     }
//   }
// }

// StreamSubscription subscription = await GetDataStream(pages: pages).listen((data) {
      //   dataProducts.clear();
      //   dataProducts.addAll(data);
      //   return data;
      // });
      // return await dataProducts;

//   try {
  //     Map<String, String> parameterApi = {
  //       'page' : '1',
  //       'limit' : '$pages',
  //     };
  //     String? parameterString = await Uri(queryParameters: parameterApi).query;
  //     final responseProducts = await Api.client.get(Uri.parse('${Api.baseURL}/products?' + parameterString));
  //     if(responseProducts.statusCode == 200){
  //       final parse = await json.decode(responseProducts.body);
  //       Products productsDataModel = Products.fromJson(parse);
  //       dataListProducts.clear();
  //       dataListProducts.addAll(productsDataModel.data!.data!.toList());
  //     }else{
  //       throw Exception('data gagal');
  //     }
  //     yield await dataListProducts;
  //   } catch (e) {
  //     throw Exception('data error');
  //   }