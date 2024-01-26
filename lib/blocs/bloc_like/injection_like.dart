import 'package:flutter_laravel_toko_sepatu/helpers/like/helper_like.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_delete_data_like_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_get_data_like_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_insert_data_like_local.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

void setupDiLike(){
  if(!getItInstance.isRegistered<interfaceInsertDataLikeLocal>()){
    getItInstance.registerFactory<interfaceInsertDataLikeLocal>(() => helperLike());
  }
  if(!getItInstance.isRegistered<interfaceGetDataLikeLocal>()){
    getItInstance.registerFactory<interfaceGetDataLikeLocal>(() => helperLike());
  }
  if(!getItInstance.isRegistered<interfaceDeleteDataLikeLocal>()){
    getItInstance.registerFactory<interfaceDeleteDataLikeLocal>(() => helperLike());
  }
}