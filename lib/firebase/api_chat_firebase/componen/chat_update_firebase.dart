import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

mixin chatUpdateFirebase{
  chatUpdate({
    required String chatId,
    required int totalChats,
    required int totalRead,
    required int totalUnread,
  }) async{
    CollectionReference chats = firestore.collection('Chats');
    await chats.doc(chatId).update({
      'total_chats': totalChats,
      'total_read': totalRead,
      'total_unread': totalUnread,
      'lastTime': DateTime.now().toLocal(),
    });
  }
}