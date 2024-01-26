import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/firebase/interface_update_user_firebase.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

class updateUserFirebase implements interfaceUpdateUserFirebase{

  @override
  UpdateUserFirebase({
    required String email,
    required statusUser,
  }) {
    CollectionReference users = firestore.collection('users');
    users.doc(email).update({
      'status' : statusUser,
      'lastTime' : DateTime.now().toLocal(),
    });
    return true;
  }
}