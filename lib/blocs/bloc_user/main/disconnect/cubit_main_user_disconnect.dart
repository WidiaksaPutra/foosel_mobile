import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_user/state_user.dart';
import 'package:foosel/helpers/user/interfaces/interface_get_data_user_local.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class CubitMainUserDisconnect extends Cubit<DataStateUser>{
  final InterfaceGetDataUserLocal _dataGetUserLocal = getItInstance<InterfaceGetDataUserLocal>();
  CubitMainUserDisconnect() : super(DataUser(true, {}));
  fetchUser() async{
    final _dataLocal = await _dataGetUserLocal.getDataUser();
    Map<String, dynamic> _dataGetLocal = {
      'nama' : _dataLocal[0]["name"].toString(),
      'username' : _dataLocal[0]["username"].toString(),
      'email' : _dataLocal[0]["email"].toString(),
    };
    emit(DataUser(true, _dataGetLocal));
  }
}