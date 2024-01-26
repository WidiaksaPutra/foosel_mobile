import 'package:flutter_laravel_toko_sepatu/helpers/categories/helper_categories.dart';
import 'package:flutter_laravel_toko_sepatu/helpers/products/product_all/helper_products_categori.dart';
import 'package:flutter_laravel_toko_sepatu/interface/default/interface_delete_data_storage_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_get_data_category_storage_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_get_data_products_category_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_insert_data_category_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_get_data_category.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_get_data_products_category.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_categories.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_products/api_get_products_categori.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

void setupDiCategoriesConnect(){
  getItInstance.registerFactory<interfaceGetDataProductsCategory>(() => apiGetProductsCategori());
}

void setupDiCategoriesDisconnect(){
  if(!getItInstance.isRegistered<interfaceGetDataProductsCategoryLocal>()){
    getItInstance.registerFactory<interfaceGetDataProductsCategoryLocal>(() => helperProductsCategory());
  }
}

void setupDiNameCategoriesConnect(){
  if(!getItInstance.isRegistered<interfaceGetDataCategory>()){
    getItInstance.registerFactory<interfaceGetDataCategory>(() => apiCategories());
  }
  if(!getItInstance.isRegistered<interfaceInsertDataCategoryLocal>()){
    getItInstance.registerFactory<interfaceInsertDataCategoryLocal>(() => helperCategories());
  }
  if(!getItInstance.isRegistered<interfaceDeleteDataStorageLocal>()){
    getItInstance.registerFactory<interfaceDeleteDataStorageLocal>(() => helperCategories());
  }
}

void setupDiNameCategoriesDisconnect(){
  if(!getItInstance.isRegistered<interfaceGetDataCategoryStorageLocal>()){
    getItInstance.registerFactory<interfaceGetDataCategoryStorageLocal>(() => helperCategories());
  }
}