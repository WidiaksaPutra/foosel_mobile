// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_size_device.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';

class ComponenHeaderImageTitleStatus extends StatelessWidget with SizeDevice{
  late String image, title, status;
  ComponenHeaderImageTitleStatus({Key? key, required this.image, required this.title, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    getsizeDevice(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ThemeBox.defaultHeightBox20),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: ThemeBox.defaultWidthBox12),
            child: ClipOval(
              child: Image.network(
                image.toLowerCase(),
                height: ThemeBox.defaultHeightBox50,
                width: ThemeBox.defaultWidthBox50,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: sizeWidth-ThemeBox.defaultHeightBox170,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont14)),
                  Text(status, style: grayTextStyle2.copyWith(fontWeight: light, fontSize: defaultFont14)),
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }
}