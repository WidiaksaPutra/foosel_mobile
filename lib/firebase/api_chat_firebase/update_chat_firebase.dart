import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_laravel_toko_sepatu/firebase/api_chat_firebase/mixin/chat_update_collection_read_firebase.dart';
import 'package:flutter_laravel_toko_sepatu/firebase/api_chat_firebase/mixin/chat_update_firebase.dart';
import 'package:flutter_laravel_toko_sepatu/firebase/api_chat_firebase/mixin/search_id_chat_personal_firebase.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/firebase/interface_update_chat_firebase.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

class updateChatFirebase 
with searchIdChatPersonalFirebase, chatUpdateFirebase, chatUpdateCollectionReadFirebase
implements interfaceUpdateChatFirebase{  
  @override
  UpdateChatFirebase({required String emailPengirim, required String emailPenerima}) async{
    await searchIdChatPersonal(emailPenerima: emailPenerima, emailPengirim: emailPengirim);
    await chatUpdate(chatIdMessage.toString());
    CollectionReference chats = firestore.collection('Chats');
    final docMessage = await chats.doc(chatIdMessage.toString()).collection("message").orderBy('time').get();
    for(var updateMessage in docMessage.docs){
      if(updateMessage['penerima'] == emailPengirim && updateMessage['isRead'] == false){
        await chatUpdateCollectionRead(
          chatId: chats.doc(chatIdMessage.toString()),
          read: true, 
          messageId: updateMessage.id,
        );
      }
    }
  }
}