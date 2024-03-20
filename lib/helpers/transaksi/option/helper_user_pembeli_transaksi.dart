// import 'package:foosel/helpers/transaksi/sql_transaksi_product_tabel.dart';
// import 'package:foosel/interface/interface_local/helpers/interface_delete_data_product_transaksi_storage_local.dart';
// import 'package:foosel/interface/interface_local/helpers/interface_get_data_product_transaksi_storage_local.dart';
// import 'package:foosel/interface/interface_local/helpers/interface_insert_product_transaksi_local.dart';
// import 'package:foosel/interface/interface_local/helpers/interface_update_data_product_transaksi_local.dart';

// class helperUserPembeliTransaksi implements interfaceInsertUserPembeliTransaksiLocal, InterfaceInsertDataProductTransaksiLocal, InterfaceDeleteDataProductTransaksiStorageLocal{
//   @override 
//   Future<int> InsertDataLocal({
//     required String tokenTransaksi,
//     required String tokenProduct, 
//     required String name, 
//     required String description, 
//     required String nameCategory, 
//     required String price,
//     required String status,
//     required String imagePath
//   }) async {
//     final db = await SqlUserPembeliTabel.db();
//     final dataInsert = {
//       'tokenTransaksi': tokenTransaksi,
//       'tokenProduct': tokenProduct, 
//       'name': name,
//       'description': description, 
//       'nameCategory': nameCategory, 
//       'price': price,
//       'status': status,
//       'imagePath': imagePath
//     };
//     return await db.insert('productsTransaksi', dataInsert);
//   }
  
//   @override
//   Future<List<Map<String, dynamic>>> GetDataProductTransaksiLocal() async{
//     final dbGet = await SqlUserPembeliTabel.db();
//     // print("test get ${await dbGet.query('productsTransaksi')}");
//     return await dbGet.query('productsTransaksi');
//   }
  
//   @override
//   Future<List<Map<String, dynamic>>> GetDataProductTransaksiWhereIdLocal({required String tokenTransaksi}) async {
//     final dbGet = await SqlUserPembeliTabel.db();
//     return await dbGet.query('productsTransaksi', where: "tokenTransaksi = $tokenTransaksi");
//   }

//   @override
//   Future<int> DeleteDataProductTransaksiLocal() async{
//     final db = await SqlUserPembeliTabel.db();
//     return await db.delete('productsTransaksi');
//   }
  
//   @override
//   Future<int> DeleteDataProductTransaksiWhereIdTransaksi({required String tokenTransaksi}) async{
//     final db = await SqlUserPembeliTabel.db();
//     return await db.rawDelete("DELETE FROM productsTransaksi WHERE tokenTransaksi = '$tokenTransaksi'");
//   }

//   @override
//   Future<int> DeleteDataProductTransaksiWhereIdProduct({required String tokenProduct}) async{
//     final db = await SqlUserPembeliTabel.db();
//     return await db.rawDelete("DELETE FROM productsTransaksi WHERE tokenProduct = '$tokenProduct'");
//   }
  
//   @override
//   Future<int> UpdateDataProductTransaksiLocal({
//     required String tokenTransaksi,
//     required String status,
//   }) async{
//     final db = await SqlUserPembeliTabel.db();
//     return await db.rawUpdate("UPDATE productsTransaksi SET status='$status' WHERE tokenTransaksi='$tokenTransaksi'");
//   }
// }