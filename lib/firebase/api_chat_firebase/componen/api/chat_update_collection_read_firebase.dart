import 'package:foosel/firebase/api_chat_firebase/componen/interfaces/interface_chat_update_collection_read_firebase.dart';

class ChatUpdateCollectionReadFirebase implements InterfaceChatUpdateCollectionReadFirebase{
  chatUpdateCollectionRead({
    required dynamic chatId,
    required bool read,
    required dynamic messageId,
  }) async{
    await chatId.collection("message").doc(messageId).update({
      'isRead': read,
    });
  }
}



