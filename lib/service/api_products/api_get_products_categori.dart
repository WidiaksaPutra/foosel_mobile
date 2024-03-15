import 'dart:convert';
import 'package:foosel/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:foosel/interface/interface_local/service/interface_get_data_products_category.dart';
import 'package:foosel/model/products.dart';
import 'package:foosel/service/api_konstanta.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class apiGetProductsCategori with defaultSharedPref implements interfaceGetDataProductsCategory{
  late List dataProducts = [];
  late int pages = 1;
  late String tokens;

  @override
  GetDataProductsCategory({ 
    bool testing = false,
    String testingToken = "",
    required String categoriesId, 
    required bool fresh,
  }) async {
    try{
      if(fresh == true){
        pages = 1;
        dataProducts.clear();
      }
      if(dataProducts.isNotEmpty && (categoriesId != dataProducts[0].category!.id.toString())){
        categoriesId = dataProducts[0].category!.id.toString();
      }
      if(testing == false){
        await sharedPref();
        tokens = prefs.getString('token').toString();
      }else{
        (testingToken == "") ? tokens = 'null' : tokens = testingToken;
      }
      if(tokens == 'null'){
        if(testing == false){
          return await TokenNull(categoriesId: categoriesId);
        }else{
          await TokenNull(categoriesId: categoriesId);
          return "berhasil";
        }  
      }else{
        if(testing == false){
          return await TokenNotNull(tokens: tokens, categoriesId: categoriesId); 
        }else{
          await TokenNotNull(tokens: tokens, categoriesId: categoriesId);
          return "berhasil";
        }
      }
    }catch (e) {
      throw Exception('data error');
    }
  }

  TokenNull({
    bool testing = false,
    required String categoriesId
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    Map<String, String> parameterApi = {
      'categories_id' : await categoriesId,
      'page' : pages.toString(),
      'limit' : '5',
    };
    await GetDataProductUsers(
      parameterApi: parameterApi, 
      link: 'products', 
      headers: headers, 
    );
    return (testing == false) ? dataProducts : "berhasil";
  }

  TokenNotNull({
    bool testing = false,
    required String tokens,
    required String categoriesId,
  }) async {
    Map<String, dynamic> decodeTokenUser = await JwtDecoder.decode(tokens);
    String role = decodeTokenUser['roles'].toString();
    Map<String, String> headers = {
      'Authorization': 'Bearer $tokens',
      'Content-Type': 'application/json; charset=UTF-8',
    };
    if(role == "PENJUAL"){
      await RolePenjual(
        headers: headers, 
        categoriesId: categoriesId,
      );
    }else{
      await RolePembeli(
        headers: headers, 
        categoriesId: categoriesId,
      );
    }
    return (testing == false) ? dataProducts : "berhasil";
  }

  RolePenjual({
    bool testing = false,
    required Map<String, String>? headers,
    required String categoriesId,
  }) async {
    Map<String, String> parameterApi = {
      'categories_id' : categoriesId,
      'page' : pages.toString(),
      'limit' : '5',
    };
    await GetDataProductUsers(
      parameterApi: parameterApi, 
      link: 'productsPenjual',
      headers: headers, 
    );
    return (testing == false) ? dataProducts : "berhasil";
  }

  RolePembeli({
    bool testing = false,
    required Map<String, String>? headers,
    required String categoriesId,
  }) async {
    Map<String, String> parameterApi = {
      'categories_id' : categoriesId,
      'page' : pages.toString(),
      'limit' : '5',
    };
    await GetDataProductUsers(
      parameterApi: parameterApi,
      link: 'productsPembeli',
      headers: headers, 
    );
    return (testing == false) ? dataProducts : "berhasil";
  }

  GetDataProductUsers({
    bool testing = false,
    required Map<String, dynamic> parameterApi,
    required Map<String, String>? headers,
    required String link,
  }) async {
    String? parameterString = await Uri(queryParameters: parameterApi).query;
    final responseProducts = await Api.client.get(
      Uri.parse('${Api.baseURL}/$link?' + parameterString),
      headers: headers,
    ).timeout(const Duration(seconds: 10));
    if(responseProducts.statusCode == 200){
      final parse = await json.decode(responseProducts.body);
      Products productsDataModel = await Products.fromJson(parse);
      pages++;
      dataProducts.addAll(await productsDataModel.data!.data.toList());
      return (testing == false) ? dataProducts : "berhasil";
    }else{
      throw Exception('data gagal');
    }
  }
}