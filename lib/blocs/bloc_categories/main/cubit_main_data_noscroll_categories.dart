import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_categories/state_categories.dart';
import 'package:foosel/interface/interface_local/service/interface_get_data_category.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class CubitMainDataNoscrollCategories extends Cubit<DataStateCategoriNameNoscroll>{
  final interfaceGetDataCategory dataGetNameCategoryFuture = getItInstance<interfaceGetDataCategory>();
  CubitMainDataNoscrollCategories() : super(DataCategoriNameNoscroll(false, []));
  fetchCategoriesNoscroll() async{
    List dataListCategories = await dataGetNameCategoryFuture.GetDataCategoryNoParameters(loadingApiService: true);
    List<String> categoryName = [];
    for(var datType in dataListCategories){
      categoryName.add(datType.name.toString());
    }
    emit(DataCategoriNameNoscroll(true, categoryName));
  }
}