import 'dart:convert';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_get_data_detail_product.dart';
import 'package:flutter_laravel_toko_sepatu/model/detail_products.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_konstanta.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class apiGetDetailProducts implements interfaceGetDataDetailProduct{
  late Datum? dataProducts = Datum();
  late bool loading = true;

  @override
  GetDataDetailProduct({
    required String tokenId
  }) async{
    try {
      final tokenUser = await SharedPreferences.getInstance();
      String tokens = tokenUser.getString('token').toString();
      if(tokens == 'null'){
        await TokenNull(tokenId: tokenId);
      }else{
        await TokenNotNull(tokens: tokens, tokenId: tokenId);
      }
      return await dataProducts;
    }catch (e) {
      throw Exception('data error');
    }// TODO: implement GetDataDetailProduct
  }

  TokenNull({required String tokenId}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    Map<String, String> parameterApi = {
      'token_id' : tokenId,
    };
    await GetDataProductUsers(
      parameterApi: parameterApi,
      link: 'detailGuest', 
      headers: headers,
    );
    return dataProducts;
  }

  TokenNotNull({
    required String tokens,
    required String tokenId
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
        tokenId: tokenId,
      );
    }else{
      await RolePembeli(
        headers: headers,
        tokenId: tokenId,
      );
    }
    return dataProducts;
  }

  RolePenjual({
    required Map<String, String>? headers,
    required String tokenId,
  }) async {
    Map<String, String> parameterApi = {
      'token_id' : tokenId,
    };
    await GetDataProductUsers(
      parameterApi: parameterApi,
      link: 'detailPenjual',
      headers: headers,
    );
    return dataProducts;
  }

  RolePembeli({
    required Map<String, String>? headers,
    required String tokenId,
  }) async {
    Map<String, String> parameterApi = {
      'token_id' : tokenId,
    };
    await GetDataProductUsers(
      parameterApi: parameterApi,
      link: 'detailPembeli',
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
    final responseDetailProducts = await Api.client.get(
      Uri.parse('${Api.baseURL}/$link?' + parameterString),
      headers: headers,
    );
    if(responseDetailProducts.statusCode == 200){
      final parse = await json.decode(responseDetailProducts.body);
      DetailProducts detailProductsDataModel = DetailProducts.fromJson(parse);
      dataProducts = detailProductsDataModel.data!.data[0];
      loading = false;
    }else{
      throw Exception('data gagal');
    }
    return dataProducts;
  }
  
  @override
  bool LoadingGetDataDetailProduct() {
    return loading;
  }
}