import 'dart:convert';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/service/api_register/interface_post_register.dart';
import 'package:foosel/model/register.dart';
import 'package:foosel/service/api_konstanta.dart';

class ApiRegister with SharedPref implements InterfacePostRegister{

  @override
  Future postRegister({
    bool testing = false,
    required String name, 
    required String username, 
    required String alamat, 
    required String email, 
    required String password, 
    required String gambarUser, 
    required String roles,
  }) async{
    try {
      print("test alamat $alamat");
      final responseRegister = await Api.client.post(Uri.parse('${Api.baseURL}/register?'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'unit_test': testing.toString(),
          'name': name ,
          'username': username,
          'alamat': alamat,
          'email': email,
          'password': password,
          'profile_photo_path': gambarUser,
          'roles': roles,
        }),
      ).timeout(const Duration(seconds: 10));
      if(responseRegister.statusCode == 200){
        if(testing == false){
          final jsonData = await responseRegister.body;
          await registerUserFromJson(jsonData);
          final registerResponse = await registerUserFromJson(jsonData);
          if(registerResponse.meta!.message == 'data berhasil dipanggil'){
            await sharedPref();
            await prefs.setString("token", registerResponse.data!.accessToken.toString());
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