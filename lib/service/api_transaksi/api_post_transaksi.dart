import 'package:foosel/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:foosel/interface/interface_local/service/interface_post_transaksi.dart';
import 'package:foosel/service/api_konstanta.dart';
import 'dart:convert';

class apiPostTransaksi with defaultSharedPref implements interfacePostTransaksi{
  late String tokens;

  @override
  PostTransaksi({
    bool testing = false,
    String testingToken = "",
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
      if(testing == false){
        await sharedPref();
        tokens = prefs.getString('token').toString();
      }else{
        tokens = testingToken;
      }
      final responseTransaksi = await Api.client.post(Uri.parse('${Api.baseURL}/insertTransaksi?'),
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
          'unit_test': testing.toString(),
        }),
      ).timeout(const Duration(seconds: 10));       
      return (responseTransaksi.statusCode == 200) ? "berhasil" : "gagal";
    } catch (e) {
      return "error";
    }
  }
}