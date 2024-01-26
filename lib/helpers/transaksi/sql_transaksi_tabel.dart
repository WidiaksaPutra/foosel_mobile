import 'package:sqflite/sqflite.dart' as sql;

class SqlTransaksiTabel{
  static Future<void> createTableTransaksi(sql.Database database) async{
    await database.execute("""
      CREATE TABLE transaksi(
        tokenId String,
        emailPenjual String,
        emailPembeli String,
        productId String,
        name String,
        description TEXT,
        idCategory String,
        nameCategory String,
        hargaSatuan String,
        hargaTotal String,
        jumlah int,
        imagePath TEXT
      )
    """);
  }

  static Future<sql.Database> db() async{
    return sql.openDatabase('transaksi.db', version: 1, onCreate: (sql.Database database, int version) async {
      await createTableTransaksi(database);
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
