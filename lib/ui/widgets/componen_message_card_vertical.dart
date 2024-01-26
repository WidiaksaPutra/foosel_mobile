import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';

class ComponenMessageCardVertical extends StatelessWidget {
  String icon, textTitle, textSubTitle, textTailing;
  VoidCallback onTap;
  ComponenMessageCardVertical({Key? key,
    required this.icon,
    required this.textTitle, 
    required this.textSubTitle, 
    required this.textTailing,
    required this.onTap,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: themeBox.defaultHeightBox22, left: themeBox.defaultWidthBox30, right: themeBox.defaultWidthBox30),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children:[
            Padding(
              padding: EdgeInsets.only(right: themeBox.defaultWidthBox12),
              child: ClipOval(
                child: Image.network(
                  icon.toLowerCase(), 
                  height: themeBox.defaultHeightBox54, 
                  width: themeBox.defaultWidthBox54, 
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(textTitle, style: whiteTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont15), overflow: TextOverflow.ellipsis),
                  Text(textSubTitle, style: grayTextStyle2.copyWith(fontWeight: light, fontSize: defaultFont10), overflow: TextOverflow.ellipsis),
                ]
              )
            ),
            Padding(
              padding: EdgeInsets.only(left: themeBox.defaultWidthBox38),
              child: Text(textTailing, style: grayTextStyle2.copyWith(fontWeight: regular, fontSize: defaultFont10), textAlign: TextAlign.end, overflow: TextOverflow.ellipsis),
            ),
          ]
        ),
      )
    );
  }

  // ListTile(
  //     leading: Image.asset(
  //       icon,
  //       height: 54),
  //     title: Text(textTitle, style: whiteTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont15)),
  //     subtitle: Text(textSubTitle, style: grayTextStyle2.copyWith(fontWeight: light, fontSize: defaultFont14)),
  //     trailing: Text(textTailing, style: grayTextStyle2.copyWith(fontWeight: regular, fontSize: defaultFont10)),
  //   );
}