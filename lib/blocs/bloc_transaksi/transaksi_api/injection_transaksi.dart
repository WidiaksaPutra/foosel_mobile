import 'package:flutter_laravel_toko_sepatu/helpers/transaksi/helper_products_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/helpers/transaksi/helper_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_delete_data_product_transaksi_storage_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_delete_data_transaksi_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_get_data_product_transaksi_storage_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_insert_product_transaksi_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_delete_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_get_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_patch_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_post_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_transaksi/api_get_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_transaksi/api_patch_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_transaksi/api_post_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_transaksi/api_delete_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

void setupDiTransaksiApi(){
  if(!getItInstance.isRegistered<interfacePostTransaksi>()){
    getItInstance.registerFactory<interfacePostTransaksi>(() => apiPostTransaksi());
  }
  if(!getItInstance.isRegistered<interfaceGetTransaksi>()){
    getItInstance.registerFactory<interfaceGetTransaksi>(() => apiGetTransaksi());
  }
  if(!getItInstance.isRegistered<interfaceDeleteTransaksi>()){
    getItInstance.registerFactory<interfaceDeleteTransaksi>(() => apiDeleteTransaksi());
  }
  if(!getItInstance.isRegistered<interfacePatchTransaksi>()){
    getItInstance.registerFactory<interfacePatchTransaksi>(() => apiPatchTransaksi());
  }
}

void setupDiTransaksiLocalApi(){
  if(!getItInstance.isRegistered<interfaceInsertDataProductTransaksiLocal>()){
    getItInstance.registerFactory<interfaceInsertDataProductTransaksiLocal>(() => helperProductsTransaksi());
  }
  if(!getItInstance.isRegistered<interfaceDeleteDataProductTransaksiStorageLocal>()){
    getItInstance.registerFactory<interfaceDeleteDataProductTransaksiStorageLocal>(() => helperProductsTransaksi());
  }
  if(!getItInstance.isRegistered<interfaceDeleteDataTransaksiLocal>()){
    getItInstance.registerFactory<interfaceDeleteDataTransaksiLocal>(() => helperTransaksi());
  }
  if(!getItInstance.isRegistered<interfaceGetDataProductTransaksiStorageLocal>()){
    getItInstance.registerFactory<interfaceGetDataProductTransaksiStorageLocal>(() => helperProductsTransaksi());
  }
}