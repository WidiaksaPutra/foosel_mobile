import 'package:foosel/helpers/transaksi/sql_transaksi_product_tabel.dart';
import 'package:foosel/interface/interface_local/helpers/interface_delete_data_product_transaksi_storage_local.dart';
import 'package:foosel/interface/interface_local/helpers/interface_get_data_product_transaksi_storage_local.dart';
import 'package:foosel/interface/interface_local/helpers/interface_insert_product_transaksi_local.dart';
import 'package:foosel/interface/interface_local/helpers/interface_update_data_product_transaksi_local.dart';

class helperProductsTransaksi implements interfaceGetDataProductTransaksiStorageLocal, interfaceInsertDataProductTransaksiLocal, interfaceDeleteDataProductTransaksiStorageLocal, interfaceUpdateDataProductTransaksiLocal{
  @override
  Future<int> InsertDataLocal({
    required String tokenTransaksi,
    required String usersEmailPembeli,
    required String usersEmailPenjual,
    required String tokenProduct, 
    required String name, 
    required String description, 
    required String nameCategory, 
    required String price,
    required String status,
    required String imagePath,
    required String quantity,
    required String totalPrice,
  }) async {
    final db = await SqlProductsTransaksiTabel.db();
    final dataInsert = {
      'tokenTransaksi': tokenTransaksi,
      'usersEmailPembeli': usersEmailPembeli,
      'usersEmailPenjual': usersEmailPenjual,	
      'tokenProduct': tokenProduct,
      'name': name,
      'description': description,
      'nameCategory': nameCategory,
      'price': price,
      'quantity': quantity,
      'totalPrice': totalPrice,
      'status': status,
      'imagePath': imagePath
    };
    return await db.insert('productsTransaksi', dataInsert);
  }
  
  @override
  Future<List<Map<String, dynamic>>> GetDataProductTransaksiLocal() async{
    final dbGet = await SqlProductsTransaksiTabel.db();
    // print("test get ${await dbGet.query('productsTransaksi')}");
    return await dbGet.query('productsTransaksi');
  }
  
  @override
  Future<List<Map<String, dynamic>>> GetDataProductTransaksiWhereIdLocal({required String tokenTransaksi}) async {
    final dbGet = await SqlProductsTransaksiTabel.db();
    return await dbGet.rawQuery("SELECT * FROM productsTransaksi WHERE tokenTransaksi = '$tokenTransaksi'").timeout(Duration(seconds: 10));
  }

  @override
  Future<int> DeleteDataProductTransaksiLocal() async{
    final db = await SqlProductsTransaksiTabel.db();
    return await db.delete('productsTransaksi');
  }
  
  @override
  Future<int> DeleteDataProductTransaksiWhereIdTransaksi({required String tokenTransaksi}) async{
    final db = await SqlProductsTransaksiTabel.db();
    return await db.rawDelete("DELETE FROM productsTransaksi WHERE tokenTransaksi = '$tokenTransaksi'");
  }

  @override
  Future<int> DeleteDataProductTransaksiWhereIdProduct({required String tokenProduct}) async{
    final db = await SqlProductsTransaksiTabel.db();
    return await db.rawDelete("DELETE FROM productsTransaksi WHERE tokenProduct = '$tokenProduct'");
  }
  
  @override
  Future<int> UpdateDataProductTransaksiLocal({
    required String tokenTransaksi,
    required String status,
  }) async{
    final db = await SqlProductsTransaksiTabel.db();
    return await db.rawUpdate("UPDATE productsTransaksi SET status='$status' WHERE tokenTransaksi='$tokenTransaksi'");
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