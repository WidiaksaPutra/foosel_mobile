import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foosel/firebase/api_chat_firebase/componen/interfaces/interface_search_id_chat_personal_firebase.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class SearchIdChatPersonalFirebase implements InterfaceSearchIdChatPersonalFirebase{
  late String chatIdMessage = "-";
  
  @override
  Future<String> searchIdChatPersonal({
    required String emailPengirim,
    required String emailPenerima,
  }) async {
    try{
      CollectionReference users = firestore.collection('users');
      final docUserPengirim = await users.doc(emailPengirim.toString()).get();
      final docListUserPengirim = (docUserPengirim.data() as Map<String, dynamic>)["chats"] as List;
      for(var singleChat in docListUserPengirim){
        if(singleChat["connection"] == emailPenerima){
          chatIdMessage = singleChat["chat_id"].toString();
          break;
        }
      };
      return chatIdMessage;
    }catch (e) {
      return "error";
    }
  }
}