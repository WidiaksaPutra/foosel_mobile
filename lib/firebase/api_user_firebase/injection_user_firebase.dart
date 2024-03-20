import 'package:foosel/firebase/api_user_firebase/api/delete_api_user_firebase.dart';
import 'package:foosel/firebase/api_user_firebase/api/get_api_user_firebase.dart';
import 'package:foosel/firebase/api_user_firebase/api/insert_api_user_firebase.dart';
import 'package:foosel/firebase/api_user_firebase/api/update_api_user_firebase.dart';
import 'package:foosel/firebase/api_user_firebase/interfaces/interface_delete_user_firebase.dart';
import 'package:foosel/firebase/api_user_firebase/interfaces/interface_get_user_firebase.dart';
import 'package:foosel/firebase/api_user_firebase/interfaces/interface_insert_user_firebase.dart';
import 'package:foosel/firebase/api_user_firebase/interfaces/interface_update_user_firebase.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

void setupDInjectionUserFirebase(){
  if(!getItInstance.isRegistered<InterfaceInsertUserFirebase>()){
    getItInstance.registerFactory<InterfaceInsertUserFirebase>(() => InsertUserFirebase());
  }
  if(!getItInstance.isRegistered<InterfaceUpdateUserFirebase>()){
    getItInstance.registerFactory<InterfaceUpdateUserFirebase>(() => UpdateUserFirebase());
  }
  if(!getItInstance.isRegistered<InterfaceGetUserFirebase>()){
    getItInstance.registerFactory<InterfaceGetUserFirebase>(() => GetUserFirebase());
  }
  if(!getItInstance.isRegistered<InterfaceDeleteUserFirebase>()){
    getItInstance.registerFactory<InterfaceDeleteUserFirebase>(() => DeleteUserFirebase());
  }
}