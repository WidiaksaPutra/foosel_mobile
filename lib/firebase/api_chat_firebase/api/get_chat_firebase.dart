import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foosel/firebase/api_chat_firebase/componen/interfaces/interface_search_id_chat_personal_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/interfaces/interface_get_chat_firebase.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
class GetChatFirebase implements InterfaceGetChatFirebase{
  final InterfaceSearchIdChatPersonalFirebase dataSearchIdChatPersonal = getItInstance<InterfaceSearchIdChatPersonalFirebase>();
  @override
  getChatFirebase({
    required String emailPengirim,
    required String emailPenerima,
  }) async{
    String chatIdMessage = await dataSearchIdChatPersonal.searchIdChatPersonal(
      emailPengirim: emailPengirim,
      emailPenerima: emailPenerima,
    );
    return chatIdMessage;
  }

  @override
  getJumlahFalseMessage({
    required String emailPengirim,
    required String emailPenerima,
  }) async{
    String chatIdMessage = await dataSearchIdChatPersonal.searchIdChatPersonal(
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