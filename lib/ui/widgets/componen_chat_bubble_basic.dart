import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';

class ComponenChatBubbleBasic extends StatelessWidget {
  final String dataMessage, userPenerima, jenisUserMessage, dataTimeMinute;
  final bool dataIsRead;

  // final bool bSpace;
  const ComponenChatBubbleBasic({Key? key, required this.dataMessage, required this.userPenerima, required this.jenisUserMessage, required this.dataTimeMinute, required this.dataIsRead}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: (jenisUserMessage == userPenerima) ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(
            // top:(bSpace == true) ? defaultHeightBox30 : defaultHeightBox12,
            top: themeBox.defaultHeightBox12,
            right: (jenisUserMessage == userPenerima) ? themeBox.defaultWidthBox30 : 0,
            left: (jenisUserMessage == userPenerima) ? 0 : themeBox.defaultWidthBox30
          ),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width*0.6,
          ),
          decoration: BoxDecoration(
            color: (jenisUserMessage == userPenerima) ? kPurpleBlackColor : kBlackColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular((jenisUserMessage == userPenerima) ? themeBox.defaultRadius12 : 0),
              topRight: Radius.circular((jenisUserMessage == userPenerima) ? 0 : themeBox.defaultRadius12), 
              bottomLeft: Radius.circular(themeBox.defaultRadius12), 
              bottomRight: Radius.circular(themeBox.defaultRadius12),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(top: themeBox.defaultWidthBox16, left: themeBox.defaultHeightBox12, right: themeBox.defaultHeightBox12),
                child: Text(dataMessage, style: whiteTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont14)),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(dataTimeMinute, style: grayTextStyle2.copyWith(fontWeight: light, fontSize: defaultFont8)),
                  (jenisUserMessage == userPenerima)
                  ? (dataIsRead == true)
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox5),
                        child: Icon(
                          Icons.check, 
                          color: kBlueColor, 
                          size: themeBox.defaultWidthBox20,
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox5),
                        child: Icon(
                          Icons.check, 
                          color: kGreyColor, 
                          size: themeBox.defaultWidthBox20,
                        ),
                      )
                  : SizedBox(width: themeBox.defaultWidthBox5),
                ],
              ),
              SizedBox(height: themeBox.defaultWidthBox8),
            ]
          ),
        ),
      ]
    );
  }
}