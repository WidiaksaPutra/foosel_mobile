// ignore_for_file: must_be_immutable
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_roles.dart';
import 'package:foosel/routes/route_name.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/ui/widgets/componen_loading.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget with RoleAcces{
  SplashScreen({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
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
      body: Center(child: ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200)),
    );
  }
}