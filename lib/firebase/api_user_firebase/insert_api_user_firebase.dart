import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/firebase/interface_insert_user_firebase.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

class insertUserFirebase implements interfaceInsertUserFirebase{
  @override
  InsertUserFirebase({
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