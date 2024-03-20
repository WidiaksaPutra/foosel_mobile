import 'package:foosel/service/api_transaksi/interfaces/interface_delete_transaksi.dart';
import 'package:foosel/service/api_transaksi/interfaces/interface_get_transaksi.dart';
import 'package:foosel/service/api_transaksi/interfaces/interface_patch_transaksi.dart';
import 'package:foosel/service/api_transaksi/interfaces/interface_post_transaksi.dart';
import 'package:foosel/service/api_transaksi/api/api_delete_transaksi.dart';
import 'package:foosel/service/api_transaksi/api/api_get_transaksi.dart';
import 'package:foosel/service/api_transaksi/api/api_patch_transaksi.dart';
import 'package:foosel/service/api_transaksi/api/api_post_transaksi.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

void setupDInjectionTransaksi(){
  if(!getItInstance.isRegistered<InterfacePostTransaksi>()){
    getItInstance.registerFactory<InterfacePostTransaksi>(() => ApiPostTransaksi());
  }
  if(!getItInstance.isRegistered<InterfaceGetTransaksi>()){
    getItInstance.registerFactory<InterfaceGetTransaksi>(() => ApiGetTransaksi());
  }
  if(!getItInstance.isRegistered<InterfaceDeleteTransaksi>()){
    getItInstance.registerFactory<InterfaceDeleteTransaksi>(() => ApiDeleteTransaksi());
  }
  if(!getItInstance.isRegistered<InterfacePatchTransaksi>()){
    getItInstance.registerFactory<InterfacePatchTransaksi>(() => ApiPatchTransaksi());
  }
}