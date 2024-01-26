import 'dart:convert';

import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_delete_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_konstanta.dart';

class apiDeleteTransaksi implements interfaceDeleteTransaksi{
  late bool loading = true;

  @override
  DeleteTransaksi({required String transactionsId}) async{
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final responseTransaksi = await Api.client.delete(Uri.parse('${Api.baseURL}/deleteTransaksi?'),
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'transactions_id': transactionsId,
        }),
      );
      if(responseTransaksi.statusCode == 200){  
        loading = false;     
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
    return loading;
  }
}