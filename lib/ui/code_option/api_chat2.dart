// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:foosel/model/user_firebase.dart';
// import 'package:foosel/shared/theme_global_variabel.dart';

// mixin chatFirebase{
//   late bool loadingPostChatFirebase = true;
//   late bool loadingFetchChatFirebase = true;
//   late String connection, insertChatId;

//   insertChat(emailPengirim, emailPenerima, message) async{
//     CollectionReference users = firestore.collection('users');
//     final docUserPengirim = await users.doc(emailPengirim.toString()).get();
//     final docUserPenerima = await users.doc(emailPenerima.toString()).get();
//     final docListUserPengirim = (docUserPengirim.data() as Map<String, dynamic>)["chats"] as List;
//     final docListUserPenerima = (docUserPenerima.data() as Map<String, dynamic>)["chats"] as List;
//     CollectionReference chats = firestore.collection('Chats');
    
//     if(docListUserPengirim.isNotEmpty){
//       // chat user tidak kosong
//       docListUserPengirim.forEach((singleChat) {
//         if(singleChat["connection"] == emailPenerima){
//           insertChatId = singleChat["chat_id"].toString();
//           print(singleChat["chat_id"]);
//         }
//       });
//       if(insertChatId != null){
//         // chat id sudah isi
//         final docChat = await chats.doc(insertChatId.toString()).get();
//         final docListChat = (docChat.data() as Map<String, dynamic>)["chat"] as List;
//         docListChat.add({
//           'isRead': false,
//           'penerima': emailPenerima,
//           'pengirim': emailPengirim,
//           'pesan': message,
//           'time': DateTime.now().toLocal(),
//         });
//         await chats.doc(insertChatId.toString()).update({'chat': docListChat});
//         loadingPostChatFirebase = false;
//       }else{
//         // chat id kosong
//         final newChatDoc = await chats.add({
//           'connection': [
//             emailPengirim,
//             emailPenerima
//           ],
//           'chat':[
//             {
//               'isRead': false,
//               'penerima': emailPenerima,
//               'pengirim': emailPengirim,
//               'pesan': message,
//               'time': DateTime.now().toLocal(),
//             }
//           ],
//           'total_chats': 0,
//           'total_read': 0,
//           'total_unread': 1,
//         });

//         docListUserPengirim.add({
//           'chat_id': newChatDoc.id,
//           'connection': emailPenerima,
//           'lastTime': DateTime.now().toLocal(),
//         });
//         await users.doc(emailPengirim.toString()).update({'chats': docListUserPengirim});

//         docListUserPenerima.add({
//           'chat_id': newChatDoc.id,
//           'connection': emailPengirim,
//           'lastTime': DateTime.now().toLocal(),
//         });
//         await users.doc(emailPenerima.toString()).update({'chats': docListUserPenerima});
//         loadingPostChatFirebase = false;
//       }
//     }else{
//       // chat user kosong
//       final newChatDoc = await chats.add({
//         'connection': [
//           emailPengirim,
//           emailPenerima
//         ],
//         'chat':[
//           {
//             'isRead': false,
//             'penerima': emailPenerima,
//             'pengirim': emailPengirim,
//             'pesan': message,
//             'time': DateTime.now().toLocal(),
//           }
//         ],
//         'total_chats': 0,
//         'total_read': 0,
//         'total_unread': 1,
//       });

//       await users.doc(emailPengirim).update({
//         'chats': [
//           {
//             'chat_id': newChatDoc.id,
//             'connection': emailPenerima,
//             'lastTime': DateTime.now().toLocal(),
//           }
//         ]
//       });

//       await users.doc(emailPenerima).update({
//         'chats': [
//           {
//             'chat_id': newChatDoc.id,
//             'connection': emailPengirim,
//             'lastTime': DateTime.now().toLocal(),
//           }
//         ]
//       });
//       loadingPostChatFirebase = false;
//     }
//   }

//   // updateIsReadChat(emailPengirim, emailPenerima) async{
//   //   CollectionReference userPer = firestore.collection('users');
//   //   CollectionReference chats = firestore.collection('Chats');
//   //   final userPerDoc = await userPer.doc(emailPengirim.toString()).get();
//   //   List userPersonalStatus = (userPerDoc.data() as Map<String, dynamic>)['chats'] as List;    
//   //   for(var indexUser in userPersonalStatus){
//   //     if(indexUser['connection'].toString() == emailPenerima.toString()){
//   //       final chatListDoc = await chats.doc(indexUser['chat_id'].toString()).get();
//   //       List chatMapList = (chatListDoc.data() as Map<String, dynamic>)['chat'] as List; 
//   //       for(int indexChat = 0; indexChat < chatMapList.length; indexChat++){
//   //         if(chatMapList[indexChat]['isRead'] == false){
//   //           await chats.doc(indexUser['chat_id'].toString()).update({
//   //             'chat': FieldValue.arrayRemove([{
//   //               'isRead': true,
//   //               // 'penerima': chatMapList[indexChat]['penerima'].toString(),
//   //               // 'pengirim': chatMapList[indexChat]['pengirim'].toString(),
//   //               // 'pesan': chatMapList[indexChat]['pesan'].toString(),
//   //               // 'time': DateTime.now().toLocal(),
//   //             }]),
//   //           });
//   //         }
//   //       }
//   //     }
//   //   }
//   // }

//   getChat(emailPengirim, emailPenerima) async{
//     final users = await firestore.collection('users').get();
//     if(users.docs.isNotEmpty){
//       for (var element in users.docs) {
//         if(FirebaseUsers.fromJson(element.data()).email.toString() == emailPengirim.toString() && FirebaseUsers.fromJson(element.data()).chats!.isNotEmpty){
//           for(int index = 0; index < FirebaseUsers.fromJson(element.data()).chats!.length; index++){
//             if(FirebaseUsers.fromJson(element.data()).chats![index].connection.toString() == emailPenerima.toString()){
//               connection = FirebaseUsers.fromJson(element.data()).chats![index].chatId.toString();
//             }
//           }
//         }     
//       }
//     }
//     loadingFetchChatFirebase = false;
//   }
// }

// // CollectionReference chats = firestore.collection('Chats');
// //     var allDoc = await chats.get();
// //     print("test update chat");   
// //     print(allDoc.docs.first.id);