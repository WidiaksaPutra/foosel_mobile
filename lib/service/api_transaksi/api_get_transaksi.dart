import 'dart:convert';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_get_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/model/transaction.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_konstanta.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class apiGetTransaksi implements interfaceGetTransaksi{
  late List dataListTransaksi = [];
  
  @override
  GetTransaksi({required String email}) async {
    try {
      final tokenUser = await SharedPreferences.getInstance();
      String tokens = tokenUser.getString('token').toString();
      Map<String, dynamic> decodeTokenUser = await JwtDecoder.decode(tokens);
      String role = decodeTokenUser['roles'].toString();
      Map<String, String> headers = {
        'Authorization': 'Bearer $tokens',
        'Content-Type': 'application/json; charset=UTF-8',
      };
      if(role == "PENJUAL"){
        await RolePenjual(
          email: email,
          headers: headers,
        );
      }else{
        await RolePembeli(
          email: email,
          headers: headers,
        );
      }  
      return await dataListTransaksi;
    }catch (e) {
      throw Exception('data error');
    }
  }

  RolePenjual({
    required String email,
    required Map<String, String>? headers
  }) async {
    Map<String, String> parameterApi = {
      'email_penjual' : email,
    };
    await GetDataTransaksi(
      headers: headers, 
      link: 'fetchTransaksiPenjual', 
      parameterApi: parameterApi
    );
    return dataListTransaksi;
  }

  RolePembeli({
    required String email,
    required Map<String, String>? headers
  }) async {
    Map<String, String> parameterApi = {
      'email_pembeli' : email,
    };
    await GetDataTransaksi(
      headers: headers, 
      link: 'fetchTransaksiPembeli', 
      parameterApi: parameterApi
    );
    return await dataListTransaksi;
  }

  GetDataTransaksi({
    required Map<String, dynamic> parameterApi,
    required Map<String, String>? headers,
    required String link,
  }) async {
    String? parameterString = await Uri(queryParameters: parameterApi).query;
    final responseTransaksi = await Api.client.get(
      Uri.parse('${Api.baseURL}/$link?' + parameterString),
      headers: headers,
    );
    if(responseTransaksi.statusCode == 200){
      final parse = await json.decode(responseTransaksi.body);
      Transaksi transaksiDataModel = await Transaksi.fromJson(parse);
      dataListTransaksi.clear();
      dataListTransaksi.addAll(transaksiDataModel.data!.data.toList());
    }else{
      throw Exception('data gagal');
    }
    return await dataListTransaksi;
  }
}