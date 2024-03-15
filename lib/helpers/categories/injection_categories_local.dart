import 'package:foosel/helpers/categories/helper_categories.dart';
import 'package:foosel/interface/interface_local/helpers/interface_delete_data_category_storage_local.dart';
import 'package:foosel/interface/interface_local/helpers/interface_get_data_category_storage_local.dart';
import 'package:foosel/interface/interface_local/helpers/interface_insert_data_category_local.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

void setupDInjectionCategoriesLocal(){
  if(!getItInstance.isRegistered<interfaceInsertDataCategoryLocal>()){
    getItInstance.registerFactory<interfaceInsertDataCategoryLocal>(() => helperCategories());
  }
  if(!getItInstance.isRegistered<interfaceDeleteDataCategoryStorageLocal>()){
    getItInstance.registerFactory<interfaceDeleteDataCategoryStorageLocal>(() => helperCategories());
  }
  if(!getItInstance.isRegistered<interfaceGetDataCategoryStorageLocal>()){
    getItInstance.registerFactory<interfaceGetDataCategoryStorageLocal>(() => helperCategories());
  }
}