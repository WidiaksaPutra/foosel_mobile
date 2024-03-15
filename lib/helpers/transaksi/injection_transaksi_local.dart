import 'package:foosel/helpers/transaksi/helper_products_transaksi.dart';
import 'package:foosel/helpers/transaksi/helper_transaksi.dart';
import 'package:foosel/interface/interface_local/helpers/interface_delete_data_product_transaksi_storage_local.dart';
import 'package:foosel/interface/interface_local/helpers/interface_delete_data_transaksi_local.dart';
import 'package:foosel/interface/interface_local/helpers/interface_get_data_product_transaksi_storage_local.dart';
import 'package:foosel/interface/interface_local/helpers/interface_get_data_transaksi_local.dart';
import 'package:foosel/interface/interface_local/helpers/interface_insert_data_transaksi_local.dart';
import 'package:foosel/interface/interface_local/helpers/interface_insert_product_transaksi_local.dart';
import 'package:foosel/interface/interface_local/helpers/interface_update_data_product_transaksi_local.dart';
import 'package:foosel/interface/interface_local/helpers/interface_update_data_transaksi_local.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

void setupDInjectionTransaksiLocal(){
  if(!getItInstance.isRegistered<interfaceDeleteDataProductTransaksiStorageLocal>()){
    getItInstance.registerFactory<interfaceDeleteDataProductTransaksiStorageLocal>(() => helperProductsTransaksi());
  }
  if(!getItInstance.isRegistered<interfaceDeleteDataTransaksiLocal>()){
    getItInstance.registerFactory<interfaceDeleteDataTransaksiLocal>(() => helperTransaksi());
  }
  if(!getItInstance.isRegistered<interfaceInsertDataProductTransaksiLocal>()){
    getItInstance.registerFactory<interfaceInsertDataProductTransaksiLocal>(() => helperProductsTransaksi());
  }
  if(!getItInstance.isRegistered<interfaceGetDataProductTransaksiStorageLocal>()){
    getItInstance.registerFactory<interfaceGetDataProductTransaksiStorageLocal>(() => helperProductsTransaksi());
  }
  if(!getItInstance.isRegistered<interfaceUpdateDataProductTransaksiLocal>()){
    getItInstance.registerFactory<interfaceUpdateDataProductTransaksiLocal>(() => helperProductsTransaksi());
  }
  if(!getItInstance.isRegistered<interfaceInsertDataTransaksiLocal>()){
    getItInstance.registerFactory<interfaceInsertDataTransaksiLocal>(() => helperTransaksi());
  }
  if(!getItInstance.isRegistered<interfaceGetDataTransaksiLocal>()){
    getItInstance.registerFactory<interfaceGetDataTransaksiLocal>(() => helperTransaksi());
  }
  if(!getItInstance.isRegistered<interfaceUpdateDataTransaksiLocal>()){
    getItInstance.registerFactory<interfaceUpdateDataTransaksiLocal>(() => helperTransaksi());
  }
}