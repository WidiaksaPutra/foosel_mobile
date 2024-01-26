import 'dart:convert';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_get_data_products_category.dart';
import 'package:flutter_laravel_toko_sepatu/model/products.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_konstanta.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class apiGetProductsCategori implements interfaceGetDataProductsCategory{
  late List dataProducts = [];
  late int pages = 1;

  @override
  GetDataProductsCategory({ 
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
      final tokenUser = await SharedPreferences.getInstance();
      String tokens = tokenUser.getString('token').toString();
      if(tokens == 'null'){
        await TokenNull(
          categoriesId: categoriesId);
      }else{
        await TokenNotNull(
          tokens: tokens,
          categoriesId: categoriesId,
        );
      }
      return await dataProducts;
    }catch (e) {
      throw Exception('data error');
    }
  }

  TokenNull({
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
    return dataProducts;
  }

  TokenNotNull({
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
    return dataProducts;
  }

  RolePenjual({
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
    return dataProducts;
  }

  RolePembeli({
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
    return dataProducts;
  }

  GetDataProductUsers({
    required Map<String, dynamic> parameterApi,
    required Map<String, String>? headers,
    required String link,
  }) async {
    String? parameterString = await Uri(queryParameters: parameterApi).query;
    final responseProducts = await Api.client.get(
      Uri.parse('${Api.baseURL}/$link?' + parameterString),
      headers: headers,
    );
    if(responseProducts.statusCode == 200){
      final parse = await json.decode(responseProducts.body);
      Products productsDataModel = await Products.fromJson(parse);
      pages++;
      dataProducts.addAll(await productsDataModel.data!.data.toList());
    }else{
      throw Exception('data gagal');
    }
    return dataProducts;
  }
}