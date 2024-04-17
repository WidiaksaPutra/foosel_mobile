import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin RoleAcces{
  late String tokens, role;
  Future<void> rolesUser() async{
    final _tokenUser = await SharedPreferences.getInstance();
    tokens = _tokenUser.getString('token').toString();
    Map<String, dynamic> decodeTokenUser = JwtDecoder.decode(tokens);
    role = decodeTokenUser['roles'].toString();
  }
}