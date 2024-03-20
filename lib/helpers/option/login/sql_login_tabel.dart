// import 'package:sqflite/sqflite.dart' as sql;

// class SqlLoginTabel{
//   static Future<void> createTableLogin(sql.Database database) async{
//     await database.execute("""
//       CREATE TABLE login(
//         email String,
//         password String,
//         token TEXT     
//       )
//     """);
//   }

//   static Future<sql.Database> db() async{
//     return sql.openDatabase('login.db', version: 1, onCreate: (sql.Database database, int version) async {
//       await createTableLogin(database);
//     });
//   }
// }
