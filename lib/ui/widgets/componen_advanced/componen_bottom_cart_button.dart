
import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_konstanta.dart';
import 'package:foosel/shared/theme_text_style.dart';
import 'package:foosel/shared/theme_box.dart';

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
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if(listCart == true)...[
                Container(
                  margin: EdgeInsets.only(top: ThemeBox.defaultHeightBox20, left: ThemeBox.defaultWidthBox30, right: ThemeBox.defaultWidthBox30, bottom: ThemeBox.defaultHeightBox30),
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
                Divider(height: ThemeBox.defaultHeightBox12, color: kBlackColor9, thickness: 1,),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: ThemeBox.defaultWidthBox30, vertical: ThemeBox.defaultHeightBox30),
                  padding: EdgeInsets.symmetric(vertical: ThemeBox.defaultHeightBox13, horizontal: ThemeBox.defaultWidthBox20),
                  decoration: BoxDecoration(
                    color: kPurpleColor,
                    borderRadius: BorderRadius.circular(ThemeBox.defaultRadius12),
                  ),
                  child: TextButton(
                    onPressed: onPressed,
                    child: Row(
                      mainAxisAlignment: (listCart == true) ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
                      children: [
                        Expanded(child: Text(textButton, style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16), overflow: TextOverflow.ellipsis,)),
                        Image.asset(
                          "asset/icon/icon_button_next.png",
                          height: ThemeBox.defaultHeightBox14,
                          width: ThemeBox.defaultHeightBox12,
                        ),
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