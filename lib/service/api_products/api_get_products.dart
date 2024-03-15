// ignore_for_file: unnecessary_null_comparison
import 'dart:convert';
import 'package:foosel/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:foosel/interface/interface_local/service/interface_get_data_product.dart';
import 'package:foosel/model/products.dart';
import 'package:foosel/service/api_konstanta.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class apiGetProducts with defaultSharedPref implements interfaceGetDataProduct{
  late List dataProducts = [];
  late String tokens;

  @override
  GetDataProduct({
    bool testing = false,
    String testingToken = "",
    required int pages
  })async {
    try {
      if(testing == false){
        await sharedPref();
        tokens = prefs.getString('token').toString();
        print("test token $tokens");
      }else{
        (testingToken == "") ? tokens = 'null' : tokens = testingToken;
      }
      if(tokens == 'null'){
        if(testing == false){
          return await TokenNull(pages: pages);
        }else{
          await TokenNull(pages: pages);
          return "berhasil";
        }  
      }else{
        if(testing == false){
          return await TokenNotNull(pages: pages, tokens: tokens); 
        }else{
          await TokenNotNull(pages: pages, tokens: tokens);
          return "berhasil";
        }
      }
    }catch (e) {
      throw Exception('data error');
    }
  }

  TokenNull({
    bool testing = false,
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
    return (testing == false) ? dataProducts : "berhasil";
  }

  TokenNotNull({
    bool testing = false,
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
    return (testing == false) ? dataProducts : "berhasil";
  }

  RolePenjual({
    bool testing = false,
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
    return (testing == false) ? dataProducts : "berhasil";
  }

  RolePembeli({
    bool testing = false,
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
      dataProducts.clear();
      dataProducts.addAll(productsDataModel.data!.data.toList());
    }else{
      throw Exception('data gagal');
    }
    return (testing == false) ? dataProducts : "berhasil";
  }
}