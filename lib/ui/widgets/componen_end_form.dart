// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';
import 'package:go_router/go_router.dart';

class ComponenEndForm extends StatelessWidget with SharedPref{
  String labelGray, labelPurple;
  String navigasiPage, navBack;
  BuildContext contextGo;

  ComponenEndForm({ Key? key,
    required this.labelGray, 
    required this.labelPurple, 
    required this.navigasiPage,
    required this.contextGo,
    required this.navBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    sharedPref();
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: ThemeBox.defaultHeightBox30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                labelGray, 
                style: grayTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont12),
              ),
              TextButton(
                onPressed: () {
                  prefs.remove('emailRegister');
                  prefs.remove('passwordRegister');
                  prefs.remove('fullNameRegister');
                  prefs.remove('usernameRegister');
                  return (navigasiPage != "back") 
                    ? contextGo.go(navigasiPage) 
                    : contextGo.go(navBack);
                },
                child: Text(
                  labelPurple,
                  style: purpleTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont12), 
                ),
              ),
            ],
          )
        ),
      ],
    );
  }
}