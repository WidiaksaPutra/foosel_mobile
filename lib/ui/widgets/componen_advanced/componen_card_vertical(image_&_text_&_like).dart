// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_konstanta.dart';
import 'package:foosel/shared/theme_text_style.dart';

class ComponenCardVertical_ImageAndTextAndLike extends StatelessWidget {
  late String image, title, harga;
  late bool startList, connection;
  late VoidCallback onPressedLike;
  ComponenCardVertical_ImageAndTextAndLike({Key? key, 
    required this.image, 
    required this.title, 
    required this.harga, 
    required this.startList,
    required this.connection,
    required this.onPressedLike,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: (startList == true) ? themeBox.defaultHeightBox30 : themeBox.defaultHeightBox20, left: themeBox.defaultWidthBox30, right: themeBox.defaultWidthBox30),
      padding: EdgeInsets.only(top: themeBox.defaultHeightBox10, bottom: themeBox.defaultHeightBox14, left: themeBox.defaultWidthBox12, right: themeBox.defaultWidthBox23),
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
              child: (connection == true)
              ? Image.network(
                  image, 
                  height: themeBox.defaultHeightBox60,
                  width: themeBox.defaultWidthBox60,
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  "asset/image/disconnect_image.jpg", 
                  height: themeBox.defaultHeightBox60,
                  width: themeBox.defaultWidthBox60,
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.cover,
                ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont14), maxLines: 2, overflow: TextOverflow.ellipsis),
                Text(formatCurrency.format(double.parse(harga.toString()).toInt()), style: blueTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont14), overflow: TextOverflow.ellipsis),
              ]
            )
          ), 
          Padding(
            padding: EdgeInsets.only(left: themeBox.defaultWidthBox45),
            child: IconButton(
              onPressed: onPressedLike, 
              icon: Image.asset(
                "asset/icon/love_icon3.png",
                width: themeBox.defaultWidthBox34,
                height: themeBox.defaultHeightBox34,
              ),
            ),
          ),
        ]
      )
    );
  }
}