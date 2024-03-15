import 'package:foosel/helpers/products/product_popular/sql_products_tabel.dart';

mixin helperProductsPopular{
   //fungsi menambah data
  Future<int> insertDataProductsPopular({required String tokenId, required String name, required String description, required String nameCategory, required String price}) async {
    final db = await SqlProductsPopularTabel.db();
    final dataInsert = {'tokenId': tokenId, 'name': name, 'description': description, 'nameCategory': nameCategory, 'price': price};
    return await db.insert('productsPopular', dataInsert);
  }

  //fungsi update data
  Future<int> updateDataProductsPopular({required String tokenId, required String name, required String description, required String nameCategory, required String price}) async {
    final db = await SqlProductsPopularTabel.db();
    final dataUpdate = {'tokenId': tokenId, 'name': name, 'description': description, 'nameCategory': nameCategory, 'price': price};
    return await db.update('productsPopular', dataUpdate);
    // return await db.rawUpdate("UPDATE login SET email='$email',password='$password',token='$token' WHERE email='$emailBefore'");
  }

  //fungsi mengambil data
  Future<List<Map<String, dynamic>>> getDataProductsPopular() async {
    final dbGet = await SqlProductsPopularTabel.db();
    return await dbGet.query('productsPopular');
  }

  //fungsi mengambil data
  Future<int> deleteDataProductsPopular() async {
    final db = await SqlProductsPopularTabel.db();
    return await db.delete('productsPopular');
  }
}