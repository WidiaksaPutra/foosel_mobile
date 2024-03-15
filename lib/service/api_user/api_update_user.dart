import 'dart:convert';
import 'package:foosel/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:foosel/interface/interface_local/service/interface_update_user.dart';
import 'package:foosel/service/api_konstanta.dart';

class apiUpdateUser with defaultSharedPref implements interfaceUpdateUser{
  late bool loadingApi = false;
  late String? tokens;

  @override
  UpdateUser({
    bool testing = false,
    required String name, 
    required String email, 
    required String username,
    required String alamat,
  }) async {
    try{
      if(testing == false){
        await sharedPref();
        tokens = await prefs.getString("token")!;
      } 
      final responseUser = await Api.client.patch(
        Uri.parse('${Api.baseURL}/updateProfile'),
        headers: <String, String>{
          'Content-type': 'application/json',
          'Authorization': (testing == false) ? 'Bearer $tokens' : '',
        },
        body: (name != "" && email != "" && username != "" && alamat != "")
        ? jsonEncode(<String, String>{
            'unit_test': testing.toString(),
            'name': name,
            "email": email,
            "username": username,
            "alamat": alamat,
          })
        
        : (name == "" && email != "" && username != "" && alamat != "")
        ? jsonEncode(<String, String>{
            'unit_test': testing.toString(),
            "email": email,
            "username": username,
            "alamat": alamat,
          })
        : (name == "" && email == "" && username != "" && alamat != "")
        ? jsonEncode(<String, String>{
            'unit_test': testing.toString(),
            "username": username,
            "alamat": alamat,
          })
        : (name == "" && email == "" && username != "" && alamat == "")
        ? jsonEncode(<String, String>{
            'unit_test': testing.toString(),
            "username": username,
          })
        
        : (name != "" && email == "" && username != "" && alamat != "")
        ? jsonEncode(<String, String>{
            'unit_test': testing.toString(),
            'name': name,
            "username": username,
            "alamat": alamat,
          })
        : (name != "" && email == "" && username == "" && alamat != "")
        ? jsonEncode(<String, String>{
            'unit_test': testing.toString(),
            'name': name,
            "alamat": alamat,
          })
        : (name != "" && email == "" && username == "" && alamat == "")
        ? jsonEncode(<String, String>{
            'unit_test': testing.toString(),
            'name': name,
          })
        
        : (name != "" && email != "" && username == "" && alamat != "")
        ? jsonEncode(<String, String>{
            'unit_test': testing.toString(),
            'name': name,
            "email": email,
            "alamat": alamat,
          })
        : (name == "" && email != "" && username == "" && alamat != "")
        ? jsonEncode(<String, String>{
            'unit_test': testing.toString(),
            "email": email,
            "alamat": alamat,
          })
        : (name == "" && email != "" && username == "" && alamat == "")
        ? jsonEncode(<String, String>{
            'unit_test': testing.toString(),
            "email": email,
          })
        
        : (name != "" && email != "" && username != "" && alamat == "")
        ? jsonEncode(<String, String>{
            'unit_test': testing.toString(),
            'name': name,
            "email": email,
            "username": username,
          })
        : (name != "" && email != "" && username == "" && alamat == "")
        ? jsonEncode(<String, String>{
            'unit_test': testing.toString(),
            'name': name,
            "email": email,
          })
        : (name != "" && email == "" && username != "" && alamat == "")
        ? jsonEncode(<String, String>{
            'unit_test': testing.toString(),
            'name': name,
            "username": username,
          })

        : (name == "" && email == "" && username == "" && alamat != "")
        ? jsonEncode(<String, String>{
            'unit_test': testing.toString(),
            "alamat": alamat,
          })
        : ({})
      ).timeout(const Duration(seconds: 10));
      if((testing == false)
        ? responseUser.statusCode == 200
        : responseUser.statusCode == 302){
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