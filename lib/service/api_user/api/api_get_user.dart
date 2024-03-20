import 'dart:convert';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/model/user.dart';
import 'package:foosel/service/api_konstanta.dart';
import 'package:foosel/service/api_user/interfaces/interface_get_user.dart';

class ApiGetUser with SharedPref implements InterfaceGetUser{
  late bool loadingApi = false;
  late String? tokens;
  late dynamic dataUser = "-";

  @override
  getUser({bool testing = false}) async {
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