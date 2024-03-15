// ignore_for_file: must_be_immutable
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';
import 'package:flutter/material.dart';
import 'package:foosel/ui/widgets/componen_basic/componen_basic_button.dart';
import 'package:lottie/lottie.dart';

class ComponenContentDialog_ImageAndTitleTextAndButtonYesAndButtonNo extends StatelessWidget {
  late String image, titleText;
  late Color primaryColorYes, primaryColorNo;
  late VoidCallback onTapYes;
  ComponenContentDialog_ImageAndTitleTextAndButtonYesAndButtonNo({Key? key,
    this.primaryColorYes = kRedColor,
    this.primaryColorNo = kYellowColor,
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
                  primaryColor: primaryColorYes, 
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
                  primaryColor: primaryColorNo, 
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