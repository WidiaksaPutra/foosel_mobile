import 'package:foosel/interface/interface_local/service/interface_get_user.dart';
import 'package:foosel/interface/interface_local/service/interface_update_user.dart';
import 'package:foosel/service/api_user/api_get_user.dart';
import 'package:foosel/service/api_user/api_update_user.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

void setupDInjectionUser(){
  if(!getItInstance.isRegistered<interfaceGetUser>()){
    getItInstance.registerFactory<interfaceGetUser>(() => apiGetUser());
  }
  if(!getItInstance.isRegistered<interfaceGetUser>()){
    getItInstance.registerFactory<interfaceGetUser>(() => apiGetUser());
  }
  if(!getItInstance.isRegistered<interfaceUpdateUser>()){
    getItInstance.registerFactory<interfaceUpdateUser>(() => apiUpdateUser());
  }
}