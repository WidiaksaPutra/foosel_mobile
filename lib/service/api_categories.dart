import 'dart:convert';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_get_data_category.dart';
import 'package:flutter_laravel_toko_sepatu/model/categories.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_konstanta.dart';

class apiCategories implements interfaceGetDataCategory{
  late List<Datum> dataListCategories = [];
  late int pages = 4;

  @override
  Future<List<Datum>> GetDataCategory({
    required bool loadingApiService,
  }) async{
    try{
      if(loadingApiService == true){
        Map<String, String>? parameterApi = {
          'page' : '1',
          'limit' : '$pages',
        };
        String? parameterString = await Uri(queryParameters: parameterApi).query; 
        final responseCategories = await Api.client.get(Uri.parse('${Api.baseURL}/categories?' + parameterString));
        if(responseCategories.statusCode == 200){
          final parse = await json.decode(responseCategories.body);
          Categories categoriesDataModel = await Categories.fromJson(parse);
          dataListCategories.clear();
          dataListCategories.addAll(categoriesDataModel.data!.data);
          pages++;
        }else{
          throw Exception('data gagal');
        }
      }
      return await dataListCategories;
    } catch (e) {
      throw Exception('data error');
    }
  }
  
  @override
  Future<List<Datum>> GetDataCategoryNoParameters({required bool loadingApiService}) async{
    try{ 
      if(loadingApiService == true){
        final responseCategories = await Api.client.get(Uri.parse('${Api.baseURL}/categories?'));
        if(responseCategories.statusCode == 200){
          final parse = await json.decode(responseCategories.body);
          Categories categoriesDataModel = Categories.fromJson(parse);
          dataListCategories.clear();
          dataListCategories.addAll(categoriesDataModel.data!.data!);
        }else{
          throw Exception('data gagal');
        }
      }
      return dataListCategories;
    } catch (e) {
      throw Exception('data error');
    }
  }
}