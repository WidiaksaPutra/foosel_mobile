// ignore_for_file: must_be_immutable
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ComponenContentDialog_ImageAndTitleTextAndText extends StatelessWidget {
  late String image, titleText, text;
  ComponenContentDialog_ImageAndTitleTextAndText({Key? key,
    required this.image,
    required this.titleText,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            image,
            height: themeBox.defaultHeightBox150,
            width: themeBox.defaultWidthBox152,
          ),
          Text(titleText, style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont18)),
          Padding(
            padding: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox12),
            child: Text(text, style: grayTextStyle2.copyWith(fontWeight: regular, fontSize: defaultFont14)),
          ),
        ],
      ),
    );
  }
}