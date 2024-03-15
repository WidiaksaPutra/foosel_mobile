import 'dart:convert';
import 'package:foosel/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:foosel/interface/interface_local/service/interface_get_data_detail_product.dart';
import 'package:foosel/model/detail_products.dart';
import 'package:foosel/service/api_konstanta.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class apiGetDetailProducts with defaultSharedPref implements interfaceGetDataDetailProduct{
  late Datum? dataProducts = Datum();
  late bool loading = true;
  late String tokens;

  @override
  GetDataDetailProduct({
    bool testing = false,
    String testingToken = "",
    required String tokenId
  }) async{
    try {
      if(testing == false){
        await sharedPref();
        tokens = prefs.getString('token').toString();
      }else{
        (testingToken == "") ? tokens = 'null' : tokens = testingToken;
      }
      if(tokens == 'null'){
        if(testing == false){
          return await TokenNull(tokenId: tokenId);
        }else{
          await TokenNull(tokenId: tokenId);
          return "berhasil";
        }  
      }else{
        if(testing == false){
          return await TokenNotNull(tokens: tokens, tokenId: tokenId); 
        }else{
          await TokenNotNull(tokens: tokens, tokenId: tokenId);
          return "berhasil";
        }
      }
    }catch (e) {
      throw Exception('data error');
    }
  }

  TokenNull({
    bool testing = false,
    required String tokenId,
  }) async {
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
    return (testing == false) ? dataProducts : "berhasil";
  }

  TokenNotNull({
    bool testing = false,
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
    return (testing == false) ? dataProducts : "berhasil";
  }

  RolePenjual({
    bool testing = false,
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
    return (testing == false) ? dataProducts : "berhasil";
  }

  RolePembeli({
    bool testing = false,
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
    return (testing == false) ? dataProducts : "berhasil";
  }

  GetDataProductUsers({
    bool testing = false,
    required Map<String, dynamic> parameterApi,
    required Map<String, String>? headers,
    required String link,
  }) async {
    String? parameterString = await Uri(queryParameters: parameterApi).query;
    final responseDetailProducts = await Api.client.get(
      Uri.parse('${Api.baseURL}/$link?' + parameterString),
      headers: headers,
    ).timeout(const Duration(seconds: 10));
    if(responseDetailProducts.statusCode == 200){
      final parse = await json.decode(responseDetailProducts.body);
      DetailProducts detailProductsDataModel = DetailProducts.fromJson(parse);
      dataProducts = detailProductsDataModel.data!.data[0];
      loading = false;
      return (testing == false) ? dataProducts : "berhasil";
    }else{
      throw Exception('data gagal');
    }
  }
  
  @override
  bool LoadingGetDataDetailProduct() {
    return loading;
  }
}