import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_user/state_user.dart';
import 'package:flutter_laravel_toko_sepatu/helpers/user/helper_user.dart';

class CubitMainUserDisconnect extends Cubit<DataStateUser> with helperUser{
  CubitMainUserDisconnect() : super(DataUser(true, {}));
  fetchUser() async{
    final dataLocal = await getDataUser();
    Map<String, dynamic> dataGetLocal = {
      'nama' : dataLocal[0]["name"].toString(),
      'username' : dataLocal[0]["username"].toString(),
      'email' : dataLocal[0]["email"].toString(),
    };
    emit(DataUser(true, dataGetLocal));
  }
}