import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';

class HeaderCart extends StatelessWidget {
  final String titleCart;
  final bool statusLeading;
  final VoidCallback onPressed;
  const HeaderCart({Key? key,
    required this.titleCart, 
    required this.statusLeading, 
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

PreferredSizeWidget PreferredHeaderCart({
  required String titleCart, 
  required bool statusLeading, 
  required VoidCallback onPressed,
}){
  return AppBar(
    toolbarHeight: ThemeBox.defaultHeightBox80,
    backgroundColor: kPrimaryColor,
    shadowColor: kBlackColor6,
    automaticallyImplyLeading: false,
    title: HeaderCart(
      titleCart: titleCart,
      statusLeading: statusLeading,
      onPressed: onPressed,
    )
  );
}