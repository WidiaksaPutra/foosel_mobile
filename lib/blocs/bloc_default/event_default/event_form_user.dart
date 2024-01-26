import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_login/event_login.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_register/event_register.dart';

class ButtonFormUser with DataEventFormLogin, DataEventFormRegister{
  late String email, password, fullName, username, navigation, alamat;
  final BuildContext context;
  late dynamic userRole;
  ButtonFormUser({
    required this.email, 
    required this.alamat,
    required this.password,
    required this.fullName,
    required this.username,  
    required this.context,
    required this.userRole,
    required this.navigation,
  }){
    if(email == "null"){
      email = "";
    }
    if(alamat == "null"){
      alamat = "";
    }
    if(password == "null"){
      password = "";
    }
    if(fullName == "null"){
      fullName = "";
    }
    if(username == "null"){
      username = "";
    }
    if(userRole == false){
      userRole = "PENJUAL";
    }
    if(userRole == true){
      userRole = "PEMBELI";
    }
  }
}