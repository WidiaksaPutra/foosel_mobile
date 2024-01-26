import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';

class ComponenDeskripsiDetail extends StatelessWidget {
  String titleDeskripsi, deskripsi;
  ComponenDeskripsiDetail({Key? key, required this.titleDeskripsi, required this.deskripsi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titleDeskripsi, style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont14)),
        Padding(
          padding: EdgeInsets.only(bottom: themeBox.defaultHeightBox30),
          child: Text(deskripsi, style: grayTextStyle2.copyWith(fontWeight: light, fontSize: defaultFont14)),
        ),
      ],
    );
  }
}

