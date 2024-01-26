import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';
import 'package:flutter_svg/svg.dart';

class ComponenFormKosong extends StatelessWidget {
  bool formVisible;
  String message;
  ComponenFormKosong({Key? key, required this.formVisible, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: formVisible,
      child: Padding(
        padding: EdgeInsets.only(top: themeBox.defaultHeightBox5),
        child: Row(
          children: [
            SvgPicture.asset(
              "asset/icon/Error.svg",
              height: 14,
              width: 14,
            ),
            SizedBox(width: themeBox.defaultWidthBox4),
            Text(message, style: redTextStyle.copyWith(fontSize: defaultFont12, fontWeight: regular)),
          ]
        ),
      ),
    );
  }
}