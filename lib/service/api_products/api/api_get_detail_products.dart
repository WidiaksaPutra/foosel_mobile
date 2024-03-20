import 'dart:convert';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/service/api_products/interfaces/interface_get_data_detail_product.dart';
import 'package:foosel/model/detail_products.dart';
import 'package:foosel/service/api_konstanta.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class ApiGetDetailProducts with SharedPref implements InterfaceGetDataDetailProduct{
  late Datum? dataProducts = Datum();
  late bool loading = true;
  late String tokens;

  @override
  getDataDetailProduct({
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
          return await tokenNull(tokenId: tokenId);
        }else{
          await tokenNull(tokenId: tokenId);
          return "berhasil";
        }  
      }else{
        if(testing == false){
          return await tokenNotNull(tokens: tokens, tokenId: tokenId); 
        }else{
          await tokenNotNull(tokens: tokens, tokenId: tokenId);
          return "berhasil";
        }
      }
    }catch (e) {
      throw Exception('data error');
    }
  }

  tokenNull({
    bool testing = false,
    required String tokenId,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    Map<String, String> parameterApi = {
      'token_id' : tokenId,
    };
    await getDataProductUsers(
      parameterApi: parameterApi,
      link: 'detailGuest', 
      headers: headers,
    );
    return (testing == false) ? dataProducts : "berhasil";
  }

  tokenNotNull({
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
      await rolePenjual(
        headers: headers, 
        tokenId: tokenId,
      );
    }else{
      await rolePembeli(
        headers: headers,
        tokenId: tokenId,
      );
    }
    return (testing == false) ? dataProducts : "berhasil";
  }

  rolePenjual({
    bool testing = false,
    required Map<String, String>? headers,
    required String tokenId,
  }) async {
    Map<String, String> parameterApi = {
      'token_id' : tokenId,
    };
    await getDataProductUsers(
      parameterApi: parameterApi,
      link: 'detailPenjual',
      headers: headers,
    );
    return (testing == false) ? dataProducts : "berhasil";
  }

  rolePembeli({
    bool testing = false,
    required Map<String, String>? headers,
    required String tokenId,
  }) async {
    Map<String, String> parameterApi = {
      'token_id' : tokenId,
    };
    await getDataProductUsers(
      parameterApi: parameterApi,
      link: 'detailPembeli',
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
  bool loadingGetDataDetailProduct() {
    return loading;
  }
}