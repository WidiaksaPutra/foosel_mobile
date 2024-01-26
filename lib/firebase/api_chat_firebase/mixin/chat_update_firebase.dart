import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

mixin chatUpdateFirebase{
  chatUpdate(String chatId) async{
    CollectionReference chats = firestore.collection('Chats');
    await chats.doc(chatId).update({
      'total_chats': 1,
      'total_read': 0,
      'total_unread': 1,
      'lastTime': DateTime.now().toLocal(),
    });
  }
}