import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';

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
          padding: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox10, vertical: themeBox.defaultHeightBox4),
          margin: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox10),
          decoration: BoxDecoration(
            color: colorButton,
            borderRadius: BorderRadius.circular(themeBox.defaultRadius12),
          ),
          child: TextButton(
            onPressed: (){
              select;
            },
            child: Text(textButton, style: grayTextStyle3.copyWith(fontWeight: medium, fontSize: defaultFont16)),
          ),  
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox10, vertical: themeBox.defaultHeightBox4),
          margin: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox10),
          decoration: BoxDecoration(
            color: colorButton2,
            borderRadius: BorderRadius.circular(themeBox.defaultRadius12),
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