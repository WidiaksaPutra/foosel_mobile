import 'package:sqflite/sqflite.dart' as sql;

class SqlLikeTabel{
  static Future<void> createTableLike(sql.Database database) async{
    await database.execute("""
      CREATE TABLE like(
        tokenId String,
        name String,
        description TEXT,
        nameCategory String,
        price String,
        imagePath TEXT
      )
    """);
  }

  static Future<sql.Database> db() async{
    return sql.openDatabase('like.db', version: 1, onCreate: (sql.Database database, int version) async {
      await createTableLike(database);
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
