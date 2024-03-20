import 'package:foosel/service/api_login/interface_get_login.dart';
import 'package:foosel/service/api_login/api_login.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

void setupDInjectionLogin(){
  if(!getItInstance.isRegistered<InterfaceGetLogin>()){
    getItInstance.registerFactory<InterfaceGetLogin>(() => ApiLogin());
  }
}