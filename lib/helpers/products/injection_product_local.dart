import 'package:foosel/helpers/products/product_all/api/helper_products.dart';
import 'package:foosel/helpers/products/product_all/api/helper_products_categori.dart';
import 'package:foosel/helpers/products/product_all/interfaces/interface_delete_data_product_local.dart';
import 'package:foosel/helpers/products/product_all/interfaces/interface_get_data_product_local.dart';
import 'package:foosel/helpers/products/product_all/interfaces/interface_get_data_products_category_local.dart';
import 'package:foosel/helpers/products/product_all/interfaces/interface_insert_data_products_local.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

void setupDInjectionProductLocal(){
  if(!getItInstance.isRegistered<InterfaceInsertDataProductsLocal>()){
    getItInstance.registerFactory<InterfaceInsertDataProductsLocal>(() => HelperProducts());
  }
  if(!getItInstance.isRegistered<InterfaceDeleteDataProductLocal>()){
    getItInstance.registerFactory<InterfaceDeleteDataProductLocal>(() => HelperProducts());
  }
  if(!getItInstance.isRegistered<InterfaceGetDataProductLocal>()){
    getItInstance.registerFactory<InterfaceGetDataProductLocal>(() => HelperProducts());
  }
  if(!getItInstance.isRegistered<InterfaceGetDataProductsCategoryLocal>()){
    getItInstance.registerFactory<InterfaceGetDataProductsCategoryLocal>(() => HelperProductsCategory());
  }
}