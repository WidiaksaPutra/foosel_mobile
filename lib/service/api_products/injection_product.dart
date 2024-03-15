import 'package:foosel/interface/interface_local/service/interface_delete_data_product.dart';
import 'package:foosel/interface/interface_local/service/interface_delete_transaksi.dart';
import 'package:foosel/interface/interface_local/service/interface_get_data_detail_product.dart';
import 'package:foosel/interface/interface_local/service/interface_get_data_product.dart';
import 'package:foosel/interface/interface_local/service/interface_get_data_products_category.dart';
import 'package:foosel/interface/interface_local/service/interface_post_data_product.dart';
import 'package:foosel/interface/interface_local/service/interface_update_data_product.dart';
import 'package:foosel/service/api_products/api_delete_products.dart';
import 'package:foosel/service/api_products/api_get_detail_products.dart';
import 'package:foosel/service/api_products/api_get_products.dart';
import 'package:foosel/service/api_products/api_get_products_categori.dart';
import 'package:foosel/service/api_products/api_post_products.dart';
import 'package:foosel/service/api_products/api_update_products.dart';
import 'package:foosel/service/api_transaksi/api_delete_transaksi.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

void setupDInjectionProduct(){
  if(!getItInstance.isRegistered<interfacePostDataProduct>()){
    getItInstance.registerFactory<interfacePostDataProduct>(() => apiPostProducts());
  }
  if(!getItInstance.isRegistered<interfaceGetDataProduct>()){
    getItInstance.registerFactory<interfaceGetDataProduct>(() => apiGetProducts());
  }
  if(!getItInstance.isRegistered<interfaceGetDataProductsCategory>()){
    getItInstance.registerFactory<interfaceGetDataProductsCategory>(() => apiGetProductsCategori());
  }
  if(!getItInstance.isRegistered<interfaceDeleteTransaksi>()){
    getItInstance.registerFactory<interfaceDeleteTransaksi>(() => apiDeleteTransaksi());
  }
  if(!getItInstance.isRegistered<interfaceDeleteDataProduct>()){
    getItInstance.registerFactory<interfaceDeleteDataProduct>(() => apiDeleteProducts());
  }
  if(!getItInstance.isRegistered<interfaceGetDataDetailProduct>()){
    getItInstance.registerLazySingleton<interfaceGetDataDetailProduct>(() => apiGetDetailProducts());
  }
  if(!getItInstance.isRegistered<interfaceUpdateDataProduct>()){
    getItInstance.registerFactory<interfaceUpdateDataProduct>(() => apiUpdateProducts());
  }
}