
import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_konstanta.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';

// ignore: must_be_immutable
class ComponenBottomCartButton extends StatelessWidget {
  late String textButton,harga;
  late bool listCart, connection;
  late VoidCallback onPressed;
  ComponenBottomCartButton({Key? key,
    required this.textButton,
    required this.harga,
    required this.listCart,
    required this.onPressed,
    required this.connection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: (connection == true) ? 
        (listCart == true) ? size.height * 0.27 : size.height * 0.18
      : size.height * 0.10,
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if(listCart == true)...[
                Container(
                  margin: EdgeInsets.only(top: themeBox.defaultHeightBox20, left: themeBox.defaultWidthBox30, right: themeBox.defaultWidthBox30, bottom: themeBox.defaultHeightBox30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Subtotal", style: whiteTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont14)),
                      Text(formatCurrency.format(double.parse(harga.toString()).toInt()), style: blueTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont16)),
                    ]
                  ),
                ),
              ],
              if(connection == true)...[
                Divider(height: themeBox.defaultHeightBox12, color: kBlackColor9, thickness: 1,),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox30, vertical: themeBox.defaultHeightBox30),
                  padding: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox13, horizontal: themeBox.defaultWidthBox20),
                  decoration: BoxDecoration(
                    color: kPurpleColor,
                    borderRadius: BorderRadius.circular(themeBox.defaultRadius12),
                  ),
                  child: TextButton(
                    onPressed: onPressed,
                    child: Row(
                      mainAxisAlignment: (listCart == true) ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
                      children: [
                        if(listCart == true)...[
                          Text(textButton, style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16)),
                          Image.asset(
                            "asset/icon/icon_button_next.png",
                            height: themeBox.defaultHeightBox14,
                            width: themeBox.defaultHeightBox12,
                          )
                        ] else...[
                          Text(textButton, style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16)),
                        ]
                      ],
                    ),
                  ),
                ),
              ]
            ],
          ),
        ],
      ),
    );
  }
}