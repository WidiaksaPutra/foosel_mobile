// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';

class ComponenMessageCardVertical extends StatelessWidget {
  String icon, textTitle, textSubTitle, textTailing;
  VoidCallback onTap, onLongPress;
  ComponenMessageCardVertical({Key? key,
    required this.icon,
    required this.textTitle, 
    required this.textSubTitle, 
    required this.textTailing,
    required this.onTap,
    required this.onLongPress,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      onTap: onTap,
      child: Row(
        children:[
          Padding(
            padding: EdgeInsets.only(right: ThemeBox.defaultWidthBox12),
            child: ClipOval(
              child: Image.network(
                icon.toLowerCase(), 
                height: ThemeBox.defaultHeightBox54, 
                width: ThemeBox.defaultWidthBox54, 
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(textTitle, style: whiteTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont15), overflow: TextOverflow.ellipsis),
                Text(textSubTitle, style: grayTextStyle2.copyWith(fontWeight: light, fontSize: defaultFont10), overflow: TextOverflow.ellipsis),
              ]
            )
          ),
          Padding(
            padding: EdgeInsets.only(left: ThemeBox.defaultWidthBox38),
            child: Text(textTailing, style: grayTextStyle2.copyWith(fontWeight: regular, fontSize: defaultFont10), textAlign: TextAlign.end, overflow: TextOverflow.ellipsis),
          ),
        ]
      ),
    );
  }
}