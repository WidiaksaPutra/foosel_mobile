// ignore_for_file: must_be_immutable
import 'package:foosel/shared/theme_box.dart';
import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';
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
            height: ThemeBox.defaultHeightBox150,
            width: ThemeBox.defaultWidthBox152,
          ),
          Text(text, style: grayTextStyle2.copyWith(fontWeight: regular, fontSize: defaultFont14)),
        ],
      ),
    );
  }
}