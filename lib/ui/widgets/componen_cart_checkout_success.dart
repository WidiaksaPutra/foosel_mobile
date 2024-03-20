import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';

class ComponenCartCheckoutSuccess extends StatelessWidget {
  String image, titleText, messageText;
  Widget componenTextButton_152x44_1, componenTextButton_152x44_2;
  Size size;
  ComponenCartCheckoutSuccess({ Key? key,required this.image, 
    required this.titleText, 
    required this.messageText, 
    required this.componenTextButton_152x44_1,
    required this.componenTextButton_152x44_2,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          width: ThemeBox.defaultWidthBox80,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: ThemeBox.defaultHeightBox20),
          padding: EdgeInsets.symmetric(horizontal: ThemeBox.defaultWidthBox90),
          child: Column(
            children: [
              Text(titleText, style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16), maxLines: 2, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis),
              SizedBox(height: ThemeBox.defaultHeightBox12),
              Text(messageText, style: grayTextStyle2.copyWith(fontWeight: regular, fontSize: defaultFont14), maxLines: 2, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis),
            ]
          ),
        ),
        componenTextButton_152x44_1,
        Padding(
          padding: EdgeInsets.only(top: ThemeBox.defaultHeightBox12),
          child: componenTextButton_152x44_2,
        ),
      ],
    );
  }
}