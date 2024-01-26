import 'dart:convert';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_post_register.dart';
import 'package:flutter_laravel_toko_sepatu/model/register.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_konstanta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class apiRegister implements interfacePostRegister{

  @override
  PostRegister({
    required String name, 
    required String username, 
    required String alamat, 
    required String email, 
    required String password, 
    required String gambarUser, 
    required String roles,
  }) async{
    try {
      final responseRegister = await Api.client.post(Uri.parse('${Api.baseURL}/register?'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': name ,
          'username': username,
          'alamat': alamat,
          'email': email,
          'password': password,
          'profile_photo_path': gambarUser,
          'roles': roles, 
        }),
      );
      if(responseRegister.statusCode == 200){
        final jsonData = responseRegister.body;
        final registerResponse = registerUserFromJson(jsonData);
        if(registerResponse.meta!.message == 'data berhasil dipanggil'){
          final token = await SharedPreferences.getInstance();
          token.setString("token", registerResponse.data!.accessToken.toString());
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