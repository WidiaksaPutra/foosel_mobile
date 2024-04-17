import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/blocs/bloc_user/state_user.dart';
import 'package:foosel/firebase/api_user_firebase/interfaces/interface_update_user_firebase.dart';
import 'package:foosel/helpers/user/interfaces/interface_delete_data_user_local.dart';
import 'package:foosel/helpers/user/interfaces/interface_get_data_user_local.dart';
import 'package:foosel/helpers/user/interfaces/interface_insert_data_user_local.dart';
import 'package:foosel/service/api_user/interfaces/interface_get_user.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class CubitMainUserConnect extends Cubit<DataStateUser> with SharedPref{
  final InterfaceGetUser _dataGetUser = getItInstance<InterfaceGetUser>();
  final InterfaceUpdateUserFirebase _dataUpdateUserFirebase = getItInstance<InterfaceUpdateUserFirebase>();
  final InterfaceDeleteDataUserLocal _dataDeleteUserLocal = getItInstance<InterfaceDeleteDataUserLocal>();
  final InterfaceGetDataUserLocal _dataGetUserLocal = getItInstance<InterfaceGetDataUserLocal>();
  final InterfaceInsertDataUserLocal _dataInsertUserLocal = getItInstance<InterfaceInsertDataUserLocal>();
  CubitMainUserConnect() : super(DataUser(false, {}));
  Future<void> fetchUser() async{
    await _dataDeleteUserLocal.deleteDataUser();
    await sharedPref();
    await _dataUpdateUserFirebase.updateUserFirebase(email: prefs.getString('email').toString(), statusUser: "Offline");
    final _dataUser = await _dataGetUser.getUser();
    emit(DataUser(true, await _dataUser));
    late List<Map<String, dynamic>> _dataGetLocal = []; 
    final _dataLocal = await _dataGetUserLocal.getDataUser();
    _dataGetLocal = _dataLocal;
    if(_dataGetLocal.isEmpty){
      await _dataInsertUserLocal.insertDataUser(
        email: _dataUser.email.toString(),
        name: _dataUser.name.toString(),
        phone: '0',
        profilePhoto: _dataUser.profilePhotoPath.toString(),
        username: _dataUser.username.toString(),
      );
    }
  }
}