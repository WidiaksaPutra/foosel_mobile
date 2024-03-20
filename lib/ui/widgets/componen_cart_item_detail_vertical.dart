// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foosel/service/api_konstanta.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_konstanta.dart';
import 'package:foosel/shared/theme_text_style.dart';

class ComponenCartItemDetailVertical extends StatelessWidget {
  late String image, textTitle, harga, jumlah, type;
  late VoidCallback onTapCard;
  ComponenCartItemDetailVertical({Key? key,
    required this.image,
    required this.textTitle,
    required this.harga,
    required this.type,
    required this.jumlah,
    required this.onTapCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    return GestureDetector(
      onTap: onTapCard,
      child: Container(
        margin: EdgeInsets.only(top: ThemeBox.defaultHeightBox12),
        padding: EdgeInsets.symmetric(vertical: ThemeBox.defaultHeightBox20, horizontal: ThemeBox.defaultHeightBox12),
        decoration: BoxDecoration(
          color: kBlackColor,
          borderRadius: BorderRadius.circular(ThemeBox.defaultRadius12),
        ),
        child: Row(
          children:[
            Padding(
              padding: EdgeInsets.only(right: ThemeBox.defaultWidthBox12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(ThemeBox.defaultRadius12),
                child: Image.network(
                  "${Api.linkURL}/$image", 
                  height: ThemeBox.defaultHeightBox60, 
                  width: ThemeBox.defaultWidthBox60, 
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.cover,
                ),
              )
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(type, style: grayTextStyle2.copyWith(fontWeight: regular, fontSize: defaultFont12, overflow: TextOverflow.ellipsis)),
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