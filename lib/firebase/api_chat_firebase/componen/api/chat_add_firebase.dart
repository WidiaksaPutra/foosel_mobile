import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foosel/firebase/api_chat_firebase/componen/interfaces/interface_chat_add_firebase.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class ChatAddFirebase implements InterfaceChatAddFirebase{
  
  @override
  Future<String> chatAdd({
    required String emailPengirim, 
    required String emailPenerima,
  }) async{
    try{
      CollectionReference chats = firestore.collection('Chats');
      String chatId = chats.doc().id;
      chats.doc(chatId).set({
        'connection': [
          emailPengirim,
          emailPenerima
        ],
        'total_chats': 0,
        'total_read': 0,
        'total_unread': 0,
        'lastTime': DateTime.now().toLocal(),
      });
      return chatId;
    }catch (e) {
      return "error";
    }
  }
}