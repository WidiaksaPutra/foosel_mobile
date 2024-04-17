import 'dart:convert';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/service/api_logout/interface_get_logout.dart';
import 'package:foosel/model/logout.dart';
import 'package:foosel/service/api_konstanta.dart';

class ApiLogout with SharedPref implements InterfaceGetLogout{
  late String tokens;

  @override
  Future getLogout({
    bool testing = false,
    String testingToken = "",
  }) async {
    try {
      if(testing == false){
        await sharedPref();
        tokens = prefs.getString('token').toString();
      }else{
        (testingToken == "") ? tokens = 'null' : tokens = testingToken;
      }
      final responseLogout = await Api.client.post(Uri.parse('${Api.baseURL}/logout'),
        headers: <String, String>{
          'Authorization': 'Bearer $tokens',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{'unit_test': testing.toString()}),
      ).timeout(const Duration(seconds: 10));
      if(responseLogout.statusCode == 200){
        final jsonData = responseLogout.body;
        final logoutResponse = logoutUserFromJson(jsonData);
        return (logoutResponse.meta!.status == 'success') ? "berhasil" : "gagal";
      }else{
        return "gagal";
      }
    } catch (e) {
      return "error";
    }
  }
}