// ignore_for_file: unnecessary_null_comparison, unused_local_variable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_laravel_toko_sepatu/firebase/api_chat_firebase/mixin/chat_add_collection_firebase.dart';
import 'package:flutter_laravel_toko_sepatu/firebase/api_chat_firebase/mixin/chat_add_firebase.dart';
import 'package:flutter_laravel_toko_sepatu/firebase/api_chat_firebase/mixin/chat_update_firebase.dart';
import 'package:flutter_laravel_toko_sepatu/firebase/api_chat_firebase/mixin/empty_chat_firebase.dart';
import 'package:flutter_laravel_toko_sepatu/firebase/api_chat_firebase/mixin/search_id_chat_personal_firebase.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/firebase/interface_insert_chat_firebase.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class insertChatFirebase 
with searchIdChatPersonalFirebase, chatUpdateFirebase, chatAddCollectionFirebase, emptyChatFirebase, chatAddFirebase 
implements interfaceInsertChatFirebase{  
  @override
  InsertChatFirebase({
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
      await searchIdChatPersonal(emailPenerima: emailPenerima, emailPengirim: emailPengirim);  
      if(chatIdMessage != "-" && messager != "-"){
        chatUpdate(chatIdMessage.toString());
        chatAddCollection(
          chatId: chats.doc(chatIdMessage.toString()), 
          emailPengirim: emailPengirim, 
          emailPenerima: emailPenerima, 
          messager: messager, 
          read: false
        );
      }else{
        String chatId = await chatAdd(emailPenerima: emailPenerima, emailPengirim: emailPengirim);
        emptyChat(
          chatId: chatId,
          docListUserPenerima: docListUserPenerima, 
          docListUserPengirim: docListUserPengirim, 
          emailPenerima: emailPenerima, 
          emailPengirim: emailPengirim,
          users: users,
        );  
      }
    }else{
      String chatId = await chatAdd(emailPenerima: emailPenerima, emailPengirim: emailPengirim);
      emptyChat(
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


