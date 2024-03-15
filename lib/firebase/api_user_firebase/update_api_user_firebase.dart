import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foosel/interface/interface_local/firebase/interface_update_user_firebase.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

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