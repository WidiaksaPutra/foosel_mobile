// ignore_for_file: override_on_non_overriding_member

import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_post_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_konstanta.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class apiPostTransaksi implements interfacePostTransaksi{
  
  @override
  PostTransaksi({
    required String usersEmailPembeli,
    required String usersEmailPenjual,
    required String productsId,
    required String categoryId,
    required String total,
    required String totalPrice,
    required String shippingPrice, 
    required String quantity,
    required String status,
  }) async{
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      SharedPreferences token = await SharedPreferences.getInstance();
      late String? tokens = token.getString("token")!;
      final responseTransaksi = await Api.client.post(Uri.parse('${Api.baseURL}/transaksi?'),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer $tokens',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'users_email_pembeli': usersEmailPembeli,
          'users_email_penjual': usersEmailPenjual,
          'products_id': productsId,
          'category_id': categoryId,
          'total': total,
          'total_price': totalPrice,
          'shipping_price': shippingPrice,
          'quantity': quantity,
          'status': status, 
        }),
      );
      if(responseTransaksi.statusCode == 200){       
        return "berhasil";
      }else{
        return "gagal";
      }
    } catch (e) {
      return "error";
    }
  }
}