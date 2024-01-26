import 'package:flutter_laravel_toko_sepatu/firebase/api_user_firebase/insert_api_user_firebase.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/firebase/interface_insert_user_firebase.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_get_login.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_get_user.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_login.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_user.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

void setupDiLoginConnect(){
  if(!getItInstance.isRegistered<interfaceGetLogin>()){
    getItInstance.registerFactory<interfaceGetLogin>(() => apiLogin());
  }
  if(!getItInstance.isRegistered<interfaceGetUser>()){
    getItInstance.registerFactory<interfaceGetUser>(() => apiUser());
  }
  if(!getItInstance.isRegistered<interfaceInsertUserFirebase>()){
    getItInstance.registerFactory<interfaceInsertUserFirebase>(() => insertUserFirebase());
  }
}