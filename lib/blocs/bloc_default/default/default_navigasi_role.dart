import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_bottom_nav_pembeli/cubit_bottom_nav_pembeli.dart';
import 'package:foosel/blocs/bloc_bottom_nav_penjual/cubit_bottom_nav_penjual.dart';
import 'package:foosel/routes/route_name.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin navigasiRole{
  late String navigation = "";
  navigasiR() async{
    final tokenUser = await SharedPreferences.getInstance();
    Map<String, dynamic> decodeTokenUser = JwtDecoder.decode(tokenUser.getString('token').toString());
    if(decodeTokenUser['roles'].toString() == "PEMBELI"){
      navigation = RouteName.bottomNavPembeli;
    }else if(decodeTokenUser['roles'].toString() == "PENJUAL"){
      navigation = RouteName.bottomNavPenjual;
    }
  }
}

mixin navigasiRoleBarRead{
  navigasiRBR({required BuildContext context, required int value}) async{
    final tokenUser = await SharedPreferences.getInstance();
    Map<String, dynamic> decodeTokenUser = JwtDecoder.decode(tokenUser.getString('token').toString());
    if(decodeTokenUser['roles'].toString() == "PEMBELI"){
      context.read<cubitBottomNavPembeli>().navigation(currentButton: value);
    }else if(decodeTokenUser['roles'].toString() == "PENJUAL"){
      context.read<cubitBottomNavPenjual>().navigation(currentButton: value);
    }
  }
}