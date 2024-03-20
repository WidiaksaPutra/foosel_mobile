import 'package:foosel/helpers/transaksi/sql/sql_transaksi_tabel.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_delete_data_transaksi_local.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_get_data_transaksi_local.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_insert_data_transaksi_local.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_update_data_transaksi_local.dart';

class HelperTransaksi implements 
  InterfaceGetDataTransaksiLocal, 
  InterfaceDeleteDataTransaksiLocal, 
  InterfaceInsertDataTransaksiLocal, 
  InterfaceUpdateDataTransaksiLocal{
  @override
  Future<List<Map<String, dynamic>>> getDataTransaksiLocal() async {
    final dbGet = await SqlTransaksiTabel.db();
    return await dbGet.query('transaksi');
  }

  @override
  Future<List<Map<String, dynamic>>> getDataTransaksiWhereIdLocal({required String tokenId}) async{
    final dbGet = await SqlTransaksiTabel.db();
    return await dbGet.query('transaksi', where: "tokenId = '$tokenId'");
  }

  @override
  Future<int> deleteDataTransaksiLocal() async{
    final db = await SqlTransaksiTabel.db();
    return await db.delete('transaksi');
  }

  @override
  Future<int> deleteDataTransaksiLocalWhereId({required String tokenId}) async{
    final db = await SqlTransaksiTabel.db();
    return await db.delete('transaksi', where: "tokenId = '$tokenId'");
  }
  
  @override
  Future<int> updateDataTransaksiLocal({
    required String tokenId,
    required String hargaTotal,
    required int jumlah,
  }) async {
     final db = await SqlTransaksiTabel.db();
    return await db.rawUpdate("UPDATE transaksi SET hargaTotal='$hargaTotal',jumlah='$jumlah' WHERE tokenId='$tokenId'");
  }

  @override
  Future<int> insertDataTransaksiLocal({
    required String tokenId,
    required String emailPenjual,
    required String emailPembeli,
    required String idCategory,
    required String name, 
    required String description, 
    required String nameCategory,
    required String hargaSatuan,
    required String hargaTotal, 
    required int jumlah,
    required String imagePath,
  }) async {
    final db = await SqlTransaksiTabel.db();
    final dataInsert = {
      'tokenId': tokenId,
      'emailPenjual': emailPenjual,
      'emailPembeli': emailPembeli,
      'idCategory': idCategory,
      'name': name,
      'description': description, 
      'nameCategory': nameCategory, 
      'hargaSatuan': hargaSatuan,
      'hargaTotal': hargaTotal,
      'jumlah': jumlah,
      'imagePath': imagePath
    };
    return await db.insert('transaksi', dataInsert);
  }
}