import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';

class ComponenHeadHome extends StatelessWidget {
  final String label1, label2, image;
  const ComponenHeadHome({Key? key, required this.label1, required this.label2, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("test $image");
    return Container(
      margin: EdgeInsets.only(top: themeBox.defaultHeightBox30, right: themeBox.defaultWidthBox30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            child:  ClipOval(
              child: (image.contains("https://"))
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