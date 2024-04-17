// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';
import 'package:go_router/go_router.dart';

class ComponenTextIcon extends StatelessWidget {
  String buttonName, icon, navigation;

  ComponenTextIcon({Key? key, required this.buttonName, required this.icon, required this.navigation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go(navigation),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(buttonName, style: grayTextStyle2.copyWith(fontWeight: regular, fontSize: 13)),
          Image.asset(
            icon,
            height: ThemeBox.defaultHeightBox12,
            width: ThemeBox.defaultWidthBox12,
          ),
        ]
      ),
    );
  }
}