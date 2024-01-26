import 'package:flutter/material.dart';
mixin DataEventUser{}

class DataEventUpdateUser with DataEventUser{
  late String name, email, username, alamat;
  final String navigation;
  final BuildContext context;
  DataEventUpdateUser({name, alamat, email, username, required this.context, required this.navigation}){
    if(name == "null"){
      name = "";
    }
    if(email == "null"){
      email = "";
    }
    if(username == "null"){
      username = "";
    }
    if(alamat == "null"){
      alamat = "";
    }
    this.name = name.toString();
    this.email = email.toString();
    this.username = username.toString();
    this.alamat = alamat.toString();
  }
}