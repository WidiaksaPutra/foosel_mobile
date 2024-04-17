import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_bottom_nav_pembeli/cubit_bottom_nav_pembeli.dart';
import 'package:foosel/blocs/bloc_bottom_nav_penjual/cubit_bottom_nav_penjual.dart';
import 'package:foosel/routes/route_name.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin NavigasiRole{
  late String navigation = "";
  Future<void> navigasiR() async{
    final _tokenUser = await SharedPreferences.getInstance();
    Map<String, dynamic> _decodeTokenUser = JwtDecoder.decode(_tokenUser.getString('token').toString());
    if(_decodeTokenUser['roles'].toString() == "PEMBELI"){
      navigation = RouteName.bottomNavPembeli;
    }else if(_decodeTokenUser['roles'].toString() == "PENJUAL"){
      navigation = RouteName.bottomNavPenjual;
    }
  }
}

mixin NavigasiRoleBarRead{
  Future<void> navigasiRBR({required BuildContext context, required int value}) async{
    final _tokenUser = await SharedPreferences.getInstance();
    Map<String, dynamic> _decodeTokenUser = JwtDecoder.decode(_tokenUser.getString('token').toString());
    if(_decodeTokenUser['roles'].toString() == "PEMBELI"){
      context.read<CubitBottomNavPembeli>().navigation(currentButton: value);
    }else if(_decodeTokenUser['roles'].toString() == "PENJUAL"){
      context.read<CubitBottomNavPenjual>().navigation(currentButton: value);
    }
  }
}