import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foosel/firebase/api_chat_firebase/interfaces/interface_search_id_chat_personal_firebase.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class searchIdChatPersonalFirebase implements interfaceSearchIdChatPersonalFirebase{
  late String chatIdMessage = "-";

  @override
  SearchIdChatPersonal({
    required String emailPengirim, 
    required String emailPenerima,
  }) async {
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
  }
}