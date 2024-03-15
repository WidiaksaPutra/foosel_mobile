import 'package:foosel/helpers/user/sql_user_tabel.dart';

mixin helperUser{
  Future<int> insertDataUser(String name, String email, String username, String phone, String profilePhoto) async {
    final db = await SqlUserTabel.db();
    final dataInsert = {'name': name, 'email': email, 'username': username, 'phone': phone, 'profilePhoto': profilePhoto};
    return await db.insert('user', dataInsert);
  }

  //fungsi update data
  Future<int> updateDataUser(String name, String email, String username, String phone, String profilePhoto) async {
    final db = await SqlUserTabel.db();
    final dataUpdate = {'name': name, 'email': email, 'username': username, 'phone': phone, 'profilePhoto': profilePhoto};
    return await db.update('user', dataUpdate);
    // return await db.rawUpdate("UPDATE user SET email='$email',password='$password',token='$token' WHERE email='$emailBefore'");
  }

  //fungsi mengambil data
  Future<List<Map<String, dynamic>>> getDataUser() async {
    final dbGet = await SqlUserTabel.db();
    return await dbGet.query("user");
  }

  //fungsi mengambil data
  Future<int> deleteDataUser() async {
    final db = await SqlUserTabel.db();
    return await db.delete("user");
  }
}