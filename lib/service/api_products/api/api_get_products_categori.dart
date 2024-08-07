import 'dart:convert';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/service/api_products/interfaces/interface_get_data_products_category.dart';
import 'package:foosel/model/products.dart';
import 'package:foosel/service/api_konstanta.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class ApiGetProductsCategori with SharedPref implements InterfaceGetDataProductsCategory{
  late List dataProducts = [];
  late int pages = 6;
  late String tokens;

  @override
  Future getDataProductsCategory({ 
    bool testing = false,
    String testingToken = "",
    required String categoriesId, 
    required bool fresh,
  }) async{
    try{
      if(fresh == true){
        pages = 6;
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
          return await tokenNull(categoriesId: categoriesId);
        }else{
          await tokenNull(categoriesId: categoriesId);
          return "berhasil";
        }  
      }else{
        if(testing == false){
          return await tokenNotNull(tokens: tokens, categoriesId: categoriesId); 
        }else{
          await tokenNotNull(tokens: tokens, categoriesId: categoriesId);
          return "berhasil";
        }
      }
    }catch (e) {
      throw Exception('data error');
    }
  }

  Future tokenNull({
    bool testing = false,
    required String categoriesId
  }) async{
    try{
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };
      Map<String, String> parameterApi = {
        'categories_id' : await categoriesId,
        'page' : '1',
        'limit' : pages.toString(),
      };
      await getDataProductUsers(
        parameterApi: parameterApi, 
        link: 'products', 
        headers: headers, 
      );
      return (testing == false) ? dataProducts : "berhasil";
    }catch (e) {
      throw Exception('data error');
    }
  }

  Future tokenNotNull({
    bool testing = false,
    required String tokens,
    required String categoriesId,
  }) async{
    try{
      Map<String, dynamic> decodeTokenUser = await JwtDecoder.decode(tokens);
      String role = decodeTokenUser['roles'].toString();
      Map<String, String> headers = {
        'Authorization': 'Bearer $tokens',
        'Content-Type': 'application/json; charset=UTF-8',
      };
      if(role == "PENJUAL"){
        await rolePenjual(
          headers: headers, 
          categoriesId: categoriesId,
        );
      }else{
        await rolePembeli(
          headers: headers, 
          categoriesId: categoriesId,
        );
      }
      return (testing == false) ? dataProducts : "berhasil";
    }catch (e) {
      throw Exception('data error');
    }
  }

  Future rolePenjual({
    bool testing = false,
    required Map<String, String>? headers,
    required String categoriesId,
  }) async{
    try{
      Map<String, String> parameterApi = {
        'categories_id' : categoriesId,
        'page' : '1',
        'limit' : pages.toString(),
      };
      await getDataProductUsers(
        parameterApi: parameterApi, 
        link: 'productsPenjual',
        headers: headers, 
      );
      return (testing == false) ? dataProducts : "berhasil";
    }catch (e) {
      throw Exception('data error');
    }
  }

  Future rolePembeli({
    bool testing = false,
    required Map<String, String>? headers,
    required String categoriesId,
  }) async{
    try{
      Map<String, String> parameterApi = {
        'categories_id' : categoriesId,
        'page' : '1',
        'limit' : pages.toString(),
      };
      await getDataProductUsers(
        parameterApi: parameterApi,
        link: 'productsPembeli',
        headers: headers, 
      );
      return (testing == false) ? dataProducts : "berhasil";
    }catch (e) {
      throw Exception('data error');
    }
  }

  Future getDataProductUsers({
    bool testing = false,
    required Map<String, dynamic> parameterApi,
    required Map<String, String>? headers,
    required String link,
  }) async{
    try{
      String? parameterString = await Uri(queryParameters: parameterApi).query;
      final responseProducts = await Api.client.get(
        Uri.parse('${Api.baseURL}/$link?' + parameterString),
        headers: headers,
      ).timeout(const Duration(seconds: 10));
      if(responseProducts.statusCode == 200){
        final parse = await json.decode(responseProducts.body);
        Products productsDataModel = await Products.fromJson(parse);
        pages = pages+2;
        dataProducts.clear();
        dataProducts.addAll(await productsDataModel.data!.data.toList());
        return (testing == false) ? dataProducts : "berhasil";
      }else{
        throw Exception('data gagal');
      }
    }catch (e) {
      throw Exception('data error');
    }
  }
}