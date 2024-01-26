// ignore_for_file: must_be_immutable
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_basic/componen_basic_button.dart';
import 'package:lottie/lottie.dart';

class ComponenContentDialog_ImageAndTitleTextAndButtonYesAndButtonNo extends StatelessWidget {
  late String image, titleText;
  late VoidCallback onTapYes;
  ComponenContentDialog_ImageAndTitleTextAndButtonYesAndButtonNo({Key? key,
    required this.image,
    required this.titleText,
    required this.onTapYes,
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
          Text(titleText, style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont14)),
          Padding(
            padding: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ComponenBasicButton(
                  paddingVertical: 0, 
                  borderRadius: themeBox.defaultRadius5, 
                  content: Icon(
                    Icons.check,
                    color: kBlackColor,
                  ),
                  onPressed: onTapYes, 
                  primaryColor: kRedColor, 
                  secondaryColor: kGreyColor,
                ),
                ComponenBasicButton(
                  paddingVertical: 0, 
                  borderRadius: themeBox.defaultRadius5, 
                  content: Icon(
                    Icons.close,
                    color: kBlackColor,
                  ),
                  onPressed: (){
                    Navigator.of(context).pop();
                  }, 
                  primaryColor: kYellowColor, 
                  secondaryColor: kGreyColor,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}