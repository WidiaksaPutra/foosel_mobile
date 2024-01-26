import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';

class ComponenHeaderImageTitleStatus extends StatelessWidget {
  final String image, title, status;
  const ComponenHeaderImageTitleStatus({Key? key, required this.image, required this.title, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(title, style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont14)),
            Text(status, style: grayTextStyle2.copyWith(fontWeight: light, fontSize: defaultFont14)),
          ],)
        ]
      ),
    );
  }
}