// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';

class ComponenChatBubbleBasic extends StatelessWidget {
  late String dataMessage, userPenerima, jenisUserMessage, dataTimeMinute;
  late bool dataIsRead;
  // final bool bSpace;
  ComponenChatBubbleBasic({Key? key, required this.dataMessage, required this.userPenerima, required this.jenisUserMessage, required this.dataTimeMinute, required this.dataIsRead}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    return Row(
      mainAxisAlignment: (jenisUserMessage == userPenerima) ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(
            // top:(bSpace == true) ? defaultHeightBox30 : defaultHeightBox12,
            top: ThemeBox.defaultHeightBox12,
            right: (jenisUserMessage == userPenerima) ? ThemeBox.defaultWidthBox30 : 0,
            left: (jenisUserMessage == userPenerima) ? 0 : ThemeBox.defaultWidthBox30
          ),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width*0.6,
          ),
          decoration: BoxDecoration(
            color: (jenisUserMessage == userPenerima) ? kPurpleBlackColor : kBlackColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular((jenisUserMessage == userPenerima) ? ThemeBox.defaultRadius12 : 0),
              topRight: Radius.circular((jenisUserMessage == userPenerima) ? 0 : ThemeBox.defaultRadius12), 
              bottomLeft: Radius.circular(ThemeBox.defaultRadius12), 
              bottomRight: Radius.circular(ThemeBox.defaultRadius12),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(top: ThemeBox.defaultWidthBox16, left: ThemeBox.defaultHeightBox12, right: ThemeBox.defaultHeightBox12),
                child: Text(dataMessage, style: whiteTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont14)),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(dataTimeMinute, style: grayTextStyle2.copyWith(fontWeight: light, fontSize: defaultFont8)),
                  (jenisUserMessage == userPenerima)
                  ? (dataIsRead == true)
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: ThemeBox.defaultWidthBox5),
                        child: Icon(
                          Icons.check, 
                          color: kBlueColor, 
                          size: ThemeBox.defaultWidthBox20,
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: ThemeBox.defaultWidthBox5),
                        child: Icon(
                          Icons.check, 
                          color: kGreyColor, 
                          size: ThemeBox.defaultWidthBox20,
                        ),
                      )
                  : SizedBox(width: ThemeBox.defaultWidthBox5),
                ],
              ),
              SizedBox(height: ThemeBox.defaultWidthBox8),
            ]
          ),
        ),
      ]
    );
  }
}