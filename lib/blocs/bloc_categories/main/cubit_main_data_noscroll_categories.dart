import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_categories/state_categories.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_categories.dart';

class CubitMainDataNoscrollCategories extends Cubit<DataStateCategoriNameNoscroll> with apiCategories{
  CubitMainDataNoscrollCategories() : super(DataCategoriNameNoscroll(false, []));
  fetchCategoriesNoscroll() async{
    dataListCategories.clear(); //kegunaan agar data array diclean agar di servicenya arraynya tidak menumpuk data, bisa juga ditambahkan kondisi di servicenya
    await GetDataCategoryNoParameters(loadingApiService: true);
    List<String> categoryName = [];
    for(var datType in dataListCategories){
      categoryName.add(datType.name.toString());
    }
    emit(DataCategoriNameNoscroll(true, categoryName));
  }
}