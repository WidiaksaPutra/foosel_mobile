// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';

class ComponenDoubleButton extends StatelessWidget {
  Color colorButton, colorButton2;
  dynamic select, select2;
  String textButton, textButton2;
  ComponenDoubleButton({Key? key,
    required this.colorButton,
    required this.colorButton2,
    required this.select,
    required this.select2, 
    required this.textButton,
    required this.textButton2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: ThemeBox.defaultWidthBox10, vertical: ThemeBox.defaultHeightBox4),
          margin: EdgeInsets.symmetric(vertical: ThemeBox.defaultHeightBox10),
          decoration: BoxDecoration(
            color: colorButton,
            borderRadius: BorderRadius.circular(ThemeBox.defaultRadius12),
          ),
          child: TextButton(
            onPressed: (){
              select;
            },
            child: Text(textButton, style: grayTextStyle3.copyWith(fontWeight: medium, fontSize: defaultFont16)),
          ),  
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: ThemeBox.defaultWidthBox10, vertical: ThemeBox.defaultHeightBox4),
          margin: EdgeInsets.symmetric(vertical: ThemeBox.defaultHeightBox10),
          decoration: BoxDecoration(
            color: colorButton2,
            borderRadius: BorderRadius.circular(ThemeBox.defaultRadius12),
          ),
          child: TextButton(
            onPressed: (){
              select2;
            },
            child: Text(textButton2, style: grayTextStyle3.copyWith(fontWeight: medium, fontSize: defaultFont16)),
          ),  
        ),
      ],
    );
  }
}