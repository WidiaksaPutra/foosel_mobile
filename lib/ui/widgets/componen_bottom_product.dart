// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';

class BottomProduct extends StatelessWidget {
  late String navigationCart, navBack;
  late bool statusTransaksi;
  VoidCallback onPressedMessage, onTapTransaksi;
  BottomProduct({Key? key, 
    required this.navigationCart,
    required this.navBack,
    required this.onPressedMessage,
    required this.statusTransaksi,
    required this.onTapTransaksi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(
                  left: themeBox.defaultWidthBox30, 
                  right: (statusTransaksi == false) 
                  ? themeBox.defaultWidthBox30
                  : themeBox.defaultWidthBox16
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kPurpleColor,
                    width: themeBox.defaultWidthBox02
                  ),
                  borderRadius: BorderRadius.circular(themeBox.defaultRadius12),
                ),
                child: IconButton(
                  padding: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox16, horizontal: themeBox.defaultWidthBox16),
                  onPressed: onPressedMessage,
                  icon: Image.asset(
                    'asset/icon/chat_icon2.png',
                    width: themeBox.defaultWidthBox23,
                    height: themeBox.defaultHeightBox22,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: statusTransaksi,
              child: Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.only(right: themeBox.defaultWidthBox30),
                  padding: EdgeInsets.only(top: themeBox.defaultHeightBox14, bottom: themeBox.defaultHeightBox16),
                  decoration: BoxDecoration(
                    color: kPurpleColor,
                    borderRadius: BorderRadius.circular(themeBox.defaultRadius12),
                  ),
                  child: GestureDetector(
                    onTap: onTapTransaksi,
                    child: Text("Add to Cart", style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont16),textAlign: TextAlign.center,)
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// ShowDialogDetail(
//   buttonName: Text("Add to Cart", style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont16), 
//   textAlign: TextAlign.center), 
//   navigationCart: navigationCart, 
//   navBack: navBack,
// ),