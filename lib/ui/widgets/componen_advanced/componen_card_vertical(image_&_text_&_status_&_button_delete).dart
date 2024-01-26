// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_konstanta.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_konstanta.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_basic/componen_basic_button.dart';

class ComponenCardVertical_ImageAndTextAndStatusAndButtonDelete extends StatelessWidget {
  late bool connection;
  late String image, textTitle, harga, status, type;
  late VoidCallback onTapCard, onTapDelete;
  ComponenCardVertical_ImageAndTextAndStatusAndButtonDelete({Key? key, 
    required this.connection,
    required this.status,
    required this.image, 
    required this.textTitle, 
    required this.harga,
    required this.type,
    required this.onTapDelete,
    required this.onTapCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: themeBox.defaultHeightBox30, left: themeBox.defaultWidthBox30, right: themeBox.defaultWidthBox30),
      padding: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox10, horizontal: themeBox.defaultHeightBox16),
      decoration: BoxDecoration(
        color: kBlackColor,
        borderRadius: BorderRadius.circular(themeBox.defaultRadius12),
      ),
      child: GestureDetector(
        onTap: onTapCard,
        child: Column(
          children: [
            Row(
              children:[
                Padding(
                  padding: EdgeInsets.only(right: themeBox.defaultWidthBox12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(themeBox.defaultRadius12),
                    child: (connection == true)
                    ? Image.network(
                        "${Api.baseURLImage}$image", 
                        height: themeBox.defaultHeightBox60, 
                        width: themeBox.defaultWidthBox60,
                        alignment: Alignment.centerLeft
                      )
                    : Image.asset(
                        "asset/image/sampel_sepatu_home_small_4.png", 
                        height: themeBox.defaultHeightBox60,
                        width: themeBox.defaultWidthBox60,
                        alignment: Alignment.centerLeft
                      ),
                  )
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(type, style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont14), overflow: TextOverflow.ellipsis),
                      Text(textTitle, style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont14), overflow: TextOverflow.ellipsis),
                      Text(formatCurrency.format(double.parse(harga.toString()).toInt()), style: blueTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont14), overflow: TextOverflow.ellipsis),
                    ]
                  )
                ), 
                Column(
                  children: [
                    Text(status, style: purpleTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont14), overflow: TextOverflow.ellipsis),
                    ComponenBasicButton(
                      paddingVertical: 0, 
                      borderRadius: themeBox.defaultRadius5, 
                      content: Icon(
                        Icons.delete,
                        color: kBlackColor,
                      ),
                      onPressed: onTapDelete, 
                      primaryColor: kRedColor, 
                      secondaryColor: kGreyColor,
                    ),
                  ]
                ), 
              ]
            ),
          ],
        ),
      )
    );
  }
}