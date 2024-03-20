import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foosel/firebase/api_chat_firebase/componen/interfaces/interface_chat_update_collection_read_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/componen/interfaces/interface_chat_update_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/componen/interfaces/interface_search_id_chat_personal_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/interfaces/interface_update_chat_firebase.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class UpdateChatFirebase implements InterfaceUpdateChatFirebase{
  final InterfaceSearchIdChatPersonalFirebase dataSearchIdChatPersonal = getItInstance<InterfaceSearchIdChatPersonalFirebase>();
  final InterfaceChatUpdateCollectionReadFirebase dataChatUpdateCollectionRead = getItInstance<InterfaceChatUpdateCollectionReadFirebase>();
  final InterfaceChatUpdateFirebase dataChatUpdateFirebase = getItInstance<InterfaceChatUpdateFirebase>();
  @override
  updateChatFirebase({required String emailPengirim, required String emailPenerima}) async{
    String chatIdMessage = await dataSearchIdChatPersonal.searchIdChatPersonal(
      emailPenerima: emailPenerima, 
      emailPengirim: emailPengirim,
    );
    late bool readTrue = false;
    late int updateMessageFalse = 0;
    CollectionReference chats = firestore.collection('Chats');
    final docMessage = await chats.doc(chatIdMessage).collection("message").orderBy('time').get();
    if(docMessage.docs.length != 0){
      for(var updateMessage in docMessage.docs){
        if(updateMessage['penerima'] == emailPengirim && updateMessage['isRead'] == false){
          await dataChatUpdateCollectionRead.chatUpdateCollectionRead(
            chatId: chats.doc(chatIdMessage),
            read: true, 
            messageId: updateMessage.id,
          );
          readTrue = true;
        }
        if(updateMessage['penerima'] != emailPengirim && updateMessage['isRead'] == false){
          updateMessageFalse++;
        }
      }
      (readTrue == true)
      ? await dataChatUpdateFirebase.chatUpdate(
          chatId: chatIdMessage,
          totalChats: docMessage.docs.length, 
          totalRead: docMessage.docs.length,
          totalUnread: 0,
        )
      : await dataChatUpdateFirebase.chatUpdate(
          chatId: chatIdMessage, 
          totalChats: docMessage.docs.length, 
          totalRead: docMessage.docs.length-updateMessageFalse,
          totalUnread: updateMessageFalse,
        );
    }
  }
}