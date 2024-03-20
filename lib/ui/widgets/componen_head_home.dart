// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';

class ComponenHeadHome extends StatelessWidget {
  late String label1, label2, image;
  late bool connect;
  ComponenHeadHome({Key? key,
    required this.label1,
    required this.label2,
    required this.image,
    required this.connect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    return Container(
      margin: EdgeInsets.only(top: ThemeBox.defaultHeightBox30, right: ThemeBox.defaultWidthBox30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label1, style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont24)),
                Text(label2, style: grayTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont16)),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){},
            child: ClipOval(
              child: (connect == true)
              ? Image.network(
                  image.toLowerCase(),
                  width: defaultFont54,
                  height: defaultFont54,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  image,
                  width: defaultFont54,
                  height: defaultFont54,
                  fit: BoxFit.cover,
                )
            ),
          ),
        ],
      ),
    );
  }
}