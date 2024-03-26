// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:foosel/blocs/bloc_default/class/class/splash_screen_user_role.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/ui/widgets/componen_loading.dart';

class SplashScreen extends StatelessWidget{
  SplashScreen({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    SplashScreenUserRole().splashScreenUserRole(context: context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(child: ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200)),
    );
  }
}