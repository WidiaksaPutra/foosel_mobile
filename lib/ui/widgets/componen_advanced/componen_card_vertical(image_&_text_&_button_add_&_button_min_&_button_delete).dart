// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foosel/service/api_konstanta.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_konstanta.dart';
import 'package:foosel/shared/theme_text_style.dart';

class ComponenCardVertical_ImageAndTextAndButtonAddAndButtonMinAndButtonDelete extends StatelessWidget {
  late bool connection;
  late String type, image, textTitle, harga, jumlah, iconAdd, iconMin;
  late VoidCallback onTapAdd, onTapMin, onTapDelete, onTapCard;
  ComponenCardVertical_ImageAndTextAndButtonAddAndButtonMinAndButtonDelete({Key? key, 
    required this.connection,
    required this.type,
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
      margin: EdgeInsets.only(top: ThemeBox.defaultHeightBox30, left: ThemeBox.defaultWidthBox30, right: ThemeBox.defaultWidthBox30),
      padding: EdgeInsets.symmetric(vertical: ThemeBox.defaultHeightBox10, horizontal: ThemeBox.defaultHeightBox16),
      decoration: BoxDecoration(
        color: kBlackColor,
        borderRadius: BorderRadius.circular(ThemeBox.defaultRadius12),
      ),
      child: GestureDetector(
        onTap: onTapCard,
        child: Column(
          children: [
            Row(
              children:[
                Padding(
                  padding: EdgeInsets.only(right: ThemeBox.defaultWidthBox12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(ThemeBox.defaultRadius12),
                    child: (connection == true)
                    ? Image.network(
                        "${Api.linkURL}/$image", 
                        height: ThemeBox.defaultHeightBox60, 
                        width: ThemeBox.defaultWidthBox60,
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        "asset/image/disconnect_image.jpg", 
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
                Column(
                  children: [
                    GestureDetector(
                      onTap: onTapAdd, 
                      child: Image.asset(
                        iconAdd,
                        height: ThemeBox.defaultHeightBox16, 
                        width: ThemeBox.defaultWidthBox16,
                        alignment: Alignment.centerLeft
                      ),
                    ),
                    Text(jumlah, style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont14), overflow: TextOverflow.ellipsis),
                    GestureDetector(
                      onTap: onTapMin, 
                      child: Image.asset(
                        iconMin, 
                        height: ThemeBox.defaultHeightBox16, 
                        width: ThemeBox.defaultWidthBox16,
                        alignment: Alignment.centerLeft
                      ),
                    ),
                  ]
                ), 
              ]
            ),
            Padding(
              padding: EdgeInsets.only(top: ThemeBox.defaultHeightBox12),
              child: GestureDetector(
                onTap: onTapDelete,
                child: Row(
                  children:[
                    Image.asset(
                      "asset/icon/icon_subtract.png",
                      width: ThemeBox.defaultWidthBox10,
                      height: ThemeBox.defaultHeightBox12,
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