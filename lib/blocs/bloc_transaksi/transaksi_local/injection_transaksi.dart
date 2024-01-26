import 'package:flutter_laravel_toko_sepatu/helpers/transaksi/helper_products_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/helpers/transaksi/helper_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_delete_data_transaksi_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_get_data_product_transaksi_storage_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_get_data_transaksi_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_insert_data_transaksi_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_update_data_transaksi_local.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

void setupDiTransaksiLocal(){
  if(!getItInstance.isRegistered<interfaceInsertDataTransaksiLocal>()){
    getItInstance.registerFactory<interfaceInsertDataTransaksiLocal>(() => helperTransaksi());
  }
  if(!getItInstance.isRegistered<interfaceGetDataTransaksiLocal>()){
    getItInstance.registerFactory<interfaceGetDataTransaksiLocal>(() => helperTransaksi());
  }
  if(!getItInstance.isRegistered<interfaceDeleteDataTransaksiLocal>()){
    getItInstance.registerFactory<interfaceDeleteDataTransaksiLocal>(() => helperTransaksi());
  }
  if(!getItInstance.isRegistered<interfaceUpdateDataTransaksiLocal>()){
    getItInstance.registerFactory<interfaceUpdateDataTransaksiLocal>(() => helperTransaksi());
  }
  if(!getItInstance.isRegistered<interfaceGetDataProductTransaksiStorageLocal>()){
    getItInstance.registerFactory<interfaceGetDataProductTransaksiStorageLocal>(() => helperProductsTransaksi());
  }
}