// ignore_for_file: must_be_immutable
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_basic/componen_basic_button.dart';
import 'package:lottie/lottie.dart';

class ComponenContentDialog_ImageAndTitleTextAndButtonText extends StatelessWidget {
  late String image, text;
  late VoidCallback onTap;
  ComponenContentDialog_ImageAndTitleTextAndButtonText({Key? key,
    required this.image,
    required this.text,
    required this.onTap,
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
          Text(text, style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont18)),
          Padding(
            padding: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox10),
            child: ComponenBasicButton(
              paddingVertical: 0, 
              borderRadius: themeBox.defaultRadius5, 
              content: Icon(
                Icons.refresh,
                color: kBlackColor,
              ),
              onPressed: onTap, 
              primaryColor: kYellowColor, 
              secondaryColor: kGreyColor,
            ),
          )
        ],
      ),
    );
  }
}