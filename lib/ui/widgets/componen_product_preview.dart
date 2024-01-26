import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_konstanta.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';

class ComponenProductPreview extends HookWidget {
  final String image, title, harga;
  ComponenProductPreview({Key? key, required this.image, required this.title, required this.harga}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: themeBox.defaultWidthBox20, bottom: themeBox.defaultHeightBox20, right: themeBox.defaultWidthBox130),
      padding: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox10, vertical: themeBox.defaultHeightBox10),
      decoration: BoxDecoration(
        color: kPurpleBlackColor,
        borderRadius: BorderRadius.circular(themeBox.defaultRadius12),
        border: Border.all(
          color: kPurpleColor,
          width: themeBox.defaultWidthBox1,
        )
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(themeBox.defaultRadius12),
            child: Image.asset(
              image.toString(),
              width: themeBox.defaultWidthBox54,
              height: themeBox.defaultHeightBox54,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: themeBox.defaultWidthBox10, right: themeBox.defaultWidthBox19),
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
              margin: EdgeInsets.only(bottom: themeBox.defaultHeightBox32),
              padding: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox8, vertical: themeBox.defaultHeightBox8),
              decoration: BoxDecoration(
                color: kPurpleColor,
                borderRadius: BorderRadius.circular(themeBox.defaultRadius50),
              ),
              child: Image.asset(
                "asset/icon/remove_product_icon.png",
                height: themeBox.defaultHeightBox6,
                width: themeBox.defaultWidthBox6,
              ),
            ),
          )
        ],
      ),
    );
  }
}