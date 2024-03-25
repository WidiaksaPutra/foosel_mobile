// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/event/event_form_user.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_color_random.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/blocs/bloc_register/event_register.dart';
import 'package:foosel/blocs/bloc_default/state/state_snackBar_form.dart';
import 'package:foosel/service/api_register/interface_post_register.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:foosel/shared/theme_konstanta.dart';
import 'package:go_router/go_router.dart';

class BlocButtonRegisterData extends Bloc<DataEventFormRegister, StateSnackBar> with SharedPref, ColorRandom{
  final InterfacePostRegister _dataPostRegister = getItInstance<InterfacePostRegister>();
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
      await prosesColorRandom();
      String _rColor = colorData;
      List<String> _inisial = email.split('');
      String _respons = await _dataPostRegister.postRegister(
        email: email, 
        alamat: alamat,
        password: password, 
        name: fullName, 
        username: username, 
        roles: userRole, 
        gambarUser: "https://ui-avatars.com/api/?name=${_inisial[0].toUpperCase()}&color=FFFFFF&background=$_rColor",
        // splitGambarUser[0].toString()
      );
      if(_respons == "berhasil"){
        emit(
          DataStateSnackBar(
            context.go(navigation),
            context: context,
            loading: false, 
            snackBar: true,
            responMessage: snackBarRegisterBerhasil, 
            colorSnackBar: kGreenColor, 
            responApi: _respons,
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
      if(_respons == "gagal"){
        emit(
          DataStateSnackBar(
            "",
            context: context,
            loading: false, 
            snackBar: true,
            responMessage: snackBarRegisterSudahTersedia, 
            colorSnackBar: kRedColor, 
            responApi: _respons,
            snackBar2: false,
            responMessage2: "",
            colorSnackBar2: kWhiteColor,
          ),
        );
      }
      if(_respons == "error"){
        emit(
          DataStateSnackBar(
            "",
            context: context,
            loading: false, 
            snackBar: true,
            responMessage: snackBarRegistrasiGagal, 
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