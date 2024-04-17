import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';

// ignore: must_be_immutable
class ComponenHeadForm extends StatelessWidget {
  String labelWhite, labelGrey;
  ComponenHeadForm({ Key? key, required this.labelWhite, required this.labelGrey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    return Container(
      margin: EdgeInsets.only(top: ThemeBox.defaultHeightBox30, left: ThemeBox.defaultWidthBox30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text(labelWhite, style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont24)),
          SizedBox(height: ThemeBox.defaultHeightBox2),
          Text(labelGrey, style: grayTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont14)),
        ]
      ),
    );
  }
}

