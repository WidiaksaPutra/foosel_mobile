import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foosel/firebase/api_chat_firebase/componen/interfaces/interface_empty_chat_firebase.dart';

class EmptyChatFirebase implements InterfaceEmptyChatFirebase{
  @override
  emptyChat({
    required String emailPengirim, 
    required String emailPenerima, 
    required docListUserPengirim, 
    required docListUserPenerima, 
    required CollectionReference<Object?> users, 
    required chatId,
  }) async {
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
  }
}





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
    // loadingPostChatFirebase = false;