import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foosel/firebase/api_chat_firebase/componen/interfaces/interface_search_id_chat_personal_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/interfaces/interface_delete_chat_firebase.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class DeleteChatFirebase implements InterfaceDeleteChatFirebase{
  final InterfaceSearchIdChatPersonalFirebase dataSearchIdChatPersonal = getItInstance<InterfaceSearchIdChatPersonalFirebase>();
  @override
  deleteChatFirebase({required String emailPengirim, required String emailPenerima}) async{
    String chatIdMessage = await dataSearchIdChatPersonal.searchIdChatPersonal(
      emailPenerima: emailPenerima, 
      emailPengirim: emailPengirim,
    );
    CollectionReference chats = firestore.collection('Chats');
    QuerySnapshot dataMessageChat = await chats.doc(chatIdMessage).collection("message").get();
    if(dataMessageChat.docs.isNotEmpty){
      for(QueryDocumentSnapshot docSnapshot in dataMessageChat.docs){
        await docSnapshot.reference.delete();
      }
    }
    await chats.doc(chatIdMessage).delete();
    return true;
  }
}