// ignore_for_file: must_be_immutable
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';
import 'package:lottie/lottie.dart';

class ComponenContentDialog_ImageAndTitleText extends StatelessWidget {
  late String image, text;
  ComponenContentDialog_ImageAndTitleText({Key? key,
    required this.image,
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
          Text(text, style: grayTextStyle2.copyWith(fontWeight: regular, fontSize: defaultFont14)),
        ],
      ),
    );
  }
}