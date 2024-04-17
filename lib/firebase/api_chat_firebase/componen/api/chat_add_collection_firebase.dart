import 'package:foosel/firebase/api_chat_firebase/componen/interfaces/interface_chat_add_collection_firebase.dart';

class ChatAddCollectionFirebase implements InterfaceChatAddCollectionFirebase{
  
  @override
  Future<void> chatAddCollection({
    required chatId, 
    required String emailPengirim, 
    required String emailPenerima, 
    required String messager, 
    required bool read,
  }) async{
    await chatId.collection("message").add({
      'isRead': read,
      'penerima': emailPenerima,
      'pengirim': emailPengirim,
      'pesan': messager,
      'time': DateTime.now().toLocal(),
    });
  }

  @override
  Future<void> chatAddCollectionNotMessage({
    required chatId, 
    required String emailPengirim, 
    required String emailPenerima, 
    required bool read,
  }) async{
    await chatId.collection("message").add({
      'isRead': read,
      'penerima': emailPenerima,
      'pengirim': emailPengirim,
      'time': DateTime.now().toLocal(),
    });  
  }
}