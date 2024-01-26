import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_delete_data_product.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_products/api_delete_products.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

void setupDiDeleteProduct(){
  if(!getItInstance.isRegistered<interfaceDeleteDataProduct>()){
    getItInstance.registerFactory<interfaceDeleteDataProduct>(() => apiDeleteProducts());
  }
}