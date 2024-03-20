import 'package:foosel/helpers/products/product_all/sql_products_tabel.dart';
import 'package:foosel/helpers/products/product_all/interfaces/interface_delete_data_product_local.dart';
import 'package:foosel/helpers/products/product_all/interfaces/interface_get_data_product_local.dart';
import 'package:foosel/helpers/products/product_all/interfaces/interface_insert_data_products_local.dart';

class HelperProducts implements 
  InterfaceGetDataProductLocal, 
  InterfaceInsertDataProductsLocal, 
  InterfaceDeleteDataProductLocal{
  @override
  Future<int> insertDataLocal({
    required String tokenId,
    required String email,
    required String name,
    required String description, 
    required String nameCategory, 
    required String price,
    required String imagePath
  }) async {
    final db = await SqlProductsTabel.db();
    final dataInsert = {
      'tokenId': tokenId,
      'email': email,
      'name': name,
      'description': description, 
      'nameCategory': nameCategory, 
      'price': price,
      'imagePath': imagePath
    };
    return await db.insert('products', dataInsert);
  }

  @override
  Future<List<Map<String, dynamic>>> getDataProductLocal() async {
    final dbGet = await SqlProductsTabel.db();
    return await dbGet.query('products');
  }

  @override
  Future<List<Map<String, dynamic>>> getDataProductWhereIdLocal({required String tokenId}) async{
    final dbGet = await SqlProductsTabel.db();
    return await dbGet.query('products', where: "tokenId = '$tokenId'");
  }

  @override
  Future<int> deleteDataProductLocal() async{
    final db = await SqlProductsTabel.db();
    return await db.delete('products');
  }
}










  // Future<int> insertDataProducts(String id, String name, String description, String nameCategory, String price, {bool typeProduct = true}) async {
  //   final db = await SqlProductsTabel.db();
  //   final dataInsert = {
  //     'id': id, 
  //     'name': name, 
  //     'description': description, 
  //     'nameCategory': nameCategory, 
  //     'price': price, 
  //     'typeProduct': typeProduct
  //   };
  //   return await db.insert('products', dataInsert);
  // }

  // Future<int> insertDataProductsPopular(String id, String name, String description, String nameCategory, String price, {bool typeProduct = false}) async {
  //   final db = await SqlProductsTabel.db();
  //   final dataInsert = {
  //     'id': id, 
  //     'name': name, 
  //     'description': description, 
  //     'nameCategory': nameCategory, 
  //     'price': price, 
  //     'typeProduct': typeProduct
  //   };
  //   return await db.insert('productsPopular', dataInsert);
  // }

  // //fungsi mengambil data
  // Future<List<Map<String, dynamic>>> getDataProducts({bool typeProduct = true}) async {
  //   final dbGet = await SqlProductsTabel.db();
  //   return dbGet.rawQuery("SELECT * FROM products WHERE typeProduct='$typeProduct'");
  // }

  // Future<List<Map<String, dynamic>>> getDataProductsPopular({bool typeProduct = false}) async {
  //   final dbGet = await SqlProductsTabel.db();
  //   return dbGet.rawQuery("SELECT * FROM products WHERE typeProduct='$typeProduct'");
  // }

  // Future<List<Map<String, dynamic>>> getDataProductsNameCategory(String nameCategory, {bool typeProduct = true}) async {
  //   final dbGet = await SqlProductsTabel.db();
  //   return dbGet.rawQuery("SELECT * FROM products WHERE nameCategory='$nameCategory' && typeProduct='$typeProduct'");
  // }

  // //fungsi mengambil data
  // Future<List<Map<String, dynamic>>> deleteDataProducts({bool typeProduct = true}) async {
  //   final db = await SqlProductsTabel.db();
  //   return db.rawQuery("DELETE FROM products WHERE typeProduct='$typeProduct'");
  // }

  // //fungsi mengambil data
  // Future<List<Map<String, dynamic>>> deleteDataProductsPopular({bool typeProduct = false}) async {
  //   final db = await SqlProductsTabel.db();
  //   return db.rawQuery("DELETE FROM products WHERE typeProduct='$typeProduct'");
  // }