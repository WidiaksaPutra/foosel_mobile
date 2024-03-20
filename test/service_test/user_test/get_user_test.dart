import 'package:foosel/service/api_user/injection_user.dart';
import 'package:foosel/service/api_user/interfaces/interface_get_user.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:flutter_test/flutter_test.dart';
void main(){
  test("Unit Test Service Get User", () async{
    setupDInjectionUser();
    final InterfaceGetUser dataGetUser = await getItInstance<InterfaceGetUser>();
    final data = await dataGetUser.getUser(testing: true);
    expect(data, equals("-"));
  });
}


