// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/state_default/state_snackBar_form.dart';
import 'package:foosel/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:foosel/blocs/bloc_user/event_user.dart';
import 'package:foosel/helpers/login/helper_login.dart';
import 'package:foosel/interface/interface_local/service/interface_update_user.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:foosel/shared/theme_konstanta.dart';
import 'package:go_router/go_router.dart';

late String statusUpdate = "";
class BlocMainUpdateUserConnect extends Bloc<DataEventUser, StateSnackBar> with helperLogin, defaultSharedPref{
  final interfaceUpdateUser dataUpdateUser = getItInstance<interfaceUpdateUser>();
  BlocMainUpdateUserConnect() : super(DataStateInitialSnackBar()){
    on<DataEventUpdateUser>((event, emit) async{
      await buttonUpdate(
        name: event.name,
        alamat: event.alamat,
        email: event.email, 
        username: event.username, 
        context: event.context, 
        navigation: event.navigation);
    });
  }

  buttonUpdate({
    required String name,
    required String alamat,
    required String email, 
    required String username,
    required BuildContext context, 
    required String navigation,
  }) async{
    await sharedPref();
    (name == "" && email == "" && username == "" && alamat == "")
    ? emit(
        DataStateSnackBar(
          "",
          context: context,
          loading: false, 
          snackBar: true,
          responMessage: snackBarUpdateKosong, 
          colorSnackBar: kOrangeColor, 
          responApi: "gagal",
          snackBar2: false,
          responMessage2: "",
          colorSnackBar2: kWhiteColor,
        ),
      )
    : {
        if(email != ""){
          await updateDataEmailLogin(email),
        },
        statusUpdate = await dataUpdateUser.UpdateUser(email: email, name: name, username: username, alamat: alamat),
        (statusUpdate == "berhasil")
        ? emit(
            DataStateSnackBar(
              context.go(navigation),
              context: context,
              loading: false, 
              snackBar: true,
              responMessage: snackBarUpdateBerhasil, 
              colorSnackBar: kGreenColor, 
              responApi: "berhasil",
              snackBar2: false,
              responMessage2: "",
              colorSnackBar2: kWhiteColor,
            ),
          )
        : emit(
            DataStateSnackBar(
              "",
              context: context,
              loading: false, 
              snackBar: true,
              responMessage: snackBarUpdateGagal, 
              colorSnackBar: kRedColor, 
              responApi: "gagal",
              snackBar2: false,
              responMessage2: "",
              colorSnackBar2: kWhiteColor,
            ),
          )
      };
    prefs.remove('fullNameUpdate');
    prefs.remove('usernameUpdate');
    prefs.remove('emailUpdate');
  }
}