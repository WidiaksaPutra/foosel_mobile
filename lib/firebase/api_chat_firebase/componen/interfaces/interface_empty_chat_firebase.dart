import 'package:cloud_firestore/cloud_firestore.dart';

abstract class InterfaceEmptyChatFirebase{
  Future<void> emptyChat({ 
    required String emailPengirim, 
    required String emailPenerima,
    required dynamic docListUserPengirim, 
    required dynamic docListUserPenerima, 
    required CollectionReference users,
    required dynamic chatId,
  });
}