import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foosel/blocs/bloc_default/class/interfaces/interfaces_splash_screen_user_role.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_roles.dart';
import 'package:foosel/routes/route_name.dart';
import 'package:go_router/go_router.dart';

class SplashScreenUserRole with RoleAcces implements InterfacesSplashScreenUserRole{
  @override
  Future<void> splashScreenUserRole({required BuildContext context}) async{
    rolesUser();
    await Timer(
      const Duration(seconds: 2),
      (){
        if(tokens != 'null'){
          return (role == "PENJUAL")
          ? context.go(RouteName.bottomNavPenjual) 
          : (role == "PEMBELI")
            ? context.go(RouteName.bottomNavPembeli)
            : context.go(RouteName.homeGuest);
        }else{
          return context.go(RouteName.homeGuest); 
        }      // (prefs.get("token") != null) ? Get.offNamed(RouteName.bottomNavPembeli) : Get.offNamed(RouteName.login);
      }
    );
  }
}