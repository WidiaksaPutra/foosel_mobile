import 'package:foosel/firebase/api_chat_firebase/api/delete_api_chat_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/api/get_chat_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/api/insert_chat_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/api/update_chat_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/interfaces/interface_delete_chat_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/interfaces/interface_get_chat_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/interfaces/interface_insert_chat_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/interfaces/interface_update_chat_firebase.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

void setupDInjectionChatFirebase(){
  if(!getItInstance.isRegistered<InterfaceUpdateChatFirebase>()){
    getItInstance.registerFactory<InterfaceUpdateChatFirebase>(() => UpdateChatFirebase());
  }
  if(!getItInstance.isRegistered<InterfaceInsertChatFirebase>()){
    getItInstance.registerFactory<InterfaceInsertChatFirebase>(() => InsertChatFirebase());
  }
  if(!getItInstance.isRegistered<InterfaceGetChatFirebase>()){
    getItInstance.registerFactory<InterfaceGetChatFirebase>(() => GetChatFirebase());
  }
  if(!getItInstance.isRegistered<InterfaceDeleteChatFirebase>()){
    getItInstance.registerFactory<InterfaceDeleteChatFirebase>(() => DeleteChatFirebase());
  }
}