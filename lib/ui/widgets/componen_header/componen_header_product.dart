import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_data_dummy.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_get_back.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';

Widget headerDetailProduct({
  required BuildContext context,
  required bool guestUser,
  required VoidCallback onPressedChart,
  required VoidCallback onPressedBack,
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
              (ListDataCart.isEmpty) ? "asset/icon/cart_Icon3.png" : "asset/icon/cart_Icon4.png",
              height: themeBox.defaultHeightBox22,
              width: themeBox.defaultWidthBox20,
            )
          : Text(""),
        ),
      ]
    ),
  );
}