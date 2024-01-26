import 'package:sqflite/sqflite.dart' as sql;

class SqlProductsTransaksiTabel{
  static Future<void> createTableProductsTransaksi(sql.Database database) async{
    await database.execute("""
      CREATE TABLE productsTransaksi(
        tokenId String,
        name String,
        description TEXT,
        nameCategory String,
        price String,
        status String,
        imagePath TEXT
      )
    """);
  }

  static Future<sql.Database> db() async{
    return sql.openDatabase('productsTransaksi.db', version: 1, onCreate: (sql.Database database, int version) async {
      await createTableProductsTransaksi(database);
    });
  }
}