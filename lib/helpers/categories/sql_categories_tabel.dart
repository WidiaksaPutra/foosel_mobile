import 'package:sqflite/sqflite.dart' as sql;

class SqlCategoriesTabel{
  static Future<void> createTableCategories(sql.Database database) async{
    await database.execute("""
      CREATE TABLE categories(
        id String,
        name String
      )
    """);
  }

  static Future<sql.Database> db() async{
    return sql.openDatabase('categories.db', version: 1, onCreate: (sql.Database database, int version) async {
      await createTableCategories(database);
    });
  }
}
