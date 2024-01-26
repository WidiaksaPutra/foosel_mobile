import 'package:flutter_laravel_toko_sepatu/helpers/transaksi/sql_transaksi_tabel.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_delete_data_transaksi_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_get_data_transaksi_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_insert_data_transaksi_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_update_data_transaksi_local.dart';

class helperTransaksi implements interfaceGetDataTransaksiLocal, interfaceDeleteDataTransaksiLocal, interfaceInsertDataTransaksiLocal, interfaceUpdateDataTransaksiLocal{  
  
  @override
  Future<List<Map<String, dynamic>>> GetDataTransaksiLocal() async {
    final dbGet = await SqlTransaksiTabel.db();
    return await dbGet.query('transaksi');
  }

  @override
  Future<List<Map<String, dynamic>>> GetDataTransaksiWhereIdLocal({required String tokenId}) async{
    final dbGet = await SqlTransaksiTabel.db();
    return await dbGet.query('transaksi', where: "tokenId = '$tokenId'");
  }

  @override
  Future<int> DeleteDataTransaksiLocal() async{
    final db = await SqlTransaksiTabel.db();
    return await db.delete('transaksi');
  }

  @override
  Future<int> DeleteDataTransaksiLocalWhereId({required String tokenId}) async{
    final db = await SqlTransaksiTabel.db();
    return await db.delete('transaksi', where: "tokenId = '$tokenId'");
  }
  
  @override
  Future<int> UpdateDataTransaksiLocal({
    required String tokenId,
    required String hargaTotal,
    required int jumlah,
  }) async {
    final db = await SqlTransaksiTabel.db();
    return await db.rawUpdate("UPDATE transaksi SET hargaTotal='$hargaTotal',jumlah='$jumlah' WHERE tokenId='$tokenId'");
  }

  @override
  Future<int> InsertDataTransaksiLocal({
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