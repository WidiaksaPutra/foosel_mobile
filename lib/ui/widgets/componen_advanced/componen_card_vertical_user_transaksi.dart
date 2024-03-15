// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foosel/blocs/bloc_default/default/size_device.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';

class ComponenCardVerticalUserTransaksi extends StatelessWidget with sizeDevice{
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
    getsizeDevice(context);
    themeBox(context);
    return Container(
      margin: EdgeInsets.only(top: themeBox.defaultHeightBox22, left: themeBox.defaultWidthBox30, right: themeBox.defaultWidthBox30),
      child: GestureDetector(
        onLongPress: onLongPress,
        onTap: onTap,
        child: Row(
          children:[
            Padding(
              padding: EdgeInsets.only(right: themeBox.defaultWidthBox12),
              child: ClipOval(
                child: Image.network(
                  icon.toLowerCase(), 
                  height: themeBox.defaultHeightBox54, 
                  width: themeBox.defaultWidthBox54, 
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