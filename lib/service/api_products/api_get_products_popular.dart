import 'dart:convert';
import 'package:flutter_laravel_toko_sepatu/model/products.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_konstanta.dart';

mixin apiGetProductsPopular{
  late List<Datum> dataListProductsPopular = [];
  late bool loadingApiPopular = false;
  
  Future<List<Datum>> getProductsPopular({required String name}) async{
    try {
      if(dataListProductsPopular.isEmpty){
        Map<String, String> parameterApi = {
          'name' : name,
        };
        String? parameterString = Uri(queryParameters: parameterApi).query;
        final responseProducts = await Api.client.get(Uri.parse('${Api.baseURL}/products?' + parameterString));
        if(responseProducts.statusCode == 200){
          final parse = await json.decode(responseProducts.body);
          Products productsDataModel = Products.fromJson(parse);
          // dataListProductsPopular.addAll(productsDataModel.data!.data);
          loadingApiPopular = true;
        }else{
          throw Exception('data gagal');
        }
      }
      return dataListProductsPopular;
    } catch (e) {
      throw Exception('data error');
    }
  }
}