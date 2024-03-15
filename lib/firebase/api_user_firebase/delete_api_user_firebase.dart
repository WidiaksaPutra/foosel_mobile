import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foosel/firebase/api_chat_firebase/interfaces/interface_search_id_chat_personal_firebase.dart';
import 'package:foosel/interface/interface_local/firebase/interface_delete_user_firebase.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class deleteUserFirebase implements interfaceDeleteUserFirebase
{
  final interfaceSearchIdChatPersonalFirebase dataSearchIdChatPersonal = getItInstance<interfaceSearchIdChatPersonalFirebase>();
  DeleteUserFirebase({
    required String emailPenerima,
    required String emailPengirim,    
  }) async{
    String chatIdMessage = await dataSearchIdChatPersonal.SearchIdChatPersonal(
      emailPenerima: emailPenerima,
      emailPengirim: emailPengirim,
    );
    CollectionReference users = firestore.collection('users');
    final docRefPengirim = users.doc(emailPengirim.toString());
    final docRefPenerima = users.doc(emailPenerima.toString());
    final docPengirim = await docRefPengirim.get();
    final docPenerima = await docRefPenerima.get();
    final docListUserPengirim = (docPengirim.data() as Map<String, dynamic>)["chats"] as List;
    final docListUserPenerima = (docPenerima.data() as Map<String, dynamic>)["chats"] as List;
    docListUserPengirim.removeWhere((item) => item['chat_id'] == chatIdMessage);
    docListUserPenerima.removeWhere((item) => item['chat_id'] == chatIdMessage);
    await docRefPengirim.update({'chats': docListUserPengirim});
    await docRefPenerima.update({'chats': docListUserPenerima});
    return true;
  }
}




// List<dynamic> copiedListUserPengirim = List.from(docListUserPengirim);
    // copiedListUserPengirim.forEach((chat) {
    //   if (chat['chat_id'] == chatIdMessage) {
    //     print("test data chat firebase");
    //     docListUserPengirim.remove(chat);
    //     // print("test remove user pengirim ${}");
    //   }
    // });
    // for(int index = 0; index < docListUserPengirim.length; index++) {
    //   if(docListUserPengirim[index]['chat_id'] == chatIdMessage){
    //     print("test remove user pengirim ${docListUserPengirim.removeAt(index)}");
    //   }
    // };
    // for(int index2 = 0; index2 < docListUserPenerima.length; index2++) {
    //   if(docListUserPenerima[index2]['chat_id'] == chatIdMessage){
    //     print("test remove user pengirim $docListUserPenerima");
    //   }
    // };