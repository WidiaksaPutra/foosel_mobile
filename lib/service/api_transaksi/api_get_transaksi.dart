import 'dart:convert';
import 'package:foosel/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:foosel/interface/interface_local/service/interface_get_transaksi.dart';
import 'package:foosel/model/transaction.dart';
import 'package:foosel/service/api_konstanta.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class apiGetTransaksi with defaultSharedPref implements interfaceGetTransaksi{
  late List dataListTransaksi = [];
  late String tokens;

  @override
  GetTransaksi({
    bool testing = false,
    String testingToken = "",
    String email = "", transactionsId = "",
  }) async {
    try {
      if(testing == false){
        await sharedPref();
        tokens = prefs.getString('token').toString();
      }else{
        (testingToken == "") ? tokens = 'null' : tokens = testingToken;
      }
      Map<String, dynamic> decodeTokenUser = await JwtDecoder.decode(tokens);
      String role = decodeTokenUser['roles'].toString();
      Map<String, String> headers = {
        'Authorization': 'Bearer $tokens',
        'Content-Type': 'application/json; charset=UTF-8',
      };
      await (role == "PENJUAL")
      ? RolePenjual(
          email: email,
          transactionsId: transactionsId,
          headers: headers,
        )
      : RolePembeli(
          email: email,
          transactionsId: transactionsId,
          headers: headers,
        );
      return await (testing == false) ? dataListTransaksi : "berhasil";
    }catch (e) {
      throw Exception('data error');
    }
  }

  RolePenjual({
    bool testing = false,
    String email = "", transactionsId = "",
    required Map<String, String>? headers
  }) async {
    late Map<String, String> parameterApi = {};
    if(email != ""){
      parameterApi = {
        'email_penjual' : email,
      };
    }else{
      parameterApi = {
        'transactions_id' : transactionsId,
      };
    }
    await GetDataTransaksi(
      headers: headers, 
      link: 'fetchTransaksiPenjual', 
      parameterApi: parameterApi
    );
    return await (testing == false) ? dataListTransaksi : "berhasil";
  }

  RolePembeli({
    bool testing = false,
    String email = "", transactionsId = "",
    required Map<String, String>? headers
  }) async {
    late Map<String, String> parameterApi = {};
    if(email != ""){
      parameterApi = {
        'email_pembeli' : email,
      };
    }else{
      parameterApi = {
        'transactions_id' : transactionsId,
      };
    }
    await GetDataTransaksi(
      headers: headers, 
      link: 'fetchTransaksiPembeli', 
      parameterApi: parameterApi
    );
    await (testing == false) ? dataListTransaksi : "berhasil";
  }

  GetDataTransaksi({
    bool testing = false,
    required Map<String, dynamic> parameterApi,
    required Map<String, String>? headers,
    required String link,
  }) async {
    String? parameterString = await Uri(queryParameters: parameterApi).query;
    final responseTransaksi = await Api.client.get(
      Uri.parse('${Api.baseURL}/$link?' + parameterString),
      headers: headers,
    ).timeout(const Duration(seconds: 10));
    if(responseTransaksi.statusCode == 200){
      final parse = await json.decode(responseTransaksi.body);
      Transaksi transaksiDataModel = await Transaksi.fromJson(parse);
      dataListTransaksi.clear();
      dataListTransaksi.addAll(transaksiDataModel.data.toList());
    }else{
      throw Exception('data gagal');
    }
    return await (testing == false) ? dataListTransaksi : "berhasil";
  }
}