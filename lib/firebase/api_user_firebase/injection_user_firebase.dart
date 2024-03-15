import 'package:foosel/firebase/api_user_firebase/delete_api_user_firebase.dart';
import 'package:foosel/firebase/api_user_firebase/get_api_user_firebase.dart';
import 'package:foosel/firebase/api_user_firebase/insert_api_user_firebase.dart';
import 'package:foosel/firebase/api_user_firebase/update_api_user_firebase.dart';
import 'package:foosel/interface/interface_local/firebase/interface_delete_user_firebase.dart';
import 'package:foosel/interface/interface_local/firebase/interface_get_user_firebase.dart';
import 'package:foosel/interface/interface_local/firebase/interface_insert_user_firebase.dart';
import 'package:foosel/interface/interface_local/firebase/interface_update_user_firebase.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

void setupDInjectionUserFirebase(){
  if(!getItInstance.isRegistered<interfaceInsertUserFirebase>()){
    getItInstance.registerFactory<interfaceInsertUserFirebase>(() => insertUserFirebase());
  }
  if(!getItInstance.isRegistered<interfaceUpdateUserFirebase>()){
    getItInstance.registerFactory<interfaceUpdateUserFirebase>(() => updateUserFirebase());
  }
  if(!getItInstance.isRegistered<interfaceGetUserFirebase>()){
    getItInstance.registerFactory<interfaceGetUserFirebase>(() => getUserFirebase());
  }
  if(!getItInstance.isRegistered<interfaceDeleteUserFirebase>()){
    getItInstance.registerFactory<interfaceDeleteUserFirebase>(() => deleteUserFirebase());
  }
}