import 'package:foosel/helpers/products/product_all/helper_products.dart';
import 'package:foosel/helpers/products/product_all/helper_products_categori.dart';
import 'package:foosel/interface/interface_local/helpers/interface_delete_data_product_storage_local.dart';
import 'package:foosel/interface/interface_local/helpers/interface_get_data_product_storage_local.dart';
import 'package:foosel/interface/interface_local/helpers/interface_get_data_products_category_local.dart';
import 'package:foosel/interface/interface_local/helpers/interface_insert_data_products_local.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

void setupDInjectionProductLocal(){
  if(!getItInstance.isRegistered<interfaceInsertDataProductsLocal>()){
    getItInstance.registerFactory<interfaceInsertDataProductsLocal>(() => helperProducts());
  }
  if(!getItInstance.isRegistered<interfaceDeleteDataProductStorageLocal>()){
    getItInstance.registerFactory<interfaceDeleteDataProductStorageLocal>(() => helperProducts());
  }
  if(!getItInstance.isRegistered<interfaceGetDataProductStorageLocal>()){
    getItInstance.registerFactory<interfaceGetDataProductStorageLocal>(() => helperProducts());
  }
  if(!getItInstance.isRegistered<interfaceGetDataProductsCategoryLocal>()){
    getItInstance.registerFactory<interfaceGetDataProductsCategoryLocal>(() => helperProductsCategory());
  }
  if(!getItInstance.isRegistered<interfaceGetDataProductStorageLocal>()){
    getItInstance.registerLazySingleton<interfaceGetDataProductStorageLocal>(() => helperProducts());
  }
}