// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/event/event_form_user.dart';
import 'package:foosel/blocs/bloc_login/event_login.dart';
import 'package:foosel/blocs/bloc_login/state_login.dart';
import 'package:foosel/blocs/bloc_default/state/state_multipe_form.dart';
import 'package:foosel/shared/theme_konstanta.dart';

class BlocButtonLogin extends Bloc<DataEventFormLogin, DataStateMultiFormUser>{
  BlocButtonLogin() : super(DataStateInitialFormUser()){
    on<ButtonFormUser>((event, emit){
      buttonLogin(event.email, event.password, event.navigation);
    });
  }
  
  void buttonLogin(String email, String password, String navigation){
    emit(DataMultiStateForm(false, false, '', ''));
    if(email == "" && password == ""){
      emit(DataMultiStateForm(true, true, emailKosong, passwordKosong));//fungsinya memberikan notive ketika proses pengisian form, jika semua form memang dikosongkan dengan sengaja dan langsung disubmit.
    }
    else if(email == "" && password != ""){
      emit(DataMultiStateForm(true, false, emailKosong, ""));
    }
    else if(password == "" && email != ""){
      emit(DataMultiStateForm(false, true, "", passwordKosong));
    }
  }
}