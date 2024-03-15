// ignore_for_file: must_be_immutable
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:foosel/blocs/bloc_default/default/default_roles.dart';
import 'package:foosel/routes/route_name.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget with roleAcces{
  SplashScreen({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    rolesUser();
    Timer(
      const Duration(seconds: 2),
      (){
        // return Get.to(BeforeTest());
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
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset(
              "asset/animations/loading_basic_lottie.json",
              height: themeBox.defaultWidthBox215,
              width: themeBox.defaultHeightBox300,
            ),
          ), 
        ],
      ),
    );
  }
}