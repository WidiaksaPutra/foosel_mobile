import 'package:foosel/firebase/api_chat_firebase/componen/chat_add_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/componen/chat_update_collection_read_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/componen/search_id_chat_personal_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/interfaces/interface_chat_add_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/interfaces/interface_chat_update_collection_read_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/interfaces/interface_search_id_chat_personal_firebase.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

void setupDiComponenChatFirebase(){
  if(!getItInstance.isRegistered<interfaceSearchIdChatPersonalFirebase>()){
    getItInstance.registerFactory<interfaceSearchIdChatPersonalFirebase>(() => searchIdChatPersonalFirebase());
  }
  if(!getItInstance.isRegistered<interfaceChatAddFirebase>()){
    getItInstance.registerFactory<interfaceChatAddFirebase>(() => chatAddFirebase());
  }
  if(!getItInstance.isRegistered<interfaceChatUpdateCollectionReadFirebase>()){
    getItInstance.registerFactory<interfaceChatUpdateCollectionReadFirebase>(() => chatUpdateCollectionReadFirebase());
  }
}