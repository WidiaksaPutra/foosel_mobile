import 'dart:convert';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/service/api_login/interface_get_login.dart';
import 'package:foosel/model/login.dart';
import 'package:foosel/service/api_konstanta.dart';

class ApiLogin with SharedPref implements InterfaceGetLogin{
  
  @override
  getLogin({
    bool testing = false, 
    required String email, 
    required String password
  }) async {
    try {
      final responseLogin = await Api.client.post(Uri.parse('${Api.baseURL}/login?'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{'email': email, 'password': password}),
      ).timeout(const Duration(seconds: 10));
      if(responseLogin.statusCode == 200){
        if(testing == false){
          final jsonData = responseLogin.body;
          final loginResponse = await loginUserFromJson(jsonData);
          if(loginResponse.meta!.message == 'data ditemukan'){
            await sharedPref();
            await prefs.setString("token", loginResponse.data!.authToken.toString());
            return "berhasil";
          }else{
            return "gagal";
          }
        }else{
          return "berhasil";
        }
      }else{
        return "gagal";
      }
    } catch (e) {
      return "error";
    }
  }
}