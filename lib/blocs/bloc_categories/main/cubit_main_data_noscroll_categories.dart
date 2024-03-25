import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_categories/interfaces_category.dart';
import 'package:foosel/blocs/bloc_categories/state_categories.dart';
import 'package:foosel/service/api_categories/interface_get_data_category.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class CubitMainDataNoscrollCategories extends Cubit<DataStateCategoriNameNoscroll> implements InterfacesMainDataNoscrollCategories{
  final InterfaceGetDataCategory _dataGetNameCategoryFuture = getItInstance<InterfaceGetDataCategory>();
  CubitMainDataNoscrollCategories() : super(DataCategoriNameNoscroll(false, []));
  @override
  Future<void> fetchCategoriesNoscroll() async{
    List _dataListCategories = await _dataGetNameCategoryFuture.getDataCategoryNoParameters(loadingApiService: true);
    List<String> _categoryName = [];
    for(var _datType in _dataListCategories){
      _categoryName.add(_datType.name.toString());
    }
    emit(DataCategoriNameNoscroll(true, _categoryName));
  }
}