import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';
import 'package:go_router/go_router.dart';

class ComponenTextButton_152x44_Basic extends StatelessWidget {
  String page, text;
  Color buttonColor;
  ComponenTextButton_152x44_Basic({ Key? key, required this.text, required this.page, required this.buttonColor }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox24, vertical: themeBox.defaultHeightBox4),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(themeBox.defaultRadius12),
      ),
      child: TextButton(
        onPressed: () => context.go(page), 
        child: Text(text, style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16)),
      ),
    );
  }
}

class ComponenTextButton_152x44_Basic2 extends StatelessWidget {
  String page, text;
  Color buttonColor;
  ComponenTextButton_152x44_Basic2({ Key? key, required this.text, required this.page, required this.buttonColor }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox40, vertical: themeBox.defaultHeightBox4),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(themeBox.defaultRadius12),
      ),
      child: TextButton(
        onPressed: () => context.go(page), 
        child: Text(text, style: grayTextStyle3.copyWith(fontWeight: medium, fontSize: defaultFont16)),
      ),
    );
  }
}