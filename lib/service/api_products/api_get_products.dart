// ignore_for_file: unnecessary_null_comparison
import 'dart:convert';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_get_data_product.dart';
import 'package:flutter_laravel_toko_sepatu/model/products.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_konstanta.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class apiGetProducts implements interfaceGetDataProduct{
  late List dataProducts = [];

  @override
  GetDataProduct({
    required int pages
  }) async {
    try {
      final tokenUser = await SharedPreferences.getInstance();
      String tokens = tokenUser.getString('token').toString();
      if(tokens == 'null'){
        await TokenNull(pages: pages);
      }else{
        await TokenNotNull(
          pages: pages,
          tokens: tokens,
        );
      }
      return await dataProducts;
    }catch (e) {
      throw Exception('data error');
    }
  }

  TokenNull({
    required int pages,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    Map<String, String> parameterApi = {
      'page' : '1',
      'limit' : pages.toString(),
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
    required int pages,
  }) async {
    Map<String, dynamic> decodeTokenUser = await JwtDecoder.decode(tokens);
    String role = decodeTokenUser['roles'].toString();
    Map<String, String> headers = {
      'Authorization': 'Bearer $tokens',
      'Content-Type': 'application/json; charset=UTF-8',
    };
    if(role == "PENJUAL"){
      await RolePenjual(
        pages: pages,
        headers: headers,
      );
    }else{
      await RolePembeli(
        pages: pages,
        headers: headers,
      );
    }
    return dataProducts;
  }

  RolePenjual({
    required int pages,
    required Map<String, String>? headers
  }) async {
    Map<String, String> parameterApi = {
      'page' : '1',
      'limit' : pages.toString(),
    };
    await GetDataProductUsers(
      parameterApi: parameterApi, 
      link: 'productsPenjual',
      headers: headers,
    );
    return dataProducts;
  }

  RolePembeli({
    required int pages,
    required Map<String, String>? headers
  }) async {
    Map<String, String> parameterApi = {
      'page' : '1',
      'limit' : pages.toString(),
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
      dataProducts.clear();
      dataProducts.addAll(productsDataModel.data!.data.toList());
    }else{
      throw Exception('data gagal');
    }
    return dataProducts;
  }
}