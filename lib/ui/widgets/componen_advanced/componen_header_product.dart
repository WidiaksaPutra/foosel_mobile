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
    height: ThemeBox.defaultHeightBox62,
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
              height: ThemeBox.defaultHeightBox22,
              width: ThemeBox.defaultWidthBox20,
            )
          : Text(""),
        ),
      ]
    ),
  );
}