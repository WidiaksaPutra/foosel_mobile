// ignore_for_file: unnecessary_null_comparison
import 'dart:convert';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/service/api_products/interfaces/interface_get_data_product.dart';
import 'package:foosel/model/products.dart';
import 'package:foosel/service/api_konstanta.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class ApiGetProducts with SharedPref implements InterfaceGetDataProduct{
  late List dataProducts = [];
  late String tokens;

  @override
  getDataProduct({
    bool testing = false,
    String testingToken = "",
    required int pages
  })async {
    try {
      if(testing == false){
        await sharedPref();
        tokens = prefs.getString('token').toString();
      }else{
        (testingToken == "") ? tokens = 'null' : tokens = testingToken;
      }
      if(tokens == 'null'){
        if(testing == false){
          return await tokenNull(pages: pages);
        }else{
          await tokenNull(pages: pages);
          return "berhasil";
        }  
      }else{
        if(testing == false){
          return await tokenNotNull(pages: pages, tokens: tokens); 
        }else{
          await tokenNotNull(pages: pages, tokens: tokens);
          return "berhasil";
        }
      }
    }catch (e) {
      throw Exception('data error');
    }
  }

  tokenNull({
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
    await getDataProductUsers(
      parameterApi: parameterApi, 
      link: 'products', 
      headers: headers,
    );
    return (testing == false) ? dataProducts : "berhasil";
  }

  tokenNotNull({
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
      await rolePenjual(
        pages: pages,
        headers: headers,
      );
    }else{
      await rolePembeli(
        pages: pages,
        headers: headers,
      );
    }
    return (testing == false) ? dataProducts : "berhasil";
  }

  rolePenjual({
    bool testing = false,
    required int pages,
    required Map<String, String>? headers
  }) async {
    Map<String, String> parameterApi = {
      'page' : '1',
      'limit' : pages.toString(),
    };
    await getDataProductUsers(
      parameterApi: parameterApi, 
      link: 'productsPenjual',
      headers: headers,
    );
    return (testing == false) ? dataProducts : "berhasil";
  }

  rolePembeli({
    bool testing = false,
    required int pages,
    required Map<String, String>? headers
  }) async {
    Map<String, String> parameterApi = {
      'page' : '1',
      'limit' : pages.toString(),
    };
    await getDataProductUsers(
      parameterApi: parameterApi,
      link: 'productsPembeli',
      headers: headers,
    );
    return (testing == false) ? dataProducts : "berhasil";
  }

  getDataProductUsers({
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