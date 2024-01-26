import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_konstanta.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class ComponenCardHorizontal extends StatelessWidget {
  String gambar, jenis, nama, harga, navigation;
  ComponenCardHorizontal ({Key? key, required this.gambar, required this.jenis, required this.nama, required this.harga, required this.navigation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go(navigation),
      child: Container(
        margin: EdgeInsets.only(top: themeBox.defaultHeightBox14, right: themeBox.defaultWidthBox30),
        width: themeBox.defaultWidthBox215,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(themeBox.defaultRadius20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              gambar,
              height: themeBox.defaultHeightBox120,
            ),
            Padding(
              padding: EdgeInsets.only(left: themeBox.defaultWidthBox20, right: themeBox.defaultWidthBox20),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                    Text(jenis, style: grayTextStyle2.copyWith(fontWeight: regular, fontSize: defaultFont12), overflow: TextOverflow.ellipsis),
                    Text(nama, style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont18), maxLines: 2, overflow: TextOverflow.ellipsis),
                    Text(formatCurrencyShort.format(double.parse(harga.toString()).toInt()), style: blueTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont14), overflow: TextOverflow.ellipsis)
                  ]
                ),
              ),
            )
          ]
        ),
      ),
    );
  }
}