import 'package:foosel/service/api_logout/interface_get_logout.dart';
import 'package:foosel/service/api_logout/api_logout.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

void setupDInjectionLogout(){
  if(!getItInstance.isRegistered<InterfaceGetLogout>()){
    getItInstance.registerFactory<InterfaceGetLogout>(() => ApiLogout());
  }
}