import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foosel/firebase/api_user_firebase/interfaces/interface_update_user_firebase.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class UpdateUserFirebase implements InterfaceUpdateUserFirebase{
  @override
  Future updateUserFirebase({
    required String email,
    required statusUser,
  }) async{
    try{
      CollectionReference users = firestore.collection('users');
      users.doc(email).update({
        'status' : statusUser,
        'lastTime' : DateTime.now().toLocal(),
      });
      return true;
    }catch (e) {
      return false;
    }
  }
}