import 'package:foosel/helpers/categories/helper_categories.dart';
import 'package:foosel/helpers/categories/interfaces/interface_delete_data_category_local.dart';
import 'package:foosel/helpers/categories/interfaces/interface_get_data_category_local.dart';
import 'package:foosel/helpers/categories/interfaces/interface_insert_data_category_local.dart';
import 'package:foosel/helpers/categories/interfaces/interface_update_data_category_local.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

void setupDInjectionCategoriesLocal(){
  if(!getItInstance.isRegistered<InterfaceInsertDataCategoryLocal>()){
    getItInstance.registerFactory<InterfaceInsertDataCategoryLocal>(() => HelperCategories());
  }
  if(!getItInstance.isRegistered<InterfaceDeleteDataCategoryLocal>()){
    getItInstance.registerFactory<InterfaceDeleteDataCategoryLocal>(() => HelperCategories());
  }
  if(!getItInstance.isRegistered<InterfaceGetDataCategoryLocal>()){
    getItInstance.registerFactory<InterfaceGetDataCategoryLocal>(() => HelperCategories());
  }
  if(!getItInstance.isRegistered<InterfaceUpdateDataCategoryLocal>()){
    getItInstance.registerFactory<InterfaceUpdateDataCategoryLocal>(() => HelperCategories());
  }
}