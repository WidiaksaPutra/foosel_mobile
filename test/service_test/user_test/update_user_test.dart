import 'package:foosel/service/api_user/injection_user.dart';
import 'package:foosel/service/api_user/interfaces/interface_update_user.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../default_test/data_dummy_test.dart';

void main(){
  test("Unit Test Service Update User", () async{
    setupDInjectionUser();
    final InterfaceUpdateUser dataUpdateUser = await getItInstance<InterfaceUpdateUser>();
    final statusUpdate = await dataUpdateUser.updateUser(testing: true, email: randomEmail, name: randomText, username: randomText, alamat: randomText);
    expect(statusUpdate, equals("berhasil"));
  });
}


