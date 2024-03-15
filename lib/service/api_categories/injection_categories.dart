import 'package:foosel/interface/interface_local/service/interface_get_data_category.dart';
import 'package:foosel/service/api_categories/api_categories.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

void setupDInjectionCategories(){
  if(!getItInstance.isRegistered<interfaceGetDataCategory>()){
    getItInstance.registerFactory<interfaceGetDataCategory>(() => apiCategories());
  }
}