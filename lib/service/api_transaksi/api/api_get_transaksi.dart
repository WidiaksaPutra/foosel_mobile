import 'dart:convert';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/service/api_transaksi/interfaces/interface_get_transaksi.dart';
import 'package:foosel/model/transaction.dart';
import 'package:foosel/service/api_konstanta.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class ApiGetTransaksi with SharedPref implements InterfaceGetTransaksi{
  late List dataListTransaksi = [];
  late String tokens;

  @override
  Future getTransaksi({
    bool testing = false,
    String testingToken = "",
    String email = "", transactionsId = "",
  }) async{
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
      ? await rolePenjual(
          email: email,
          transactionsId: transactionsId,
          headers: headers,
        )
      : await rolePembeli(
          email: email,
          transactionsId: transactionsId,
          headers: headers,
        );
      return await (testing == false) ? dataListTransaksi : "berhasil";
    }catch (e) {
      throw Exception('data error');
    }
  }

  Future rolePenjual({
    bool testing = false,
    String email = "", transactionsId = "",
    required Map<String, String>? headers
  }) async{
    try{
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
      await getDataTransaksi(
        headers: headers, 
        link: 'fetchTransaksiPenjual', 
        parameterApi: parameterApi
      );
      return await (testing == false) ? dataListTransaksi : "berhasil";
    }catch (e) {
      throw Exception('data error');
    }
  }

  Future rolePembeli({
    bool testing = false,
    String email = "", transactionsId = "",
    required Map<String, String>? headers
  }) async{
    try{
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
      await getDataTransaksi(
        headers: headers, 
        link: 'fetchTransaksiPembeli', 
        parameterApi: parameterApi
      );
      return await (testing == false) ? dataListTransaksi : "berhasil";
    }catch (e) {
      throw Exception('data error');
    }
  }

  Future getDataTransaksi({
    bool testing = false,
    required Map<String, dynamic> parameterApi,
    required Map<String, String>? headers,
    required String link,
  }) async{
    try{
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
    }catch (e) {
      throw Exception('data error');
    }
  }
}