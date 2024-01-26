import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_post_register.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_register.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

void setupDiRegisterConnect(){
  if(!getItInstance.isRegistered<interfacePostRegister>()){
    getItInstance.registerFactory<interfacePostRegister>(() => apiRegister());
  }
}