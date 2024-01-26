import 'package:sqflite/sqflite.dart' as sql;

class SqlProductsPopularTabel{
  static Future<void> createTableProductsPopular(sql.Database database) async{
    await database.execute("""
      CREATE TABLE productsPopular(
        tokenId String,
        name String,
        description TEXT,
        nameCategory String,
        price String
      )
    """);
  }

  static Future<sql.Database> db() async{
    return sql.openDatabase('productsPopular.db', version: 1, onCreate: (sql.Database database, int version) async {
      await createTableProductsPopular(database);
    });
  }
}
