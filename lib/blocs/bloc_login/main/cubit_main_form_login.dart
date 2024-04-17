import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/state/state_form_user.dart';

class CubitFormLogin extends Cubit<DataStateFormUser>{
  CubitFormLogin() : super(DataStateInitial());
  void emailValidasiEmpty(String email){
    if(email.isEmpty){
      emit(DataStateEmail(true));
    }else{
      emit(DataStateEmail(false));
    }
  }

  void passwordValidasiEmpty(String password){
    if(password.isEmpty){
      emit(DataStatePassword(true));
    }else{
      emit(DataStatePassword(false));
    }
  } // _formKey.currentState!.validate()
}