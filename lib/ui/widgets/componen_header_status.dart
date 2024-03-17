import 'package:flutter/material.dart';
import 'package:foosel/blocs/bloc_default/default/size_device.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';

class ComponenHeaderImageTitleStatus extends StatelessWidget with sizeDevice{
  late String image, title, status;
  ComponenHeaderImageTitleStatus({Key? key, required this.image, required this.title, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    themeBox(context);
    getsizeDevice(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox20),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: themeBox.defaultWidthBox12),
            child: ClipOval(
              child: Image.network(
                image.toLowerCase(),
                height: themeBox.defaultHeightBox50,
                width: themeBox.defaultWidthBox50,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: sizeWidth-themeBox.defaultHeightBox170,
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