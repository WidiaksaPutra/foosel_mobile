import 'dart:convert';
import 'package:foosel/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:foosel/interface/interface_local/service/interface_get_user.dart';
import 'package:foosel/model/user.dart';
import 'package:foosel/service/api_konstanta.dart';

class apiGetUser with defaultSharedPref implements interfaceGetUser{
  late bool loadingApi = false;
  late String? tokens;
  late dynamic dataUser = "-";

  @override
  GetUser({bool testing = false}) async {
    try{
      if(testing == false){
        await sharedPref();
        tokens = await prefs.getString("token")!;
      } 
      final responseUser = await Api.client.get(Uri.parse('${Api.baseURL}/fetchProfil'),
        headers: {
          'Content-type': 'application/json',
          'Authorization': (testing == false) ? 'Bearer $tokens' : '',
        }
      ).timeout(const Duration(seconds: 10));
      if(responseUser.statusCode == 200){
        if(testing == false){
          final parse = await jsonDecode(responseUser.body);
          Profil userDataModel = Profil.fromJson(parse);
          loadingApi = true;
          dataUser = userDataModel.data;
        }
        return await dataUser;
      }else{
        throw Exception('data gagal');
      }
    } catch (e) {
      throw Exception('data error');
    }
  }
}