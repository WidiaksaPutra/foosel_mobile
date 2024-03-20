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
  final InterfaceGetUser dataGetUser = getItInstance<InterfaceGetUser>();
  final InterfaceUpdateUserFirebase dataUpdateUserFirebase = getItInstance<InterfaceUpdateUserFirebase>();
  final InterfaceDeleteDataUserLocal dataDeleteUserLocal = getItInstance<InterfaceDeleteDataUserLocal>();
  final InterfaceGetDataUserLocal dataGetUserLocal = getItInstance<InterfaceGetDataUserLocal>();
  final InterfaceInsertDataUserLocal dataInsertUserLocal = getItInstance<InterfaceInsertDataUserLocal>();
  CubitMainUserConnect() : super(DataUser(false, {}));
  fetchUser() async{
    await dataDeleteUserLocal.deleteDataUser();
    await sharedPref();
    await dataUpdateUserFirebase.updateUserFirebase(email: prefs.getString('email').toString(), statusUser: "Offline");
    final dataUser = await dataGetUser.getUser();
    emit(DataUser(true, await dataUser));
    late List<Map<String, dynamic>> dataGetLocal = []; 
    final dataLocal = await dataGetUserLocal.getDataUser();
    dataGetLocal = dataLocal;
    if(dataGetLocal.isEmpty){
      await dataInsertUserLocal.insertDataUser(
        email: dataUser.email.toString(),
        name: dataUser.name.toString(),
        phone: '0',
        profilePhoto: dataUser.profilePhotoPath.toString(),
        username: dataUser.username.toString(),
      );
    }
  }
}