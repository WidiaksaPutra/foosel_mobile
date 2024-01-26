// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/event_default/event_form_user.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_color_random.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_register/event_register.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/state_default/state_snackBar_form.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_post_register.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_user.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_konstanta.dart';
import 'package:go_router/go_router.dart';

class BlocButtonRegisterData extends Bloc<DataEventFormRegister, StateSnackBar> with defaultSharedPref, apiUser, colorRandom{
  final interfacePostRegister dataPostRegister = getItInstance<interfacePostRegister>();
  BlocButtonRegisterData() : super(DataStateInitialSnackBar()){
    on<ButtonFormUser>((event, emit) async{
      await buttonSnackBar(
        email: event.email, 
        alamat: event.alamat,
        password: event.password, 
        fullName: event.fullName, 
        username: event.username, 
        navigation: event.navigation, 
        context: event.context,
        userRole: event.userRole,
      );
    });
  }

  buttonSnackBar({
    required String email,
    required String alamat,
    required String password,
    required String fullName,
    required String username,
    required String navigation,
    required BuildContext context,
    required dynamic userRole,
  }) async{
    await sharedPref();
    if(email != "" && alamat != "" && password != "" && fullName != "" && username != ""){
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
      await Future.delayed(const Duration(milliseconds: 500));
      await prosesColorRandom();
      String rColor = colorData;
      List<String> inisial = email.split('');
      String respons = await dataPostRegister.PostRegister(
        email: email, 
        alamat: alamat,
        password: password, 
        name: fullName, 
        username: username, 
        roles: userRole, 
        gambarUser: "https://ui-avatars.com/api/?name=${inisial[0].toUpperCase()}&color=FFFFFF&background=$rColor",
        // splitGambarUser[0].toString()
      );
      if(respons == "berhasil"){
        emit(
          DataStateSnackBar(
            context.go(navigation),
            context: context,
            loading: false, 
            snackBar: true,
            responMessage: snackBarRegisterBerhasil, 
            colorSnackBar: kGreenColor, 
            responApi: respons,
            snackBar2: false,
            responMessage2: "",
            colorSnackBar2: kWhiteColor,
          ),
        );
        prefs.remove('emailRegister');
        prefs.remove('passwordRegister');
        prefs.remove('fullNameRegister');
        prefs.remove('usernameRegister');
      }
      if(respons == "gagal"){
        emit(
          DataStateSnackBar(
            "",
            context: context,
            loading: false, 
            snackBar: true,
            responMessage: snackBarRegisterSudahTersedia, 
            colorSnackBar: kRedColor, 
            responApi: respons,
            snackBar2: false,
            responMessage2: "",
            colorSnackBar2: kWhiteColor,
          ),
        );
      }
      if(respons == "error"){
        emit(
          DataStateSnackBar(
            "",
            context: context,
            loading: false, 
            snackBar: true,
            responMessage: snackBarRegistrasiGagal, 
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