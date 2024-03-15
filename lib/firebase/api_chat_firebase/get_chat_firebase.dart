import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foosel/firebase/api_chat_firebase/interfaces/interface_search_id_chat_personal_firebase.dart';
import 'package:foosel/interface/interface_local/firebase/interface_get_chat_firebase.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
class getChatFirebase implements interfaceGetChatFirebase{
  final interfaceSearchIdChatPersonalFirebase dataSearchIdChatPersonal = getItInstance<interfaceSearchIdChatPersonalFirebase>();
  @override
  GetChatFirebase({
    required String emailPengirim,
    required String emailPenerima,
  }) async{
    String chatIdMessage = await dataSearchIdChatPersonal.SearchIdChatPersonal(
      emailPengirim: emailPengirim,
      emailPenerima: emailPenerima,
    );
    return chatIdMessage;
  }

  @override
  GetJumlahFalseMessage({
    required String emailPengirim,
    required String emailPenerima,
  }) async{
    String chatIdMessage = await dataSearchIdChatPersonal.SearchIdChatPersonal(
      emailPenerima: emailPenerima, 
      emailPengirim: emailPengirim,
    );
    late int jumlahFalseMessage = 0;
    CollectionReference chats = firestore.collection('Chats');
    final docMessage = await chats.doc(chatIdMessage).collection("message").orderBy('time').get();
    if(docMessage.docs.length != 0){
      for(var updateMessage in docMessage.docs){
        if(updateMessage['penerima'] == emailPengirim && updateMessage['isRead'] == false){
          jumlahFalseMessage++;
        }
      }
    }
    return await jumlahFalseMessage; 
  }
}