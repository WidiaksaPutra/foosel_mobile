import 'package:foosel/interface/interface_local/service/interface_get_logout.dart';
import 'package:foosel/service/api_logout/injection_logout.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../default_test/data_dummy_test.dart';

void main(){
  group("Unit Test Service Logout", () {
    setupDInjectionLogout();
    final interfaceGetLogout dataGetLogout = getItInstance<interfaceGetLogout>();
    test("Unit Test Service Logout Penjual", () async{
      final respons = await dataGetLogout.GetLogout(
        testing: true, 
        testingToken: tokenUserPenjual,
      );
      expect(respons, equals("berhasil"));
    });
    test("Unit Test Service Logout Pembeli", () async{
      final respons = await dataGetLogout.GetLogout(
        testing: true, 
        testingToken: tokenUserPembeli,
      );
      expect(respons, equals("berhasil"));
    });
  });
}