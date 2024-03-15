// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_konstanta.dart';
import 'package:foosel/shared/theme_text_style.dart';

class ComponenTextColumn_CrossStartAndMainSpaceEvenlyAndGray2WhiteBlueAndFont12Font16Font14AndRegularSemiBoldMedium extends StatelessWidget {
  late String type, nama, harga, jumlahItem, totalHarga, emailPembeli, emailPenjual;
  ComponenTextColumn_CrossStartAndMainSpaceEvenlyAndGray2WhiteBlueAndFont12Font16Font14AndRegularSemiBoldMedium({Key? key, 
    required this.type, 
    required this.nama,
    required this.harga,
    this.jumlahItem = "-",
    this.totalHarga = "-",
    this.emailPembeli = "-",
    this.emailPenjual = "-",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (jumlahItem != "-")
        ? Text("$jumlahItem $type", style: grayTextStyle2.copyWith(fontWeight: regular, fontSize: defaultFont12, overflow: TextOverflow.ellipsis))
        : Text(type, style: grayTextStyle2.copyWith(fontWeight: regular, fontSize: defaultFont12, overflow: TextOverflow.ellipsis)),
        Text(nama, style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont16), maxLines: 2, overflow: TextOverflow.ellipsis),
        (totalHarga != "-")
        ? (totalHarga.length <= 7)
          ? Text("${formatCurrency.format(double.parse(totalHarga.toString()).toInt())}", style: blueTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont14, overflow: TextOverflow.ellipsis))
          : Text("${formatCurrencyShort.format(double.parse(totalHarga.toString()).toInt())}", style: blueTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont14, overflow: TextOverflow.ellipsis))
        : (harga.length <= 7)
          ? Text("${formatCurrency.format(double.parse(harga.toString()).toInt())}", style: blueTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont14, overflow: TextOverflow.ellipsis))
          : Text("${formatCurrencyShort.format(double.parse(harga.toString()).toInt())}", style: blueTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont14, overflow: TextOverflow.ellipsis)),  
        if(emailPembeli != "-")...[
          Text(emailPembeli, style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont16), maxLines: 2, overflow: TextOverflow.ellipsis)
        ],
        if(emailPenjual != "-")...[
          Text(emailPenjual, style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont16), maxLines: 2, overflow: TextOverflow.ellipsis)
        ],
      ]
    );
  }
}