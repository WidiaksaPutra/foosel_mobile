import 'dart:convert';
import 'package:foosel/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:foosel/interface/interface_local/service/interface_get_logout.dart';
import 'package:foosel/model/logout.dart';
import 'package:foosel/service/api_konstanta.dart';

class apiLogout with defaultSharedPref implements interfaceGetLogout{
  late String tokens;

  @override
  GetLogout({
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