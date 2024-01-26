// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

// mixin chatFirebase{
  // late bool loadingPostChatFirebase = true;
  // late bool loadingFetchChatFirebase = true;
  // var insertChatId;
  // late List listMessageId = [];
  
  // chatsAdd(String emailPengirim, String emailPenerima) async{
  //   CollectionReference chats = firestore.collection('Chats');
  //   String chatId = chats.doc().id;
  //   chats.doc(chatId).set({
  //     'connection': [
  //       emailPengirim,
  //       emailPenerima
  //     ],
  //     'total_chats': 0,
  //     'total_read': 0,
  //     'total_unread': 1,
  //     'lastTime': DateTime.now().toLocal(),
  //   });
  //   return chatId;
  // }

  // docChatsUpdate(String chatId) async{
  //   CollectionReference chats = firestore.collection('Chats');
  //   await chats.doc(chatId).update({
  //     'total_chats': 1,
  //     'total_read': 0,
  //     'total_unread': 1,
  //     'lastTime': DateTime.now().toLocal(),
  //   });
  // }

  // chatsAddCollection({
  //   required dynamic chatId, 
  //   required String emailPengirim, 
  //   required String emailPenerima, 
  //   required String messager, 
  //   required bool read,
  // }) async{
  //   await chatId.collection("message").add({
  //     'isRead': read,
  //     'penerima': emailPenerima,
  //     'pengirim': emailPengirim,
  //     'pesan': messager,
  //     'time': DateTime.now().toLocal(),
  //   });
  // }

  // chatsAddCollectionNotMessage({
  //   required dynamic chatId, 
  //   required String emailPengirim, 
  //   required String emailPenerima,
  //   required bool read,
  // }) async{
  //   await chatId.collection("message").add({
  //     'isRead': read,
  //     'penerima': emailPenerima,
  //     'pengirim': emailPengirim,
  //     'time': DateTime.now().toLocal(),
  //   });
  // }

  // chatsUpdateCollectionRead({
  //   required dynamic chatId,
  //   required bool read,
  //   required dynamic messageId,
  // }) async{
  //   await chatId.collection("message").doc(messageId).update({
  //     'isRead': read,
  //   });
  // }

  // searchIdChatPersonal(String emailPengirim, String emailPenerima) async{
  //   CollectionReference users = firestore.collection('users');
  //   final docUserPengirim = await users.doc(emailPengirim.toString()).get();
  //   final docListUserPengirim = (docUserPengirim.data() as Map<String, dynamic>)["chats"] as List;
  //   for(var singleChat in docListUserPengirim){
  //     if(singleChat["connection"] == emailPenerima){
  //       insertChatId = singleChat["chat_id"].toString();
  //       break;
  //     }
  //   };
  // }

  // emptyChat({ 
  //   required String emailPengirim, 
  //   required String emailPenerima,
  //   required dynamic docListUserPengirim, 
  //   required dynamic docListUserPenerima, 
  //   required CollectionReference users,
  // }) async{
  //   String chatId = await chatsAdd(emailPengirim, emailPenerima);
  //   chatsAddCollectionNotMessage(
  //     chatId: chatId, 
  //     emailPengirim: emailPengirim, 
  //     emailPenerima: emailPenerima,
  //     read: false,
  //   );
  //   insertChatId = chatId;
    
  //   docListUserPengirim.add({
  //     'chat_id': insertChatId,
  //     'connection': emailPenerima,
  //   });
  //   await users.doc(emailPengirim.toString()).update({'chats': docListUserPengirim});
    
  //   docListUserPenerima.add({
  //     'chat_id': insertChatId,
  //     'connection': emailPengirim,
  //   });
  //   await users.doc(emailPenerima.toString()).update({'chats': docListUserPenerima});
  //   // loadingPostChatFirebase = false;
  // }

  // insertChat({
  //   required String emailPengirim,
  //   required String emailPenerima,
  //   required dynamic messager,
  // }) async{
  //   CollectionReference users = firestore.collection('users');
  //   final docUserPengirim = await users.doc(emailPengirim.toString()).get();
  //   final docUserPenerima = await users.doc(emailPenerima.toString()).get();
  //   final docListUserPengirim = (docUserPengirim.data() as Map<String, dynamic>)["chats"] as List;
  //   final docListUserPenerima = (docUserPenerima.data() as Map<String, dynamic>)["chats"] as List;
  //   CollectionReference chats = firestore.collection('Chats');

  //   if(docListUserPengirim.isNotEmpty){
  //     await searchIdChatPersonal(emailPengirim, emailPenerima);
  //     print("test insert id $insertChatId");
  //     if(insertChatId != null){
  //       docChatsUpdate(insertChatId.toString());
  //       chatsAddCollection(
  //         chatId: chats.doc(insertChatId.toString()), 
  //         emailPengirim: emailPengirim, 
  //         emailPenerima: emailPenerima, 
  //         messager: messager, 
  //         read: false
  //       );
  //       // loadingPostChatFirebase = false;
  //     }else{
  //       // emptyChat(
  //       //   docListUserPenerima: docListUserPenerima, 
  //       //   docListUserPengirim: docListUserPengirim, 
  //       //   emailPenerima: emailPenerima, 
  //       //   emailPengirim: emailPengirim,
  //       //   users: users,
  //       // );
  //       // loadingPostChatFirebase = false;
  //     }
  //   }else{
  //     // emptyChat(
  //     //   docListUserPenerima: docListUserPenerima, 
  //     //   docListUserPengirim: docListUserPengirim, 
  //     //   emailPenerima: emailPenerima, 
  //     //   emailPengirim: emailPengirim,
  //     //   users: users,
  //     // );
  //     // loadingPostChatFirebase = false;
  //   }
  // }

  // updateIsReadChat(String emailPengirim, String emailPenerima) async{
  //   await searchIdChatPersonal(emailPengirim, emailPenerima);
  //   await docChatsUpdate(insertChatId);
  //   CollectionReference chats = firestore.collection('Chats');
  //   final docMessage = await chats.doc(insertChatId).collection("message").orderBy('time').get();
  //   for(var updateMessage in docMessage.docs){
  //     if(updateMessage['penerima'] == emailPengirim && updateMessage['isRead'] == false){
  //       await chatsUpdateCollectionRead(
  //         chatId: chats.doc(insertChatId.toString()),
  //         read: true, 
  //         messageId: updateMessage.id,
  //       );
  //     }
  //   }
  // }

  // getChat(emailPengirim, emailPenerima) async{
  //   await searchIdChatPersonal(emailPengirim, emailPenerima);
  //   // loadingFetchChatFirebase = false;
  // }
// }