import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_get_logout.dart';
import 'package:flutter_laravel_toko_sepatu/model/logout.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_konstanta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class apiLogout implements interfaceGetLogout{
  late String statusLogout;
  
  @override
  GetLogout() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tokens = prefs.getString("token")!;
      final responseLogout = await Api.client.post(Uri.parse('${Api.baseURL}/logout'),
        headers: <String, String>{
          'Authorization': 'Bearer $tokens',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if(responseLogout.statusCode == 200){
        final jsonData = responseLogout.body;
        final logoutResponse = logoutUserFromJson(jsonData);
        if(logoutResponse.meta!.status == 'success'){
          return statusLogout = "berhasil";
        }else{
          return statusLogout = "gagal";
        }
      }else{
        return statusLogout = "gagal";
      }
    } catch (e) {
      return statusLogout = "error";
    }
  }
}