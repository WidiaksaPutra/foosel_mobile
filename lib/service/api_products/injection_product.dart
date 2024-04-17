import 'package:foosel/service/api_products/api/api_get_products_categori.dart';
import 'package:foosel/service/api_products/interfaces/interface_delete_data_product.dart';
import 'package:foosel/service/api_products/interfaces/interface_get_data_detail_product.dart';
import 'package:foosel/service/api_products/interfaces/interface_get_data_product.dart';
import 'package:foosel/service/api_products/interfaces/interface_get_data_products_category.dart';
import 'package:foosel/service/api_products/interfaces/interface_post_data_product.dart';
import 'package:foosel/service/api_products/interfaces/interface_update_data_product.dart';
import 'package:foosel/service/api_products/api/api_delete_products.dart';
import 'package:foosel/service/api_products/api/api_get_detail_products.dart';
import 'package:foosel/service/api_products/api/api_get_products.dart';
import 'package:foosel/service/api_products/api/api_post_products.dart';
import 'package:foosel/service/api_products/api/api_update_products.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

void setupDInjectionProduct(){
  if(!getItInstance.isRegistered<InterfacePostDataProduct>()){
    getItInstance.registerFactory<InterfacePostDataProduct>(() => ApiPostProducts());
  }
  if(!getItInstance.isRegistered<InterfaceGetDataProduct>()){
    getItInstance.registerFactory<InterfaceGetDataProduct>(() => ApiGetProducts());
  }
  if(!getItInstance.isRegistered<InterfaceGetDataProductsCategory>()){
    getItInstance.registerFactory<InterfaceGetDataProductsCategory>(() => ApiGetProductsCategori());
  }
  if(!getItInstance.isRegistered<InterfaceDeleteDataProduct>()){
    getItInstance.registerFactory<InterfaceDeleteDataProduct>(() => ApiDeleteProducts());
  }
  if(!getItInstance.isRegistered<InterfaceGetDataDetailProduct>()){
    getItInstance.registerLazySingleton<InterfaceGetDataDetailProduct>(() => ApiGetDetailProducts());
  }
  if(!getItInstance.isRegistered<InterfaceUpdateDataProduct>()){
    getItInstance.registerFactory<InterfaceUpdateDataProduct>(() => ApiUpdateProducts());
  }
}