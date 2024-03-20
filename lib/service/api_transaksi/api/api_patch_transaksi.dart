import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/service/api_transaksi/interfaces/interface_patch_transaksi.dart';
import 'package:foosel/service/api_konstanta.dart';
import 'dart:convert';

class ApiPatchTransaksi with SharedPref implements InterfacePatchTransaksi{
  late String tokens;

  @override
  patchTransaksi({
    bool testing = false,
    String testingToken = "",
    required String transactionsId,
    required String status,
  }) async{
    try {
      if(testing == false){
        await sharedPref();
        tokens = prefs.getString('token').toString();
      }else{
        tokens = testingToken;
      }
      final responseTransaksi = await Api.client.patch(Uri.parse('${Api.baseURL}/updateTransaction?'),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer $tokens',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'unit_test': testing.toString(),
          'transactions_id': transactionsId,
          'status': status,
        }),
      ).timeout(const Duration(seconds: 10));
      return await (responseTransaksi.statusCode == 200) ? "berhasil" : "gagal";
    } catch (e) {
      return "error";
    }
  }
}