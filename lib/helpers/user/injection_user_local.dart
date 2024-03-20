import 'package:foosel/helpers/user/helper_user.dart';
import 'package:foosel/helpers/user/interfaces/interface_delete_data_user_local.dart';
import 'package:foosel/helpers/user/interfaces/interface_get_data_user_local.dart';
import 'package:foosel/helpers/user/interfaces/interface_insert_data_user_local.dart';
import 'package:foosel/helpers/user/interfaces/interface_update_data_user_local.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

void setupDInjectionUserLocal(){
  if(!getItInstance.isRegistered<InterfaceDeleteDataUserLocal>()){
    getItInstance.registerFactory<InterfaceDeleteDataUserLocal>(() => HelperUser());
  }
  if(!getItInstance.isRegistered<InterfaceGetDataUserLocal>()){
    getItInstance.registerFactory<InterfaceGetDataUserLocal>(() => HelperUser());
  }
  if(!getItInstance.isRegistered<InterfaceInsertDataUserLocal>()){
    getItInstance.registerFactory<InterfaceInsertDataUserLocal>(() => HelperUser());
  }
  if(!getItInstance.isRegistered<InterfaceUpdateDataUserLocal>()){
    getItInstance.registerFactory<InterfaceUpdateDataUserLocal>(() => HelperUser());
  }
}