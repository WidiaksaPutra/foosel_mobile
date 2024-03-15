// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/event_default/event_form_user.dart';
import 'package:foosel/blocs/bloc_register/event_register.dart';
import 'package:foosel/blocs/bloc_register/state_register.dart';
import 'package:foosel/blocs/bloc_default/state_default/state_multipe_form.dart';
import 'package:foosel/shared/theme_konstanta.dart';

class BlocButtonRegisterUser extends Bloc<DataEventFormRegister, DataStateMultiFormUser>{
  BlocButtonRegisterUser() : super(DataStateInitialFormUser()){
    on<ButtonFormUser>((event, emit){
      buttonRegister(
        email: event.email, 
        fullName: event.fullName, 
        username: event.username, 
        password: event.password, 
        alamat: event.alamat,
        navigation: event.navigation,
      );
    });
  }
  
  buttonRegister({
    required String email, 
    required String password, 
    required String fullName, 
    required String username ,
    required String alamat,
    required String navigation,
  }){
    emit(DataStateFormRegister(
      formVisibleEmail: false,
      formVisiblePassword: false,
      formVisibleFullName: false, 
      formVisibleUsername: false, 
      formVisibleAlamat: false,
      messageEmail: '',
      messagePassword: '', 
      messageFullName: '',
      messageUsername: '', 
      messageAlamat: '',
    ));
    if(email == "" && password == "" && fullName == "" && username == "" && alamat == ""){
      emit(DataStateFormRegister(
        formVisibleEmail: true, 
        formVisiblePassword: true, 
        formVisibleFullName: true, 
        formVisibleUsername: true, 
        formVisibleAlamat: true,
        messageEmail: emailKosong, 
        messagePassword: passwordKosong, 
        messageFullName: fullNameKosong, 
        messageUsername: usernameKosong,
        messageAlamat: alamatKosong,
      ));//fungsinya memberikan notive ketika proses pengisian form, jika semua form memang dikosongkan dengan sengaja dan langsung disubmit.
    }

    else if(email == "" && password != "" && fullName != "" && username != "" && alamat != ""){
      emit(DataStateFormRegister(
        formVisibleEmail: true, 
        formVisiblePassword: false, 
        formVisibleFullName: false, 
        formVisibleUsername: false, 
        formVisibleAlamat: false,
        messageEmail: emailKosong, 
        messagePassword: "", 
        messageFullName: "", 
        messageUsername: "",
        messageAlamat: "",
      ));
    }
    else if(email == "" && password == "" && fullName != "" && username != "" && alamat != ""){
      emit(DataStateFormRegister(
        formVisibleEmail: true, 
        formVisiblePassword: true, 
        formVisibleFullName: false, 
        formVisibleUsername: false, 
        formVisibleAlamat: false,
        messageEmail: emailKosong, 
        messagePassword: passwordKosong, 
        messageFullName: "",
        messageUsername: "",
        messageAlamat: "",
      ));
    }
    else if(email == "" && password != "" && fullName == "" && username != "" && alamat != ""){
      emit(DataStateFormRegister(
        formVisibleEmail: true, 
        formVisiblePassword: false, 
        formVisibleFullName: true, 
        formVisibleUsername: false, 
        formVisibleAlamat: false,
        messageEmail: emailKosong, 
        messagePassword: "", 
        messageFullName: fullNameKosong,
        messageUsername: "",
        messageAlamat: "",
      ));
    }
    else if(email == "" && password != "" && fullName != "" && username != "" && alamat == ""){
      emit(DataStateFormRegister(
        formVisibleEmail: true, 
        formVisiblePassword: false, 
        formVisibleFullName: false, 
        formVisibleUsername: false, 
        formVisibleAlamat: true,
        messageEmail: emailKosong, 
        messagePassword: "", 
        messageFullName: "",
        messageUsername: "",
        messageAlamat: alamatKosong,
      ));
    }
    else if(email == "" && password == "" && fullName == "" && username != "" && alamat != ""){
      emit(DataStateFormRegister(
        formVisibleEmail: true, 
        formVisiblePassword: true, 
        formVisibleFullName: true, 
        formVisibleUsername: false, 
        formVisibleAlamat: false,
        messageEmail: emailKosong, 
        messagePassword: passwordKosong, 
        messageFullName: fullNameKosong,
        messageUsername: "",
        messageAlamat: "",
      ));
    }
    else if(email == "" && password != "" && fullName == "" && username != "" && alamat == ""){
      emit(DataStateFormRegister(
        formVisibleEmail: true, 
        formVisiblePassword: false, 
        formVisibleFullName: true, 
        formVisibleUsername: false, 
        formVisibleAlamat: true,
        messageEmail: emailKosong, 
        messagePassword: "", 
        messageFullName: fullNameKosong,
        messageUsername: "",
        messageAlamat: alamatKosong,
      ));
    }
    else if(email == "" && password == "" && fullName != "" && username != "" && alamat == ""){
      emit(DataStateFormRegister(
        formVisibleEmail: true, 
        formVisiblePassword: true, 
        formVisibleFullName: false, 
        formVisibleUsername: false, 
        formVisibleAlamat: true,
        messageEmail: emailKosong, 
        messagePassword: passwordKosong, 
        messageFullName: "",
        messageUsername: "",
        messageAlamat: alamatKosong,
      ));
    }
    else if(email == "" && password == "" && fullName == "" && username != "" && alamat == ""){
      emit(DataStateFormRegister(
        formVisibleEmail: true, 
        formVisiblePassword: true, 
        formVisibleFullName: true, 
        formVisibleUsername: false, 
        formVisibleAlamat: true,
        messageEmail: emailKosong, 
        messagePassword: passwordKosong, 
        messageFullName: fullNameKosong,
        messageUsername: "",
        messageAlamat: alamatKosong,
      ));
    }

    else if(password == "" && email != "" && fullName != "" && username != "" && alamat != ""){
      emit(DataStateFormRegister(
        formVisibleEmail: false, 
        formVisiblePassword: true, 
        formVisibleFullName: false, 
        formVisibleUsername: false, 
        formVisibleAlamat: false,
        messageEmail: "", 
        messagePassword: passwordKosong, 
        messageFullName: "",
        messageUsername: "",
        messageAlamat: "",
      ));
    }
    else if(password == "" && email != "" && fullName == "" && username != "" && alamat != ""){
      emit(DataStateFormRegister(
        formVisibleEmail: false, 
        formVisiblePassword: true, 
        formVisibleFullName: true, 
        formVisibleUsername: false, 
        formVisibleAlamat: false,
        messageEmail: "", 
        messagePassword: passwordKosong, 
        messageFullName: fullNameKosong, 
        messageUsername: "",
        messageAlamat: "",
      ));
    }
    else if(password == "" && email != "" && fullName != "" && username == "" && alamat != ""){
      emit(DataStateFormRegister(
        formVisibleEmail: false, 
        formVisiblePassword: true, 
        formVisibleFullName: false, 
        formVisibleUsername: true, 
        formVisibleAlamat: false,
        messageEmail: "", 
        messagePassword: passwordKosong, 
        messageFullName: "", 
        messageUsername: usernameKosong,
        messageAlamat: "",
      ));
    }
    else if(password == "" && email != "" && fullName != "" && username != "" && alamat == ""){
      emit(DataStateFormRegister(
        formVisibleEmail: false, 
        formVisiblePassword: true, 
        formVisibleFullName: false, 
        formVisibleUsername: false, 
        formVisibleAlamat: true,
        messageEmail: "", 
        messagePassword: passwordKosong, 
        messageFullName: '', 
        messageUsername: '',
        messageAlamat: alamatKosong,
      ));
    }
    else if(password == "" && email != "" && fullName == "" && username == "" && alamat != ""){
      emit(DataStateFormRegister(
        formVisibleEmail: false,
        formVisiblePassword: true,
        formVisibleFullName: true, 
        formVisibleUsername: true, 
        formVisibleAlamat: false,
        messageEmail: '',
        messagePassword: passwordKosong, 
        messageFullName: fullNameKosong,
        messageUsername: usernameKosong, 
        messageAlamat: '',
      ));
    }
    else if(password == "" && email != "" && fullName != "" && username == "" && alamat == ""){
      emit(DataStateFormRegister(
        formVisibleEmail: false,
        formVisiblePassword: true,
        formVisibleFullName: false, 
        formVisibleUsername: true, 
        formVisibleAlamat: true,
        messageEmail: '',
        messagePassword: passwordKosong, 
        messageFullName: '',
        messageUsername: usernameKosong, 
        messageAlamat: alamatKosong,
      ));
    }
    else if(password == "" && email != "" && fullName == "" && username != "" && alamat == ""){
      emit(DataStateFormRegister(
        formVisibleEmail: false,
        formVisiblePassword: true,
        formVisibleFullName: true, 
        formVisibleUsername: false, 
        formVisibleAlamat: true,
        messageEmail: '',
        messagePassword: passwordKosong, 
        messageFullName: fullNameKosong,
        messageUsername: '', 
        messageAlamat: alamatKosong,
      ));
    }
    
    else if(fullName == "" && email != "" && password != "" && username != "" && alamat != ""){
      emit(DataStateFormRegister(
        formVisibleEmail: false,
        formVisiblePassword: false,
        formVisibleFullName: true, 
        formVisibleUsername: false, 
        formVisibleAlamat: false,
        messageEmail: "",
        messagePassword: "", 
        messageFullName: fullNameKosong,
        messageUsername: "", 
        messageAlamat: "",
      ));
    }
    else if(fullName == "" && email == "" && password != "" && username != "" && alamat != ""){
      emit(DataStateFormRegister(
        formVisibleEmail: true,
        formVisiblePassword: false,
        formVisibleFullName: true, 
        formVisibleUsername: false, 
        formVisibleAlamat: false,
        messageEmail: emailKosong,
        messagePassword: "", 
        messageFullName: fullNameKosong,
        messageUsername: "", 
        messageAlamat: "",
      ));
    }
    else if(fullName == "" && email != "" && password != "" && username == "" && alamat != ""){
      emit(DataStateFormRegister(
        formVisibleEmail: false,
        formVisiblePassword: false,
        formVisibleFullName: true, 
        formVisibleUsername: true, 
        formVisibleAlamat: false,
        messageEmail: "",
        messagePassword: "", 
        messageFullName: fullNameKosong,
        messageUsername: usernameKosong, 
        messageAlamat: "",
      ));
    }
    else if(fullName == "" && email != "" && password != "" && username != "" && alamat == ""){
      emit(DataStateFormRegister(
        formVisibleEmail: false,
        formVisiblePassword: false,
        formVisibleFullName: true, 
        formVisibleUsername: false, 
        formVisibleAlamat: true,
        messageEmail: "",
        messagePassword: "", 
        messageFullName: fullNameKosong,
        messageUsername: "", 
        messageAlamat: alamatKosong,
      ));
    }
    else if(fullName == "" && email == "" && password != "" && username == "" && alamat != ""){
      emit(DataStateFormRegister(
        formVisibleEmail: true,
        formVisiblePassword: false,
        formVisibleFullName: true, 
        formVisibleUsername: true, 
        formVisibleAlamat: false,
        messageEmail: emailKosong,
        messagePassword: "", 
        messageFullName: fullNameKosong,
        messageUsername: usernameKosong, 
        messageAlamat: "",
      ));
    }
    else if(fullName == "" && email != "" && password != "" && username == "" && alamat == ""){
      emit(DataStateFormRegister(
        formVisibleEmail: false,
        formVisiblePassword: false,
        formVisibleFullName: true, 
        formVisibleUsername: true, 
        formVisibleAlamat: true,
        messageEmail: "",
        messagePassword: "", 
        messageFullName: fullNameKosong,
        messageUsername: usernameKosong, 
        messageAlamat: alamatKosong,
      ));
    }
    else if(fullName == "" && email == "" && password != "" && username != "" && alamat == ""){
      emit(DataStateFormRegister(
        formVisibleEmail: true,
        formVisiblePassword: false,
        formVisibleFullName: true, 
        formVisibleUsername: false, 
        formVisibleAlamat: true,
        messageEmail: emailKosong,
        messagePassword: "", 
        messageFullName: fullNameKosong,
        messageUsername: "", 
        messageAlamat: alamatKosong,
      ));
    }
    else if(fullName == "" && email == "" && password != "" && username == "" && alamat == ""){
      emit(DataStateFormRegister(
        formVisibleEmail: true,
        formVisiblePassword: false,
        formVisibleFullName: true, 
        formVisibleUsername: true, 
        formVisibleAlamat: true,
        messageEmail: emailKosong,
        messagePassword: "", 
        messageFullName: fullNameKosong,
        messageUsername: usernameKosong, 
        messageAlamat: alamatKosong,
      ));
    }

    else if(username == "" && email != "" && password != "" &&  fullName != "" && alamat != ""){
      emit(DataStateFormRegister(
        formVisibleEmail: false,
        formVisiblePassword: false,
        formVisibleFullName: false, 
        formVisibleUsername: true, 
        formVisibleAlamat: false,
        messageEmail: "",
        messagePassword: "",
        messageFullName: "",
        messageUsername: usernameKosong, 
        messageAlamat: "",
      ));
    }
    else if(username == "" && email == "" && password != "" &&  fullName != "" && alamat != ""){
      emit(DataStateFormRegister(
        formVisibleEmail: true, 
        formVisiblePassword: false, 
        formVisibleFullName: false, 
        formVisibleUsername: true, 
        formVisibleAlamat: false,
        messageEmail: emailKosong, 
        messagePassword: "", 
        messageFullName: "", 
        messageUsername: usernameKosong,
        messageAlamat: "",
      ));
    }
    else if(username == "" && email != "" && password != "" &&  fullName != "" && alamat == ""){
      emit(DataStateFormRegister(
        formVisibleEmail: false, 
        formVisiblePassword: false, 
        formVisibleFullName: false, 
        formVisibleUsername: true, 
        formVisibleAlamat: true,
        messageEmail: "", 
        messagePassword: "", 
        messageFullName: "", 
        messageUsername: usernameKosong,
        messageAlamat: alamatKosong,
      ));
    }
    else if(username == "" && email == "" && password == "" &&  fullName != "" && alamat != ""){
      emit(DataStateFormRegister(
        formVisibleEmail: true,
        formVisiblePassword: true,
        formVisibleFullName: false, 
        formVisibleUsername: true, 
        formVisibleAlamat: false,
        messageEmail: emailKosong,
        messagePassword: passwordKosong, 
        messageFullName: "",
        messageUsername: usernameKosong, 
        messageAlamat: "",
      ));
    }
    else if(username == "" && email != "" && password == "" &&  fullName != "" && alamat == ""){
      emit(DataStateFormRegister(
        formVisibleEmail: false,
        formVisiblePassword: true,
        formVisibleFullName: false, 
        formVisibleUsername: true, 
        formVisibleAlamat: true,
        messageEmail: "",
        messagePassword: passwordKosong, 
        messageFullName: "",
        messageUsername: usernameKosong, 
        messageAlamat: alamatKosong,
      ));
    }
    else if(username == "" && email == "" && password != "" &&  fullName != "" && alamat == ""){
      emit(DataStateFormRegister(
        formVisibleEmail: true,
        formVisiblePassword: false,
        formVisibleFullName: false, 
        formVisibleUsername: true, 
        formVisibleAlamat: true,
        messageEmail: emailKosong,
        messagePassword: "", 
        messageFullName: "",
        messageUsername: usernameKosong, 
        messageAlamat: alamatKosong,
      ));
    }
    else if(username == "" && email == "" && password == "" &&  fullName != "" && alamat == ""){
      emit(DataStateFormRegister(
        formVisibleEmail: true,
        formVisiblePassword: true,
        formVisibleFullName: false, 
        formVisibleUsername: true, 
        formVisibleAlamat: true,
        messageEmail: emailKosong,
        messagePassword: passwordKosong, 
        messageFullName: "",
        messageUsername: usernameKosong, 
        messageAlamat: alamatKosong,
      ));
    }
    else if(email != "" && password == "" && fullName == "" && username == "" && alamat == ""){
      emit(DataStateFormRegister(
        formVisibleEmail: false, 
        formVisiblePassword: true, 
        formVisibleFullName: true, 
        formVisibleUsername: true, 
        formVisibleAlamat: true,
        messageEmail: "", 
        messagePassword: passwordKosong, 
        messageFullName: fullNameKosong, 
        messageUsername: usernameKosong,
        messageAlamat: alamatKosong,
      ));
    }
    else if(email == "" && password == "" && fullName != "" && username == "" && alamat == ""){
      emit(DataStateFormRegister(
        formVisibleEmail: true, 
        formVisiblePassword: true, 
        formVisibleFullName: false, 
        formVisibleUsername: true, 
        formVisibleAlamat: true,
        messageEmail: emailKosong, 
        messagePassword: passwordKosong, 
        messageFullName: "", 
        messageUsername: usernameKosong,
        messageAlamat: alamatKosong,
      ));
    }
    else if(email == "" && password == "" && fullName == "" && username == "" && alamat != ""){
      emit(DataStateFormRegister(
        formVisibleEmail: true, 
        formVisiblePassword: true, 
        formVisibleFullName: true, 
        formVisibleUsername: true, 
        formVisibleAlamat: false,
        messageEmail: emailKosong, 
        messagePassword: passwordKosong, 
        messageFullName: fullNameKosong, 
        messageUsername: usernameKosong,
        messageAlamat: "",
      ));
    }
  }
}