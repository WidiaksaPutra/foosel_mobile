// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_konstanta.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_konstanta.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';

class ComponenCardVertical_ImageAndTextAndButtonAddAndButtonMinAndButtonDelete extends StatelessWidget {
  late bool connection;
  late String image, textTitle, harga, jumlah, iconAdd, iconMin;
  late VoidCallback onTapAdd, onTapMin, onTapDelete, onTapCard;
  ComponenCardVertical_ImageAndTextAndButtonAddAndButtonMinAndButtonDelete({Key? key, 
    required this.connection,
    required this.image, 
    required this.textTitle, 
    required this.harga, 
    required this.jumlah, 
    required this.iconAdd, 
    required this.iconMin,
    required this.onTapAdd,
    required this.onTapMin,
    required this.onTapDelete,
    required this.onTapCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: themeBox.defaultHeightBox30, left: themeBox.defaultWidthBox30, right: themeBox.defaultWidthBox30),
      padding: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox10, horizontal: themeBox.defaultHeightBox16),
      decoration: BoxDecoration(
        color: kBlackColor,
        borderRadius: BorderRadius.circular(themeBox.defaultRadius12),
      ),
      child: GestureDetector(
        onTap: onTapCard,
        child: Column(
          children: [
            Row(
              children:[
                Padding(
                  padding: EdgeInsets.only(right: themeBox.defaultWidthBox12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(themeBox.defaultRadius12),
                    child: (connection == true)
                    ? Image.network(
                        "${Api.baseURLImage}$image", 
                        height: themeBox.defaultHeightBox60, 
                        width: themeBox.defaultWidthBox60,
                        alignment: Alignment.centerLeft
                      )
                    : Image.asset(
                        "asset/image/sampel_sepatu_home_small_4.png", 
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
                Column(
                  children: [
                    GestureDetector(
                      onTap: onTapAdd, 
                      child: Image.asset(
                        iconAdd,
                        height: themeBox.defaultHeightBox16, 
                        width: themeBox.defaultWidthBox16,
                        alignment: Alignment.centerLeft
                      ),
                    ),
                    Text(jumlah, style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont14), overflow: TextOverflow.ellipsis),
                    GestureDetector(
                      onTap: onTapMin, 
                      child: Image.asset(
                        iconMin, 
                        height: themeBox.defaultHeightBox16, 
                        width: themeBox.defaultWidthBox16,
                        alignment: Alignment.centerLeft
                      ),
                    ),
                  ]
                ), 
              ]
            ),
            Padding(
              padding: EdgeInsets.only(top: themeBox.defaultHeightBox12),
              child: GestureDetector(
                onTap: onTapDelete,
                child: Row(
                  children:[
                    Image.asset(
                      "asset/icon/icon_subtract.png",
                      width: themeBox.defaultWidthBox10,
                      height: themeBox.defaultHeightBox12,
                    ),
                    Text(" Remove", style: redTextStyle.copyWith(fontWeight: light, fontSize: defaultFont12)),
                  ]
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}