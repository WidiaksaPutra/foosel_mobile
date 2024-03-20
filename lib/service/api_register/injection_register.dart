import 'package:foosel/service/api_register/interface_post_register.dart';
import 'package:foosel/service/api_register/api_register.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

void setupDInjectionRegister(){
  if(!getItInstance.isRegistered<InterfacePostRegister>()){
    getItInstance.registerFactory<InterfacePostRegister>(() => ApiRegister());
  }
}