import 'dart:convert';
import 'package:foosel/interface/interface_local/service/interface_get_data_category.dart';
import 'package:foosel/model/categories.dart';
import 'package:foosel/service/api_konstanta.dart';

class apiCategories implements interfaceGetDataCategory{
  late List<Datum> dataListCategories = [];
  late int pages = 4;

  @override
  Future<List<Datum>> GetDataCategory({
    bool testing = false,
    required bool loadingApiService,
  }) async{
    try{
      if(loadingApiService == true){
        Map<String, String>? parameterApi = {
          'page' : '1',
          'limit' : '$pages',
        };
        String? parameterString = await Uri(queryParameters: parameterApi).query; 
        final responseCategories = await Api.client.get(Uri.parse('${Api.baseURL}/categories?' + parameterString)).timeout(const Duration(seconds: 10));
        if(responseCategories.statusCode == 200){
          final parse = await json.decode(responseCategories.body);
          Categories categoriesDataModel = await Categories.fromJson(parse);
          dataListCategories.clear();
          if(testing == false){
            dataListCategories.addAll(categoriesDataModel.data!.data);
          }
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
  Future<List<Datum>> GetDataCategoryNoParameters({
    bool testing = false,
    required bool loadingApiService,
  }) async{
    try{ 
      if(loadingApiService == true){
        final responseCategories = await Api.client.get(Uri.parse('${Api.baseURL}/categories?')).timeout(const Duration(seconds: 10));
        if(responseCategories.statusCode == 200){
          final parse = await json.decode(responseCategories.body);
          Categories categoriesDataModel = Categories.fromJson(parse);
          dataListCategories.clear();
          if(testing == false){
            dataListCategories.addAll(categoriesDataModel.data!.data);
          }
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