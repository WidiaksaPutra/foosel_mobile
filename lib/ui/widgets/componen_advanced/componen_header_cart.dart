import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';

PreferredSizeWidget headerCart({
  required String titleCart, 
  required bool statusLeading, 
  required VoidCallback onPressed,
  required BuildContext context,
}){
  return AppBar(
    toolbarHeight: ThemeBox.defaultHeightBox80,
    backgroundColor: kPrimaryColor,
    shadowColor: kBlackColor6,
    automaticallyImplyLeading: false,
    title: Row(
      mainAxisAlignment: (statusLeading == true) ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if(statusLeading == true)...[
          IconButton(
            onPressed: onPressed, 
            icon: Image.asset(
              "asset/icon/icon_button_back.png",
              height: ThemeBox.defaultHeightBox12,
              width: ThemeBox.defaultWidthBox6,
            ),
          ),
        ],
        Expanded(child: Text(titleCart, style: whiteTextStyle.copyWith(fontSize: defaultFont18, fontWeight: medium), overflow: TextOverflow.ellipsis,)), 
        SizedBox(width: ThemeBox.defaultWidthBox6),
      ]
    ),
  );
}