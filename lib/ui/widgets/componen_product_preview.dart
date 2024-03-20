import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_konstanta.dart';
import 'package:foosel/shared/theme_text_style.dart';

class ComponenProductPreview extends HookWidget {
  final String image, title, harga;
  ComponenProductPreview({Key? key, required this.image, required this.title, required this.harga}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: ThemeBox.defaultWidthBox20, bottom: ThemeBox.defaultHeightBox20, right: ThemeBox.defaultWidthBox130),
      padding: EdgeInsets.symmetric(horizontal: ThemeBox.defaultWidthBox10, vertical: ThemeBox.defaultHeightBox10),
      decoration: BoxDecoration(
        color: kPurpleBlackColor,
        borderRadius: BorderRadius.circular(ThemeBox.defaultRadius12),
        border: Border.all(
          color: kPurpleColor,
          width: ThemeBox.defaultWidthBox1,
        )
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(ThemeBox.defaultRadius12),
            child: Image.asset(
              image.toString(),
              width: ThemeBox.defaultWidthBox54,
              height: ThemeBox.defaultHeightBox54,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: ThemeBox.defaultWidthBox10, right: ThemeBox.defaultWidthBox19),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title.toString(), style: whiteTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont14), overflow: TextOverflow.ellipsis),
                  Text(formatCurrencyShort.format(double.parse(harga.toString()).toInt()),
                    style: blueTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont14), overflow: TextOverflow.ellipsis,
                  )
                ]
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(bottom: ThemeBox.defaultHeightBox32),
              padding: EdgeInsets.symmetric(horizontal: ThemeBox.defaultWidthBox8, vertical: ThemeBox.defaultHeightBox8),
              decoration: BoxDecoration(
                color: kPurpleColor,
                borderRadius: BorderRadius.circular(ThemeBox.defaultRadius50),
              ),
              child: Image.asset(
                "asset/icon/remove_product_icon.png",
                height: ThemeBox.defaultHeightBox6,
                width: ThemeBox.defaultWidthBox6,
              ),
            ),
          )
        ],
      ),
    );
  }
}