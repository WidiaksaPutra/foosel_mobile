// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_konstanta.dart';
import 'package:foosel/shared/theme_text_style.dart';

class ComponenContainerHarga extends StatelessWidget {
  late String titleHarga, harga, titleItem, jumlahItem, titleTotalHarga, jumlahTotalHarga;
  ComponenContainerHarga({Key? key,
    this.titleItem = "-",
    this.jumlahItem = "-",
    this.titleTotalHarga = "-",
    this.jumlahTotalHarga = "-",
    required this.titleHarga,
    required this.harga,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    return Container(
      margin: EdgeInsets.only(top: ThemeBox.defaultHeightBox20, bottom: ThemeBox.defaultHeightBox30),
      padding: EdgeInsets.symmetric(vertical: ThemeBox.defaultHeightBox16, horizontal: ThemeBox.defaultWidthBox16),                          
      decoration: BoxDecoration(
        color: kBlackColor4,
        borderRadius: BorderRadius.circular(ThemeBox.defaultRadius4)
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(titleHarga, style: whiteTextStyle.copyWith(fontSize: defaultFont14, fontWeight: regular)),
              Expanded(
                child: Text(formatCurrency.format(double.parse(harga.toString()).toInt()), 
                  style: blueTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont16), 
                  overflow: TextOverflow.fade, textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          if(titleItem != "-" && jumlahItem != "-")...[
            Row(
              children: [
                Text(titleItem, style: whiteTextStyle.copyWith(fontSize: defaultFont14, fontWeight: regular)),
                Expanded(
                  child: Text(jumlahItem, 
                    style: blueTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont16), 
                    overflow: TextOverflow.fade, textAlign: TextAlign.end
                  ),
                ),
              ],
            ),
          ],
          if(titleTotalHarga != "-" && jumlahTotalHarga != "-")...[
            Row(
              children: [
                Text(titleTotalHarga, style: whiteTextStyle.copyWith(fontSize: defaultFont14, fontWeight: regular)),
                Expanded(
                  child: 
                  Text(formatCurrency.format(double.parse(jumlahTotalHarga.toString()).toInt()),
                    style: blueTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont16),
                    textAlign: TextAlign.end, overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
          ]
        ],
      ),
    );
  }
}