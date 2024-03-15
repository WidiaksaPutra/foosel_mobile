import 'package:foosel/interface/interface_local/service/interface_delete_transaksi.dart';
import 'package:foosel/interface/interface_local/service/interface_get_transaksi.dart';
import 'package:foosel/interface/interface_local/service/interface_patch_transaksi.dart';
import 'package:foosel/interface/interface_local/service/interface_post_transaksi.dart';
import 'package:foosel/service/api_transaksi/api_delete_transaksi.dart';
import 'package:foosel/service/api_transaksi/api_get_transaksi.dart';
import 'package:foosel/service/api_transaksi/api_patch_transaksi.dart';
import 'package:foosel/service/api_transaksi/api_post_transaksi.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

void setupDInjectionTransaksi(){
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