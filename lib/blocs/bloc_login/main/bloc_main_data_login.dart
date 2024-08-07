// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/event/event_form_user.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_navigasi_role.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/blocs/bloc_login/event_login.dart';
import 'package:foosel/blocs/bloc_default/state/state_snackBar_form.dart';
import 'package:foosel/blocs/bloc_message/main/cubit_main_list_message_connect.dart';
import 'package:foosel/firebase/api_user_firebase/interfaces/interface_insert_user_firebase.dart';
import 'package:foosel/service/api_login/interface_get_login.dart';
import 'package:foosel/service/api_user/interfaces/interface_get_user.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:foosel/shared/theme_konstanta.dart';
import 'package:go_router/go_router.dart';

// part 'bloc_event_login.dart';
// part 'bloc_state_login.dart';
late String _respons = "";
late dynamic _dataUser;
class BlocButtonLoginData extends Bloc<DataEventFormLogin, StateSnackBar> with SharedPref, NavigasiRole, NavigasiRoleBarRead{
  final InterfaceGetLogin _dataGetLogin = getItInstance<InterfaceGetLogin>();
  final InterfaceGetUser _dataGetUser = getItInstance<InterfaceGetUser>();
  final InterfaceInsertUserFirebase _dataUserFirebase = getItInstance<InterfaceInsertUserFirebase>();
  BlocButtonLoginData() : super(DataStateInitialSnackBar()){
    on<ButtonFormUser>((event, emit) async{
      await buttonSnackBar(event.email, event.password, event.context);
    });
  }

  Future<void> buttonSnackBar(String email, String password, BuildContext context) async{
    await sharedPref();
    if(email != "" && password != ""){
      if(email != ""){
        if(password != ""){
          emit(
            DataStateSnackBar(
              "",
              context: context,
              loading: true, 
              snackBar: false,
              responMessage: "", 
              colorSnackBar: kWhiteColor, 
              responApi: "",
              snackBar2: false,
              responMessage2: "",
              colorSnackBar2: kWhiteColor,
            ),
          );
          prefs.setString('email', email);
          _respons = await _dataGetLogin.getLogin(email: email, password: password);
          if(_respons == "berhasil"){
            _dataUser = await _dataGetUser.getUser();
            await FirebaseMessaging.instance.deleteToken();
            var fcmToken = await FirebaseMessaging.instance.getToken();
            _dataUserFirebase.insertUserFirebase(
              tokenNotive: fcmToken.toString(), 
              dataProfil: _dataUser,
            );
            prefs.setString('fcmToken', fcmToken.toString());
            await navigasiR();
            await navigasiRBR(context: context, value: 0);
            await context.read<CubitListMessageConnect>().updateListMessage();            
            emit(
              DataStateSnackBar(
                context.go("$navigation"),
                context: context,
                loading: false, 
                snackBar: true,
                responMessage: snackBarLoginBerhasil, 
                colorSnackBar: kGreenColor, 
                responApi: _respons,
                snackBar2: false,
                responMessage2: "",
                colorSnackBar2: kWhiteColor,
              ),
            );              
            prefs.remove('emailLogin');
            prefs.remove('passwordLogin');
          }
          if(_respons == "gagal"){
            prefs.remove('email');
            emit(
              DataStateSnackBar(
                "",
                context: context,
                loading: false, 
                snackBar: true,
                responMessage: snackBarLoginSalah, 
                colorSnackBar: kRedColor, 
                responApi: _respons,
                snackBar2: false,
                responMessage2: "",
                colorSnackBar2: kWhiteColor,
              ),
            );
          }
          if(_respons == "error"){
            prefs.remove('email');
            emit(
              DataStateSnackBar(
                "",
                context: context,
                loading: false, 
                snackBar: true,
                responMessage: snackBarLoginGagal, 
                colorSnackBar: kRedColor, 
                responApi: _respons,
                snackBar2: false,
                responMessage2: "",
                colorSnackBar2: kWhiteColor,
              ),
            );
          } 
        }
      }
    }
  }
}

