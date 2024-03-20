// ignore_for_file: unused_local_variable
import 'package:foosel/service/api_login/interface_get_login.dart';
import 'package:foosel/service/api_login/injection_login.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../default_test/data_dummy_test.dart';

void main(){
  test("Unit Test Service Login", () async{
    setupDInjectionLogin();
    final InterfaceGetLogin dataGetLogin = await getItInstance<InterfaceGetLogin>();
    final respons = await dataGetLogin.getLogin(testing: true, email: emailPembeli, password: passwordPembeli);
    expect(respons, equals("berhasil"));
  });
}