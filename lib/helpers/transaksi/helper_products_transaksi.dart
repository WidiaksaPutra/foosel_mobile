import 'package:flutter_laravel_toko_sepatu/helpers/transaksi/sql_transaksi_product_tabel.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_delete_data_product_transaksi_storage_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_get_data_product_transaksi_storage_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_insert_product_transaksi_local.dart';

class helperProductsTransaksi implements interfaceGetDataProductTransaksiStorageLocal, interfaceInsertDataProductTransaksiLocal, interfaceDeleteDataProductTransaksiStorageLocal{
  @override
  Future<int> InsertDataLocal({
    required String tokenId, 
    required String name, 
    required String description, 
    required String nameCategory, 
    required String price,
    required String status,
    required String imagePath
  }) async {
    final db = await SqlProductsTransaksiTabel.db();
    final dataInsert = {
      'tokenId': tokenId, 
      'name': name,
      'description': description, 
      'nameCategory': nameCategory, 
      'price': price,
      'status': status,
      'imagePath': imagePath
    };
    return await db.insert('productsTransaksi', dataInsert);
  }
  
  @override
  Future<List<Map<String, dynamic>>> GetDataProductTransaksiLocal() async{
    final dbGet = await SqlProductsTransaksiTabel.db();
    return await dbGet.query('productsTransaksi');
  }
  
  @override
  Future<List<Map<String, dynamic>>> GetDataProductTransaksiWhereIdLocal({required String tokenId}) async {
    final dbGet = await SqlProductsTransaksiTabel.db();
    return await dbGet.query('productsTransaksi', where: "tokenId = '$tokenId'");
  }

  @override
  Future<int> DeleteDataProductTransaksiLocal() async{
    final db = await SqlProductsTransaksiTabel.db();
    return await db.delete('productsTransaksi');
  }
  
  @override
  DeleteDataProductTransaksiWhereIdLocal({required String tokenId}) {
    // TODO: implement DeleteDataProductTransaksiWhereIdLocal
    throw UnimplementedError();
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
  //   return await db.insert('productsTransaksi', dataInsert);
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
  //   return await db.insert('productsTransaksiPopular', dataInsert);
  // }

  // //fungsi mengambil data
  // Future<List<Map<String, dynamic>>> getDataProducts({bool typeProduct = true}) async {
  //   final dbGet = await SqlProductsTabel.db();
  //   return dbGet.rawQuery("SELECT * FROM productsTransaksi WHERE typeProduct='$typeProduct'");
  // }

  // Future<List<Map<String, dynamic>>> getDataProductsPopular({bool typeProduct = false}) async {
  //   final dbGet = await SqlProductsTabel.db();
  //   return dbGet.rawQuery("SELECT * FROM productsTransaksi WHERE typeProduct='$typeProduct'");
  // }

  // Future<List<Map<String, dynamic>>> getDataProductsNameCategory(String nameCategory, {bool typeProduct = true}) async {
  //   final dbGet = await SqlProductsTabel.db();
  //   return dbGet.rawQuery("SELECT * FROM productsTransaksi WHERE nameCategory='$nameCategory' && typeProduct='$typeProduct'");
  // }

  // //fungsi mengambil data
  // Future<List<Map<String, dynamic>>> deleteDataProducts({bool typeProduct = true}) async {
  //   final db = await SqlProductsTabel.db();
  //   return db.rawQuery("DELETE FROM productsTransaksi WHERE typeProduct='$typeProduct'");
  // }

  // //fungsi mengambil data
  // Future<List<Map<String, dynamic>>> deleteDataProductsPopular({bool typeProduct = false}) async {
  //   final db = await SqlProductsTabel.db();
  //   return db.rawQuery("DELETE FROM productsTransaksi WHERE typeProduct='$typeProduct'");
  // }