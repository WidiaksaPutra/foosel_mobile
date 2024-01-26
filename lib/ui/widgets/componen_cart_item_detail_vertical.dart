// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_konstanta.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_konstanta.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';

class ComponenCartItemDetailVertical extends StatelessWidget {
  late String image, textTitle, harga, jumlah;
  late VoidCallback onTapCard;
  ComponenCartItemDetailVertical({Key? key,
    required this.image,
    required this.textTitle,
    required this.harga,
    required this.jumlah,
    required this.onTapCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCard,
      child: Container(
        margin: EdgeInsets.only(top: themeBox.defaultHeightBox12),
        padding: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox20, horizontal: themeBox.defaultHeightBox12),
        decoration: BoxDecoration(
          color: kBlackColor,
          borderRadius: BorderRadius.circular(themeBox.defaultRadius12),
        ),
        child: Row(
          children:[
            Padding(
              padding: EdgeInsets.only(right: themeBox.defaultWidthBox12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(themeBox.defaultRadius12),
                child: Image.network(
                  "${Api.baseURLImage}$image", 
                  height: themeBox.defaultHeightBox60, 
                  width: themeBox.defaultWidthBox60, 
                  alignment: Alignment.centerLeft
                ),
              )
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(textTitle, style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont14), overflow: TextOverflow.ellipsis),
                  Text(formatCurrency.format(double.parse(harga.toString()).toInt()), style: blueTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont14), overflow: TextOverflow.ellipsis),
                ]
              )
            ), 
            Text("$jumlah Items", style: grayTextStyle2.copyWith(fontWeight: regular, fontSize: defaultFont12)),
          ]
        )
      ),
    );
  }

  // ListTile(
  //     leading: Image.asset(
  //       icon,
  //       height: 54),
  //     title: Text(textTitle, style: whiteTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont15)),
  //     subtitle: Text(textSubTitle, style: grayTextStyle2.copyWith(fontWeight: light, fontSize: defaultFont14)),
  //     trailing: Text(textTailing, style: grayTextStyle2.copyWith(fontWeight: regular, fontSize: defaultFont10)),
  //   );
}