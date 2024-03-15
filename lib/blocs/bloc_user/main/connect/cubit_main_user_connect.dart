import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:foosel/blocs/bloc_user/state_user.dart';
import 'package:foosel/helpers/user/helper_user.dart';
import 'package:foosel/interface/interface_local/firebase/interface_update_user_firebase.dart';
import 'package:foosel/interface/interface_local/service/interface_get_user.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class CubitMainUserConnect extends Cubit<DataStateUser> with helperUser, defaultSharedPref{
  final interfaceGetUser dataGetUser = getItInstance<interfaceGetUser>();
  final interfaceUpdateUserFirebase dataUpdateUserFirebase = getItInstance<interfaceUpdateUserFirebase>();
  CubitMainUserConnect() : super(DataUser(false, {}));
  fetchUser() async{
    await deleteDataUser();
    await sharedPref();
    await dataUpdateUserFirebase.UpdateUserFirebase(email: prefs.getString('email').toString(), statusUser: "Offline");
    final dataUser = await dataGetUser.GetUser();
    emit(DataUser(true, await dataUser));
    late List<Map<String, dynamic>> dataGetLocal = []; 
    final dataLocal = await getDataUser();
    dataGetLocal = dataLocal;
    if(dataGetLocal.isEmpty){
      await insertDataUser(
        dataUser.name.toString(),
        dataUser.email.toString(), 
        dataUser.username.toString(),
        '0',
        dataUser.profilePhotoPath.toString(),
      );  
    }
  }
}