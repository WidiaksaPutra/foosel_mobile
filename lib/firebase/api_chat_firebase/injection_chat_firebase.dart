import 'package:foosel/firebase/api_chat_firebase/delete_api_chat_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/get_chat_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/insert_chat_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/update_chat_firebase.dart';
import 'package:foosel/interface/interface_local/firebase/interface_delete_chat_firebase.dart';
import 'package:foosel/interface/interface_local/firebase/interface_get_chat_firebase.dart';
import 'package:foosel/interface/interface_local/firebase/interface_insert_chat_firebase.dart';
import 'package:foosel/interface/interface_local/firebase/interface_update_chat_firebase.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

void setupDInjectionChatFirebase(){
  if(!getItInstance.isRegistered<interfaceUpdateChatFirebase>()){
    getItInstance.registerFactory<interfaceUpdateChatFirebase>(() => updateChatFirebase());
  }
  if(!getItInstance.isRegistered<interfaceInsertChatFirebase>()){
    getItInstance.registerFactory<interfaceInsertChatFirebase>(() => insertChatFirebase());
  }
  if(!getItInstance.isRegistered<interfaceGetChatFirebase>()){
    getItInstance.registerFactory<interfaceGetChatFirebase>(() => getChatFirebase());
  }
  if(!getItInstance.isRegistered<interfaceDeleteChatFirebase>()){
    getItInstance.registerFactory<interfaceDeleteChatFirebase>(() => deleteChatFirebase());
  }
}