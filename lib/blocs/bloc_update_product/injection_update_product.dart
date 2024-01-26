import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_update_data_product.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_products/api_update_products.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

void setupDiUpdateProductConnect(){
  if(!getItInstance.isRegistered<interfaceUpdateDataProduct>()){
    getItInstance.registerFactory<interfaceUpdateDataProduct>(() => apiUpdateProducts());
  }
}