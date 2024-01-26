import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

mixin chatAddFirebase{
  String chatAdd({required String emailPengirim, required String emailPenerima}){
    CollectionReference chats = firestore.collection('Chats');
    String chatId = chats.doc().id;
    chats.doc(chatId).set({
      'connection': [
        emailPengirim,
        emailPenerima
      ],
      'total_chats': 0,
      'total_read': 0,
      'total_unread': 1,
      'lastTime': DateTime.now().toLocal(),
    });
    return chatId;
  }
}