import 'package:foosel/firebase/api_chat_firebase/componen/api/chat_add_collection_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/componen/api/chat_add_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/componen/api/chat_update_collection_read_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/componen/api/chat_update_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/componen/api/empty_chat_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/componen/api/search_id_chat_personal_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/componen/interfaces/interface_chat_add_collection_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/componen/interfaces/interface_chat_add_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/componen/interfaces/interface_chat_update_collection_read_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/componen/interfaces/interface_chat_update_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/componen/interfaces/interface_empty_chat_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/componen/interfaces/interface_search_id_chat_personal_firebase.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

void setupDiComponenChatFirebase(){
  if(!getItInstance.isRegistered<InterfaceSearchIdChatPersonalFirebase>()){
    getItInstance.registerFactory<InterfaceSearchIdChatPersonalFirebase>(() => SearchIdChatPersonalFirebase());
  }
  if(!getItInstance.isRegistered<InterfaceChatAddFirebase>()){
    getItInstance.registerFactory<InterfaceChatAddFirebase>(() => ChatAddFirebase());
  }
  if(!getItInstance.isRegistered<InterfaceChatUpdateCollectionReadFirebase>()){
    getItInstance.registerFactory<InterfaceChatUpdateCollectionReadFirebase>(() => ChatUpdateCollectionReadFirebase());
  }
  if(!getItInstance.isRegistered<InterfaceChatAddCollectionFirebase>()){
    getItInstance.registerFactory<InterfaceChatAddCollectionFirebase>(() => ChatAddCollectionFirebase());
  }
  if(!getItInstance.isRegistered<InterfaceChatUpdateFirebase>()){
    getItInstance.registerFactory<InterfaceChatUpdateFirebase>(() => ChatUpdateFirebase());
  }
  if(!getItInstance.isRegistered<InterfaceEmptyChatFirebase>()){
    getItInstance.registerFactory<InterfaceEmptyChatFirebase>(() => EmptyChatFirebase());
  }
}