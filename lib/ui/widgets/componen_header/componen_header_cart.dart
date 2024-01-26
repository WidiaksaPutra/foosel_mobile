import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';
import 'package:go_router/go_router.dart';

PreferredSizeWidget headerCart({
  required String titleCart, 
  required bool statusLeading, 
  required String navigationCart, 
  required String statusNav,
  required String navBack,
  required BuildContext context,
}){
  return AppBar(
    toolbarHeight: themeBox.defaultHeightBox80,
    backgroundColor: kPrimaryColor,
    shadowColor: kBlackColor6,
    automaticallyImplyLeading: false,
    title: Row(
      mainAxisAlignment: (statusLeading == true) ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if(statusLeading == true)...[
          IconButton(
            onPressed: () => (statusNav == 'true') ? context.go(navBack) : context.go(navigationCart), 
            icon: Image.asset(
              "asset/icon/icon_button_back.png",
              height: themeBox.defaultHeightBox12,
              width: themeBox.defaultWidthBox6,
            ),
          ),
        ],
        Text(titleCart, style: whiteTextStyle.copyWith(fontSize: defaultFont18, fontWeight: medium)), 
        SizedBox(width: themeBox.defaultWidthBox6),
      ]
    ),
  );
}