// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';

class ComponenRowLike extends StatelessWidget {
  late String name, categoryName;
  late bool like;
  late VoidCallback onTap;
  ComponenRowLike({Key? key, 
    required this.name,
    required this.categoryName,
    required this.like,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: whiteTextStyle.copyWith(fontSize: defaultFont18, fontWeight: semiBold)),
              Text(categoryName, style: grayTextStyle2.copyWith(fontSize: defaultFont12, fontWeight: regular)),
            ],
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Image.asset(
            (like == false) ? 'asset/icon/black_love_icon.png' : 'asset/icon/blue_love_icon.png',
            width: themeBox.defaultWidthBox46,
            height: themeBox.defaultHeightBox46,
          ),
        ),
      ],
    );
  }
}