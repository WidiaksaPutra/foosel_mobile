import 'package:foosel/service/api_user/api/api_get_user.dart';
import 'package:foosel/service/api_user/api/api_update_user.dart';
import 'package:foosel/service/api_user/interfaces/interface_get_user.dart';
import 'package:foosel/service/api_user/interfaces/interface_update_user.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

void setupDInjectionUser(){
  if(!getItInstance.isRegistered<InterfaceGetUser>()){
    getItInstance.registerFactory<InterfaceGetUser>(() => ApiGetUser());
  }
  if(!getItInstance.isRegistered<InterfaceUpdateUser>()){
    getItInstance.registerFactory<InterfaceUpdateUser>(() => ApiUpdateUser());
  }
}