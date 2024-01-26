import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

mixin searchIdChatPersonalFirebase{
  late String chatIdMessage = "-";
  searchIdChatPersonal({required String emailPengirim, required String emailPenerima}) async{
    print("search id $emailPengirim & $emailPenerima");
    CollectionReference users = firestore.collection('users');
    final docUserPengirim = await users.doc(emailPengirim.toString()).get();
    final docListUserPengirim = (docUserPengirim.data() as Map<String, dynamic>)["chats"] as List;
    for(var singleChat in docListUserPengirim){
      print("99 ${singleChat["connection"]}");
      if(singleChat["connection"] == emailPenerima){
        print("masuk ke serch");
        chatIdMessage = singleChat["chat_id"].toString();
        break;
      }
    };
  }
}