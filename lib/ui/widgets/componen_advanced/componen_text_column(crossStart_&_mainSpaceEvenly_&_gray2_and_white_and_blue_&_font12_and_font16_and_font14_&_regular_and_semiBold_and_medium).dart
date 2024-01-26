// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_konstanta.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';

class ComponenTextColumn_CrossStartAndMainSpaceEvenlyAndGray2WhiteBlueAndFont12Font16Font14AndRegularSemiBoldMedium extends StatelessWidget {
  late String type, nama, harga;
  ComponenTextColumn_CrossStartAndMainSpaceEvenlyAndGray2WhiteBlueAndFont12Font16Font14AndRegularSemiBoldMedium({Key? key, 
    required this.type, 
    required this.nama,
    required this.harga,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(type, style: grayTextStyle2.copyWith(fontWeight: regular, fontSize: defaultFont12, overflow: TextOverflow.ellipsis)),
        Text(nama, style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont16), maxLines: 2, overflow: TextOverflow.ellipsis),
        (harga.length <= 7)
        ? Text(formatCurrency.format(double.parse(harga.toString()).toInt()), style: blueTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont14, overflow: TextOverflow.ellipsis))
        : Text(formatCurrency.format(double.parse(harga.toString()).toInt()), style: blueTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont14, overflow: TextOverflow.ellipsis))
      ]
    );
  }
}