// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';

class ComponenTextDetail extends StatelessWidget {
  String title, data;
  ComponenTextDetail({Key? key, required this.title, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont14)),
        Padding(
          padding: EdgeInsets.only(bottom: ThemeBox.defaultHeightBox30),
          child: Text(data, style: grayTextStyle2.copyWith(fontWeight: light, fontSize: defaultFont14)),
        ),
      ],
    );
  }
}

