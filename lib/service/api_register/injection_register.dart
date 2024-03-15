import 'package:foosel/interface/interface_local/service/interface_post_register.dart';
import 'package:foosel/service/api_register/api_register.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

void setupDInjectionRegister(){
  if(!getItInstance.isRegistered<interfacePostRegister>()){
    getItInstance.registerFactory<interfacePostRegister>(() => apiRegister());
  }
}