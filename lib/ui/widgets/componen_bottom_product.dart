// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';

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
    ThemeBox(context);
    return Container(
      color: kPrimaryColor,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: ThemeBox.defaultHeightBox30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(
                  left: ThemeBox.defaultWidthBox30, 
                  right: (statusTransaksi == false) 
                  ? ThemeBox.defaultWidthBox30
                  : ThemeBox.defaultWidthBox16
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kPurpleColor,
                    width: ThemeBox.defaultWidthBox02
                  ),
                  borderRadius: BorderRadius.circular(ThemeBox.defaultRadius12),
                ),
                child: IconButton(
                  padding: EdgeInsets.symmetric(vertical: ThemeBox.defaultHeightBox16, horizontal: ThemeBox.defaultWidthBox16),
                  onPressed: onPressedMessage,
                  icon: Image.asset(
                    'asset/icon/chat_icon2.png',
                    width: ThemeBox.defaultWidthBox23,
                    height: ThemeBox.defaultHeightBox22,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: statusTransaksi,
              child: Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.only(right: ThemeBox.defaultWidthBox30),
                  padding: EdgeInsets.only(top: ThemeBox.defaultHeightBox14, bottom: ThemeBox.defaultHeightBox16),
                  decoration: BoxDecoration(
                    color: kPurpleColor,
                    borderRadius: BorderRadius.circular(ThemeBox.defaultRadius12),
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