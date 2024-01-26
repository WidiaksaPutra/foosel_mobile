import 'package:flutter_laravel_toko_sepatu/firebase/api_user_firebase/update_api_user_firebase.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/firebase/interface_update_user_firebase.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_get_user.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_update_user.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_user.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

void setupDiUserConnect(){
  if(!getItInstance.isRegistered<interfaceGetUser>()){
    getItInstance.registerFactory<interfaceGetUser>(() => apiUser());
  }
  if(!getItInstance.isRegistered<interfaceUpdateUser>()){
    getItInstance.registerFactory<interfaceUpdateUser>(() => apiUser());
  }
  if(!getItInstance.isRegistered<interfaceUpdateUserFirebase>()){
    getItInstance.registerFactory<interfaceUpdateUserFirebase>(() => updateUserFirebase());
  }
}