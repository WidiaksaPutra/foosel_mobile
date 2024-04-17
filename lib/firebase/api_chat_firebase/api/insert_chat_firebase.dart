// ignore_for_file: unnecessary_null_comparison, unused_local_variable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foosel/firebase/api_chat_firebase/componen/interfaces/interface_chat_add_collection_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/componen/interfaces/interface_chat_add_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/componen/interfaces/interface_empty_chat_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/componen/interfaces/interface_search_id_chat_personal_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/interfaces/interface_insert_chat_firebase.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertChatFirebase implements InterfaceInsertChatFirebase{  
  final InterfaceSearchIdChatPersonalFirebase dataSearchIdChatPersonal = getItInstance<InterfaceSearchIdChatPersonalFirebase>();
  final InterfaceChatAddFirebase dataChatAddFirebase = getItInstance<InterfaceChatAddFirebase>();
  final InterfaceChatAddCollectionFirebase dataChatAddCollectionFirebase = getItInstance<InterfaceChatAddCollectionFirebase>();
  final InterfaceEmptyChatFirebase dataEmptyChatFirebase = getItInstance<InterfaceEmptyChatFirebase>();
  
  @override
  Future<void> insertChatFirebase({
    required String emailPengirim, 
    required String emailPenerima, 
    required messager,
  }) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    CollectionReference users = firestore.collection('users');
    final docUserPengirim = await users.doc(emailPengirim.toString()).get();
    final docUserPenerima = await users.doc(emailPenerima.toString()).get();
    final docListUserPengirim = (docUserPengirim.data() as Map<String, dynamic>)["chats"] as List;
    final docListUserPenerima = (docUserPenerima.data() as Map<String, dynamic>)["chats"] as List;
    CollectionReference chats = firestore.collection('Chats');
    if(docListUserPengirim.isNotEmpty){
      String chatIdMessage = await dataSearchIdChatPersonal.searchIdChatPersonal(
        emailPenerima: emailPenerima,
        emailPengirim: emailPengirim,
      );
      if(chatIdMessage != "-" && messager != "-"){
        await dataChatAddCollectionFirebase.chatAddCollection(
          chatId: chats.doc(chatIdMessage.toString()), 
          emailPengirim: emailPengirim, 
          emailPenerima: emailPenerima, 
          messager: messager, 
          read: false
        );
      }else{
        String chatId = await dataChatAddFirebase.chatAdd(emailPenerima: emailPenerima, emailPengirim: emailPengirim);
        await dataEmptyChatFirebase.emptyChat(
          chatId: chatId,
          docListUserPenerima: docListUserPenerima, 
          docListUserPengirim: docListUserPengirim, 
          emailPenerima: emailPenerima, 
          emailPengirim: emailPengirim,
          users: users,
        );  
      }
    }else{
      String chatId = await dataChatAddFirebase.chatAdd(emailPenerima: emailPenerima, emailPengirim: emailPengirim);
      await dataEmptyChatFirebase.emptyChat(
        chatId: chatId,
        docListUserPenerima: docListUserPenerima, 
        docListUserPengirim: docListUserPengirim, 
        emailPenerima: emailPenerima, 
        emailPengirim: emailPengirim,
        users: users,
      );
    }
  }
}