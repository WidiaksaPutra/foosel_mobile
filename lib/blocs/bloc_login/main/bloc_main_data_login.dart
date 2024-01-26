// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/event_default/event_form_user.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_navigasi_role.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_login/event_login.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/state_default/state_snackBar_form.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/firebase/interface_insert_user_firebase.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_get_login.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_get_user.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_konstanta.dart';
import 'package:go_router/go_router.dart';

// part 'bloc_event_login.dart';
// part 'bloc_state_login.dart';
late String respons = "";
late dynamic dataUser;
class BlocButtonLoginData extends Bloc<DataEventFormLogin, StateSnackBar> with defaultSharedPref, navigasiRole, navigasiRoleBarRead{
  final interfaceGetLogin dataGetLogin = getItInstance<interfaceGetLogin>();
  final interfaceGetUser dataGetUser = getItInstance<interfaceGetUser>();
  final interfaceInsertUserFirebase dataUserFirebase = getItInstance<interfaceInsertUserFirebase>();
  BlocButtonLoginData() : super(DataStateInitialSnackBar()){
    on<ButtonFormUser>((event, emit) async{
      await buttonSnackBar(event.email, event.password, event.context);
    });
  }

  buttonSnackBar(String email, String password, BuildContext context) async{
    await Future.delayed(const Duration(milliseconds: 500));
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
          respons = await dataGetLogin.GetLogin(email: email, password: password);
          if(respons == "berhasil"){
            dataUser = await dataGetUser.GetUser();
            await FirebaseMessaging.instance.deleteToken();
            var fcmToken = await FirebaseMessaging.instance.getToken();
            dataUserFirebase.InsertUserFirebase(
              tokenNotive: fcmToken.toString(), 
              dataProfil: dataUser,
            );
            prefs.setString('fcmToken', fcmToken.toString());
            Future.delayed(Duration(milliseconds: 1000));
            await navigasiR();
            await navigasiRBR(context: context, value: 0);
            emit(
              DataStateSnackBar(
                context.go("$navigation"),
                context: context,
                loading: false, 
                snackBar: true,
                responMessage: snackBarLoginBerhasil, 
                colorSnackBar: kGreenColor, 
                responApi: respons,
                snackBar2: false,
                responMessage2: "",
                colorSnackBar2: kWhiteColor,
              ),
            );              
            prefs.remove('emailLogin');
            prefs.remove('passwordLogin');
          }
          if(respons == "gagal"){
            prefs.remove('email');
            emit(
              DataStateSnackBar(
                "",
                context: context,
                loading: false, 
                snackBar: true,
                responMessage: snackBarLoginSalah, 
                colorSnackBar: kRedColor, 
                responApi: respons,
                snackBar2: false,
                responMessage2: "",
                colorSnackBar2: kWhiteColor,
              ),
            );
          }
          if(respons == "error"){
            prefs.remove('email');
            emit(
              DataStateSnackBar(
                "",
                context: context,
                loading: false, 
                snackBar: true,
                responMessage: snackBarLoginGagal, 
                colorSnackBar: kRedColor, 
                responApi: respons,
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

