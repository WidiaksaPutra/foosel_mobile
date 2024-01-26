import 'package:cloud_firestore/cloud_firestore.dart';

mixin emptyChatFirebase{
  emptyChat({ 
    required String emailPengirim, 
    required String emailPenerima,
    required dynamic docListUserPengirim, 
    required dynamic docListUserPenerima, 
    required CollectionReference users,
    required dynamic chatId,
  }) async{
    // String chatId = await chatsAdd(emailPengirim, emailPenerima);
    // chatsAddCollectionNotMessage(
    //   chatId: chatId, 
    //   emailPengirim: emailPengirim, 
    //   emailPenerima: emailPenerima,
    //   read: false,
    // );
    // chatsAddCollectionNotMessage;
    // await chatId.collection("message").add({
    //   'isRead': false,
    //   'penerima': emailPenerima,
    //   'pengirim': emailPengirim,
    //   'pesan': "messager",
    //   'time': DateTime.now().toLocal(),
    // });

    docListUserPengirim.add({
      'chat_id': chatId,
      'connection': emailPenerima,
    });
    await users.doc(emailPengirim.toString()).update({'chats': docListUserPengirim});
    
    docListUserPenerima.add({
      'chat_id': chatId,
      'connection': emailPengirim,
    });
    await users.doc(emailPenerima.toString()).update({'chats': docListUserPenerima});
    // loadingPostChatFirebase = false;
  }
}