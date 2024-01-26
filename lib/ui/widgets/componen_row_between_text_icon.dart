import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';
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
            height: themeBox.defaultHeightBox12,
            width: themeBox.defaultWidthBox12,
          ),
        ]
      ),
    );
  }
}