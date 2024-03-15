import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/ui/widgets/componen_advanced/compenen_get_back.dart';
import 'package:foosel/shared/theme_box.dart';

Widget headerDetailProduct({
  required BuildContext context,
  required bool guestUser,
  required VoidCallback onPressedChart,
  required VoidCallback onPressedBack,
  required String icon,
}){
  return Container(
    height: themeBox.defaultHeightBox62,
    color: kGreyColor6,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [ 
        CompenenGetBackBasic2(onPressedBack: onPressedBack),
        IconButton(
          onPressed: onPressedChart,
          icon: (guestUser == false)
          ? Image.asset(
              icon,
              height: themeBox.defaultHeightBox22,
              width: themeBox.defaultWidthBox20,
            )
          : Text(""),
        ),
      ]
    ),
  );
}