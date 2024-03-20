import 'package:foosel/service/api_categories/interface_get_data_category.dart';
import 'package:foosel/service/api_categories/api_categories.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

void setupDInjectionCategories(){
  if(!getItInstance.isRegistered<InterfaceGetDataCategory>()){
    getItInstance.registerFactory<InterfaceGetDataCategory>(() => ApiCategories());
  }
}