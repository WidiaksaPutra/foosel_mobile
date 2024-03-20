import 'package:foosel/helpers/user/interfaces/interface_delete_data_user_local.dart';
import 'package:foosel/helpers/user/interfaces/interface_get_data_user_local.dart';
import 'package:foosel/helpers/user/interfaces/interface_insert_data_user_local.dart';
import 'package:foosel/helpers/user/interfaces/interface_update_data_user_local.dart';
import 'package:foosel/helpers/user/sql_user_tabel.dart';

class HelperUser implements
  InterfaceInsertDataUserLocal,
  InterfaceUpdateDataUserLocal,
  InterfaceGetDataUserLocal,
  InterfaceDeleteDataUserLocal{
  
  @override
  Future<int> insertDataUser({
    required String name, 
    required String email, 
    required String username, 
    required String phone, 
    required String profilePhoto,
  }) async{
    final db = await SqlUserTabel.db();
    final dataInsert = {'name': name, 'email': email, 'username': username, 'phone': phone, 'profilePhoto': profilePhoto};
    return await db.insert('user', dataInsert);
  }

  @override
  Future<int> updateDataUser({
    required String name, 
    required String email, 
    required String username, 
    required String phone, 
    required String profilePhoto,
  }) async {
    final db = await SqlUserTabel.db();
    final dataUpdate = {'name': name, 'email': email, 'username': username, 'phone': phone, 'profilePhoto': profilePhoto};
    return await db.update('user', dataUpdate);
    // return await db.rawUpdate("UPDATE user SET email='$email',password='$password',token='$token' WHERE email='$emailBefore'");
  }

  @override
  Future<List<Map<String, dynamic>>> getDataUser() async{
    final dbGet = await SqlUserTabel.db();
    return await dbGet.query("user");
  }
  
  @override
  Future<int> deleteDataUser() async {
    final db = await SqlUserTabel.db();
    return await db.delete("user");
  }
}