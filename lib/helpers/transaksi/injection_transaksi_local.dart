import 'package:foosel/helpers/transaksi/api/helper_products_transaksi.dart';
import 'package:foosel/helpers/transaksi/api/helper_transaksi.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_delete_data_product_transaksi_local.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_delete_data_transaksi_local.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_get_data_product_transaksi_local.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_get_data_transaksi_local.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_insert_data_transaksi_local.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_insert_data_product_transaksi_local.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_update_data_product_transaksi_local.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_update_data_transaksi_local.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

void setupDInjectionTransaksiLocal(){
  if(!getItInstance.isRegistered<InterfaceDeleteDataProductTransaksiLocal>()){
    getItInstance.registerFactory<InterfaceDeleteDataProductTransaksiLocal>(() => HelperProductsTransaksi());
  }
  if(!getItInstance.isRegistered<InterfaceGetDataProductTransaksiLocal>()){
    getItInstance.registerFactory<InterfaceGetDataProductTransaksiLocal>(() => HelperProductsTransaksi());
  }
  if(!getItInstance.isRegistered<InterfaceUpdateDataProductTransaksiLocal>()){
    getItInstance.registerFactory<InterfaceUpdateDataProductTransaksiLocal>(() => HelperProductsTransaksi());
  }
  if(!getItInstance.isRegistered<InterfaceInsertDataProductTransaksiLocal>()){
    getItInstance.registerFactory<InterfaceInsertDataProductTransaksiLocal>(() => HelperProductsTransaksi());
  }
  if(!getItInstance.isRegistered<InterfaceDeleteDataTransaksiLocal>()){
    getItInstance.registerFactory<InterfaceDeleteDataTransaksiLocal>(() => HelperTransaksi());
  }
  if(!getItInstance.isRegistered<InterfaceInsertDataTransaksiLocal>()){
    getItInstance.registerFactory<InterfaceInsertDataTransaksiLocal>(() => HelperTransaksi());
  }
  if(!getItInstance.isRegistered<InterfaceGetDataTransaksiLocal>()){
    getItInstance.registerFactory<InterfaceGetDataTransaksiLocal>(() => HelperTransaksi());
  }
  if(!getItInstance.isRegistered<InterfaceUpdateDataTransaksiLocal>()){
    getItInstance.registerFactory<InterfaceUpdateDataTransaksiLocal>(() => HelperTransaksi());
  }
}