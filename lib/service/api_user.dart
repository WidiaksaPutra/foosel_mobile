import 'dart:convert';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_get_user.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_update_user.dart';
import 'package:flutter_laravel_toko_sepatu/model/user.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_konstanta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class apiUser implements interfaceGetUser, interfaceUpdateUser{
  late bool loadingApi = false;
  late String? tokens;
  late dynamic dataUser = "-";

  @override
  GetUser() async {
    try{
      final token = await SharedPreferences.getInstance();
      tokens = token.getString("token")!;
      final responseUser = 
        await Api.client.get(Uri.parse('${Api.baseURL}/fetchProfil'),
        headers: {
          'Content-type': 'application/json',
          'Authorization': 'Bearer $tokens'
        }
      );
      if(responseUser.statusCode == 200){
        final parse = await jsonDecode(responseUser.body);
        Profil userDataModel = Profil.fromJson(parse);
        loadingApi = true;
        dataUser = userDataModel.data;
        return dataUser;
      }else{
        throw Exception('data gagal');
      }
    } catch (e) {
      throw Exception('data error');
    }
  }
  
  @override
  UpdateUser({
    required String name, 
    required String email, 
    required String username,
    required String alamat,
  }) async {
    try{
      // print("test email update $email");
      await Future.delayed(const Duration(milliseconds: 500));
      SharedPreferences token = await SharedPreferences.getInstance();
      tokens = token.getString("token")!;
      final responseUser = await Api.client.patch(
        Uri.parse('${Api.baseURL}/updateProfile'),
        headers: <String, String>{
          'Content-type': 'application/json',
          'Authorization': 'Bearer $tokens',
        },
        body: (name != "" && email != "" && username != "" && alamat != "")
        ? jsonEncode(<String, String>{
            'name': name,
            "email": email,
            "username": username,
            "alamat": alamat,
          })
        
        : (name == "" && email != "" && username != "" && alamat != "")
        ? jsonEncode(<String, String>{
            "email": email,
            "username": username,
            "alamat": alamat,
          })
        : (name == "" && email == "" && username != "" && alamat != "")
        ? jsonEncode(<String, String>{
            "username": username,
            "alamat": alamat,
          })
        : (name == "" && email == "" && username != "" && alamat == "")
        ? jsonEncode(<String, String>{
            "username": username,
          })
        
        : (name != "" && email == "" && username != "" && alamat != "")
        ? jsonEncode(<String, String>{
            'name': name,
            "username": username,
            "alamat": alamat,
          })
        : (name != "" && email == "" && username == "" && alamat != "")
        ? jsonEncode(<String, String>{
            'name': name,
            "alamat": alamat,
          })
        : (name != "" && email == "" && username == "" && alamat == "")
        ? jsonEncode(<String, String>{
            'name': name,
          })
        
        : (name != "" && email != "" && username == "" && alamat != "")
        ? jsonEncode(<String, String>{
            'name': name,
            "email": email,
            "alamat": alamat,
          })
        : (name == "" && email != "" && username == "" && alamat != "")
        ? jsonEncode(<String, String>{
            "email": email,
            "alamat": alamat,
          })
        : (name == "" && email != "" && username == "" && alamat == "")
        ? jsonEncode(<String, String>{
            "email": email,
          })
        
        : (name != "" && email != "" && username != "" && alamat == "")
        ? jsonEncode(<String, String>{
            'name': name,
            "email": email,
            "username": username,
          })
        : (name != "" && email != "" && username == "" && alamat == "")
        ? jsonEncode(<String, String>{
            'name': name,
            "email": email,
          })
        : (name != "" && email == "" && username != "" && alamat == "")
        ? jsonEncode(<String, String>{
            'name': name,
            "username": username,
          })

        : (name == "" && email == "" && username == "" && alamat != "")
        ? jsonEncode(<String, String>{
            "alamat": alamat,
          })
        : ({})
      );
      if(responseUser.statusCode == 200){
        loadingApi = true;
        return "berhasil";
      }else{
        return "gagal";
      }
    } catch (e) {
      return "error";
    }
  }
}