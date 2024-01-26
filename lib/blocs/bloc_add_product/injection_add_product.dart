import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_post_data_product.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_products/api_post_products.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

void setupDiAddProductConnect(){
  if(!getItInstance.isRegistered<interfacePostDataProduct>()){
    getItInstance.registerFactory<interfacePostDataProduct>(() => apiPostProducts());
  }
}