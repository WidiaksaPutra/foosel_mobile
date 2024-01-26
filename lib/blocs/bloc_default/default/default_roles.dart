import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin roleAcces{
  late String tokens, role;
  rolesUser() async{
    final tokenUser = await SharedPreferences.getInstance();
    tokens = tokenUser.getString('token').toString();
    Map<String, dynamic> decodeTokenUser = JwtDecoder.decode(tokens);
    role = decodeTokenUser['roles'].toString();
  }
}