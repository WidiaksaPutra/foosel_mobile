import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_user/state_user.dart';
import 'package:foosel/helpers/user/interfaces/interface_get_data_user_local.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class CubitMainUserDisconnect extends Cubit<DataStateUser>{
  final InterfaceGetDataUserLocal dataGetUserLocal = getItInstance<InterfaceGetDataUserLocal>();
  CubitMainUserDisconnect() : super(DataUser(true, {}));
  fetchUser() async{
    final dataLocal = await dataGetUserLocal.getDataUser();
    Map<String, dynamic> dataGetLocal = {
      'nama' : dataLocal[0]["name"].toString(),
      'username' : dataLocal[0]["username"].toString(),
      'email' : dataLocal[0]["email"].toString(),
    };
    emit(DataUser(true, dataGetLocal));
  }
}