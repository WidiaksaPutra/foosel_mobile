// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';

class ComponenCardVerticalUserTransaksi extends StatelessWidget{
  String icon, textTitle;
  VoidCallback onTap, onLongPress;
  ComponenCardVerticalUserTransaksi({Key? key,
    required this.icon,
    required this.textTitle,
    required this.onTap,
    required this.onLongPress,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    ThemeBox(context).getsizeDevice(context);
    ThemeBox(context);
    return Container(
      margin: EdgeInsets.only(top: ThemeBox.defaultHeightBox22, left: ThemeBox.defaultWidthBox30, right: ThemeBox.defaultWidthBox30),
      child: GestureDetector(
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
            Expanded(child: Text(textTitle, style: whiteTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont15), overflow: TextOverflow.ellipsis)),
          ]
        )
      ),
    );
  }
}