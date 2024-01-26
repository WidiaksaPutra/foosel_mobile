import 'dart:convert';

import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_get_login.dart';
import 'package:flutter_laravel_toko_sepatu/model/login.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_konstanta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class apiLogin implements interfaceGetLogin{
  
  @override
  GetLogin({
    required String email, 
    required String password
  }) async {
    try {
      final responseLogin = await Api.client.post(Uri.parse('${Api.baseURL}/login?'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{'email': email, 'password': password}),
      );
      if(responseLogin.statusCode == 200){
        final jsonData = responseLogin.body;
        final loginResponse = loginUserFromJson(jsonData);
        if(loginResponse.meta!.message == 'data ditemukan'){
          final token = await SharedPreferences.getInstance();
          token.setString("token", loginResponse.data!.authToken.toString());
          return "berhasil";
        }else{
          return "gagal";
        }
      }else{
        return "gagal";
      }
    } catch (e) {
      return "error";
    }
  }
}