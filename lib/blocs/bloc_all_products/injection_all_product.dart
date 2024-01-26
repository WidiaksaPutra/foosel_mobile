import 'package:flutter_laravel_toko_sepatu/helpers/products/product_all/helper_products.dart';
import 'package:flutter_laravel_toko_sepatu/interface/default/interface_delete_data_storage_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_get_data_product_storage_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_insert_data_products_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_get_data_product.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_products/api_get_products.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

void setupDiAllProductConnect(){
  if(!getItInstance.isRegistered<interfaceGetDataProduct>()){
    getItInstance.registerFactory<interfaceGetDataProduct>(() => apiGetProducts());
  }
  if(!getItInstance.isRegistered<interfaceInsertDataProductsLocal>()){
    getItInstance.registerFactory<interfaceInsertDataProductsLocal>(() => helperProducts());
  }
  if(!getItInstance.isRegistered<interfaceDeleteDataStorageLocal>()){
    getItInstance.registerFactory<interfaceDeleteDataStorageLocal>(() => helperProducts());
  }
}

void setupDiAllProductDisconnect(){
  if(!getItInstance.isRegistered<interfaceGetDataProductStorageLocal>()){
    getItInstance.registerFactory<interfaceGetDataProductStorageLocal>(() => helperProducts());
  }
}