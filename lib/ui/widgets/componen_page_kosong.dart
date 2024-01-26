import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';
import 'package:lottie/lottie.dart';

class ComponenPageKosongBasic extends StatelessWidget {
  String image, titleText, messageText;
  Size size;
  ComponenPageKosongBasic({ Key? key,
    required this.image, 
    required this.titleText, 
    required this.messageText, 
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: themeBox.defaultHeightBox340,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox20),
              child: Column(
                children: [
                  Text(titleText, style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16)),
                  SizedBox(height: themeBox.defaultHeightBox12),
                  Text(messageText, style: grayTextStyle2.copyWith(fontWeight: regular, fontSize: defaultFont14)),
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ComponenPageKosong extends StatelessWidget {
  String image, titleText, messageText;
  Widget componenTextButton_152x44;
  double sizeWidth, sizeHeight;
  ComponenPageKosong({ Key? key,
    required this.image, 
    required this.titleText, 
    required this.messageText, 
    required this.componenTextButton_152x44,
    required this.sizeWidth,
    required this.sizeHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sizeWidth,
      height: sizeHeight,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox20),
              child: Column(
                children: [
                  Lottie.asset(
                    image,
                    height: themeBox.defaultHeightBox250,
                  ),
                  Text(titleText, style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16)),
                  SizedBox(height: themeBox.defaultHeightBox12),
                  Text(messageText, style: grayTextStyle2.copyWith(fontWeight: regular, fontSize: defaultFont14)),
                ]
              ),
            ),
            componenTextButton_152x44,
          ],
        ),
      ),
    );
  }
}