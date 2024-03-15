import 'dart:convert';
import 'package:foosel/interface/interface_local/service/interface_delete_transaksi.dart';
import 'package:foosel/service/api_konstanta.dart';

class apiDeleteTransaksi implements interfaceDeleteTransaksi{
  late bool loadingTransaksi = true;
  
  @override
  DeleteTransaksi({
    bool testing = false,
    String transactionsId = "-",
    String productsId = "-",
  }) async{
    try {
      final responseTransaksi = await Api.client.delete(Uri.parse('${Api.baseURL}/deleteTransaksi?'),
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: (transactionsId != "-")
        ? jsonEncode(<String, String>{
            'unit_test': testing.toString(),
            'transactions_id': transactionsId,
          })
        : (productsId != "-")
        ? jsonEncode(<String, String>{
            'unit_test': testing.toString(),
            'products_id': productsId,
          })
        : {},
      ).timeout(const Duration(seconds: 10));
      if(responseTransaksi.statusCode == 200){  
        loadingTransaksi = false;     
        return "berhasil";
      }else{
        return "gagal";
      }
    } catch (e) {
      return "error";
    }
  }

  @override
  bool LoadingDeleteDataTransaksi() {
    return loadingTransaksi;
  }
}