import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_konstanta.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';

class ComponenContainerHarga extends StatelessWidget {
  String titleHarga, harga;
  ComponenContainerHarga({Key? key, required this.titleHarga, required this.harga}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: themeBox.defaultHeightBox20, bottom: themeBox.defaultHeightBox30),
      padding: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox16, horizontal: themeBox.defaultWidthBox16),                          
      decoration: BoxDecoration(
        color: kBlackColor4,
        borderRadius: BorderRadius.circular(themeBox.defaultRadius4)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(titleHarga, style: whiteTextStyle.copyWith(fontSize: defaultFont14, fontWeight: regular)),
          Text(formatCurrency.format(double.parse(harga.toString()).toInt()), style: blueTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont16)),
        ],
      ),
    );
  }
}