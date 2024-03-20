import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foosel/firebase/api_user_firebase/interfaces/interface_insert_user_firebase.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class InsertUserFirebase implements InterfaceInsertUserFirebase{
  @override
  insertUserFirebase({
    required tokenNotive,
    required dataProfil,
  }) async {
    CollectionReference users = firestore.collection('users');
    final chackuser = await users.doc(dataProfil.email.toString()).get();
    if(chackuser.data() == null){
      users.doc(dataProfil.email.toString()).set({
        'email' : dataProfil.email.toString(),
        'nama' : dataProfil.name.toString(),
        'gambar' : dataProfil.profilePhotoPath.toString(),
        'status' : 'Offline',
        'lastTime' : DateTime.now().toLocal(),
        'roles' : dataProfil.roles.toString(),
        'chats' : [],
        'token_notive': tokenNotive,
      });
    }else{
      users.doc(dataProfil.email.toString()).update({
        'status' : 'Offline',
        'lastTime' : DateTime.now().toLocal(),
        'token_notive': tokenNotive,
      });
    }
    return true;
  }
}