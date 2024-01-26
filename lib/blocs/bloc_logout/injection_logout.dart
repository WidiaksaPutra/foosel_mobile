import 'package:flutter_laravel_toko_sepatu/firebase/api_user_firebase/update_api_user_firebase.dart';
import 'package:flutter_laravel_toko_sepatu/helpers/like/helper_like.dart';
import 'package:flutter_laravel_toko_sepatu/helpers/transaksi/helper_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/firebase/interface_update_user_firebase.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_delete_data_like_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_delete_data_transaksi_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_get_logout.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_logout.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

void setupDiLogoutConnect(){
  if(!getItInstance.isRegistered<interfaceGetLogout>()){
    getItInstance.registerFactory<interfaceGetLogout>(() => apiLogout());
  }
  if(!getItInstance.isRegistered<interfaceUpdateUserFirebase>()){
    getItInstance.registerFactory<interfaceUpdateUserFirebase>(() => updateUserFirebase());
  }
  if(!getItInstance.isRegistered<interfaceDeleteDataLikeLocal>()){
    getItInstance.registerFactory<interfaceDeleteDataLikeLocal>(() => helperLike());
  }
  if(!getItInstance.isRegistered<interfaceDeleteDataTransaksiLocal>()){
    getItInstance.registerFactory<interfaceDeleteDataTransaksiLocal>(() => helperTransaksi());
  }
}