import 'package:foosel/helpers/login/sql_login_tabel.dart';

mixin helperLogin{
  Future<int> insertDataLogin({required String email, required String password, required String token}) async {
    final db = await SqlLoginTabel.db();
    final dataInsert = {'email': email, 'password': password, 'token': token};
    return await db.insert('login', dataInsert);
  }

  //fungsi update data
  Future<int> updateDataLogin({required String email, required String password, required String token}) async {
    final db = await SqlLoginTabel.db();
    final dataUpdate = {'email': email, 'password': password, 'token': token};
    return await db.update('login', dataUpdate);
    // return await db.rawUpdate("UPDATE user SET email='$email',password='$password',token='$token' WHERE email='$emailBefore'");
  }

  Future<int> updateDataEmailLogin(String email) async {
    final db = await SqlLoginTabel.db();
    final dataUpdate = {'email': email};
    return await db.update('login', dataUpdate);
    // return await db.rawUpdate("UPDATE user SET email='$email',password='$password',token='$token' WHERE email='$emailBefore'");
  }

  //fungsi mengambil data
  Future<List<Map<String, dynamic>>> getDataLogin() async {
    final dbGet = await SqlLoginTabel.db();
    return await dbGet.query("login");
  }

  //fungsi mengambil data
  Future<int> deleteDataLogin() async {
    final db = await SqlLoginTabel.db();
    return await db.delete("login");
  }
}