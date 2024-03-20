// ignore_for_file: must_be_immutable
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';
import 'package:flutter/material.dart';
import 'package:foosel/ui/widgets/componen_basic/componen_basic_button.dart';
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
            height: ThemeBox.defaultHeightBox150,
            width: ThemeBox.defaultWidthBox152,
          ),
          Text(text, style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont18)),
          Padding(
            padding: EdgeInsets.symmetric(vertical: ThemeBox.defaultHeightBox10),
            child: ComponenBasicButton(
              paddingVertical: 0, 
              borderRadius: ThemeBox.defaultRadius5, 
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