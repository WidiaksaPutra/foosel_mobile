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
      margin: EdgeInsets.only(top: (startList == true) ? ThemeBox.defaultHeightBox30 : ThemeBox.defaultHeightBox20, left: ThemeBox.defaultWidthBox30, right: ThemeBox.defaultWidthBox30),
      padding: EdgeInsets.only(top: ThemeBox.defaultHeightBox10, bottom: ThemeBox.defaultHeightBox14, left: ThemeBox.defaultWidthBox12, right: ThemeBox.defaultWidthBox23),
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
              child: (connection == true)
              ? Image.network(
                  image, 
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
            padding: EdgeInsets.only(left: ThemeBox.defaultWidthBox45),
            child: IconButton(
              onPressed: onPressedLike, 
              icon: Image.asset(
                "asset/icon/love_icon3.png",
                width: ThemeBox.defaultWidthBox34,
                height: ThemeBox.defaultHeightBox34,
              ),
            ),
          ),
        ]
      )
    );
  }
}