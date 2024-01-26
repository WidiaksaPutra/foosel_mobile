import 'package:sqflite/sqflite.dart' as sql;

class SqlUserTabel{
  static Future<void> createTableUser(sql.Database database) async{
    await database.execute("""
      CREATE TABLE user(
        name String,
        email String,
        username String,
        phone String,
        profilePhoto String
      )
    """);
  }

  static Future<sql.Database> db() async{
    return sql.openDatabase('user.db', version: 1, onCreate: (sql.Database database, int version) async {
      await createTableUser(database);
    });
  }
}
