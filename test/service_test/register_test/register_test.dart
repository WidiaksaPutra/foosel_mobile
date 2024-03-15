// ignore_for_file: unused_local_variable
import 'package:foosel/interface/interface_local/service/interface_post_register.dart';
import 'package:foosel/service/api_register/injection_register.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../default_test/data_dummy_test.dart';

void main(){
  test("Unit Test Service Register", () async{
    setupDInjectionRegister();
    final interfacePostRegister dataPostRegister = await getItInstance<interfacePostRegister>();
    final respons = await dataPostRegister.PostRegister(
      testing: true,
      email: randomEmail, 
      alamat: randomText,
      password: randomText, 
      name: randomText, 
      username: randomText, 
      roles: randomText, 
      gambarUser: "https://ui-avatars.com/api/?name=A&color=FFFFFF&background=000000",
    );
    expect(respons, equals("berhasil"));
  });
}