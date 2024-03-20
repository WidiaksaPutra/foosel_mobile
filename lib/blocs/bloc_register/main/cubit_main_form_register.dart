import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/state/state_form_user.dart';

class CubitFormRegister extends Cubit<DataStateFormUser>{
  CubitFormRegister() : super(DataStateInitial());

  fullNameValidasiEmpty(String fullName){
    if(fullName.isEmpty){
      emit(DataStateFullName(true));
    }else{
      emit(DataStateFullName(false));
    }
  }

  usernameValidasiEmpty(String username){
    if(username.isEmpty){
      emit(DataStateUsername(true));
    }else{
      emit(DataStateUsername(false));
    }
  }

  emailValidasiEmpty(String email){
    if(email.isEmpty){
      emit(DataStateEmail(true));
    }else{
      emit(DataStateEmail(false));
    }
  }

  passwordValidasiEmpty(String password){
    if(password.isEmpty){
      emit(DataStatePassword(true));
    }else{
      emit(DataStatePassword(false));
    }
  }
  
  alamatValidasiEmpty(String alamat){
    if(alamat.isEmpty){
      emit(DataStateAlamat(true));
    }else{
      emit(DataStateAlamat(false));
    }
  } // _formKey.currentState!.validate()
}