import 'package:sqflite/sqflite.dart' as sql;

class SqlProductsTabel{
  static Future<void> createTableProducts(sql.Database database) async{
    await database.execute("""
      CREATE TABLE products(
        tokenId String,
        email String,
        name String,
        description TEXT,
        nameCategory String,
        price String,
        imagePath TEXT
      )
    """);
  }

  static Future<sql.Database> db() async{
    return sql.openDatabase('products.db', version: 1, onCreate: (sql.Database database, int version) async {
      await createTableProducts(database);
    });
  }
}


// class SqlProductsTabel{
//   static Future<void> createTableProducts(sql.Database database) async{
//     await database.execute("""
//       CREATE TABLE products(
//         id String,
//         name String,
//         description TEXT,
//         nameCategory String,
//         price String,
//         typeProduct BOOLEAN
//       )
//     """);
//   }

//   static Future<sql.Database> db() async{
//     return sql.openDatabase('products.db', version: 1, onCreate: (sql.Database database, int version) async {
//       await createTableProducts(database);
//     });
//   }
// }
