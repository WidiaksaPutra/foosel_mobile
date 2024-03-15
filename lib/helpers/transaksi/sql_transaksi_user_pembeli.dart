// import 'package:sqflite/sqflite.dart' as sql;

// class SqlUserPembeliTabel{
//   static Future<void> createTableUserPembeli(sql.Database database) async{
//     await database.execute("""
//       CREATE TABLE userPembeliTransaksi(
//         usersEmailPembeli String,
//         usersNamePembeli String,
//         usersUsernamePembeli String,
//         usersPhonePembeli String,
//         usersAlamatPembeli String,
//         usersPhotoPembeli String,
//       )
//     """);
//   }

//   static Future<sql.Database> db() async{
//     return sql.openDatabase('userPembeliTransaksi.db', version: 1, onCreate: (sql.Database database, int version) async {
//       await createTableUserPembeli(database);
//     });
//   }
// }