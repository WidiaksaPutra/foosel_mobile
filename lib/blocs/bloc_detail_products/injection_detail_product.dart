import 'package:flutter_laravel_toko_sepatu/helpers/products/product_all/helper_products.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_get_data_product_storage_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_get_data_detail_product.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_products/api_get_detail_products.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

void setupDiDetailProductConnect(){
  if(!getItInstance.isRegistered<interfaceGetDataDetailProduct>()){
    getItInstance.registerLazySingleton<interfaceGetDataDetailProduct>(() => apiGetDetailProducts());
  }
}

void setupDiDetailProductDisconnect(){
  if(!getItInstance.isRegistered<interfaceGetDataProductStorageLocal>()){
    getItInstance.registerLazySingleton<interfaceGetDataProductStorageLocal>(() => helperProducts());
  }
}