// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_box.dart';

class ComponenTextButton_315x50 extends StatelessWidget{
  Widget textButton;
  Color colorButton;
  ComponenTextButton_315x50({ Key? key, required this.textButton, required this.colorButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox6),
      decoration: BoxDecoration(
        color: colorButton,
        borderRadius: BorderRadius.circular(themeBox.defaultRadius12),
      ),
      child: textButton,
    );
  }
}