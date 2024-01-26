import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';

class ComponenHeadForm extends StatelessWidget {
  String labelWhite, labelGrey;
  ComponenHeadForm({ Key? key, required this.labelWhite, required this.labelGrey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: themeBox.defaultHeightBox30, left: themeBox.defaultWidthBox30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text(labelWhite, style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont24)),
          SizedBox(height: themeBox.defaultHeightBox2),
          Text(labelGrey, style: grayTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont14)),
        ]
      ),
    );
  }
}

