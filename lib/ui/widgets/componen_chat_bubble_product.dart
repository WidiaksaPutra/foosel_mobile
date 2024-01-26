import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_konstanta.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';

class ComponenChatBubbleProduct extends StatelessWidget {
  final String image, dataName, dataHarga;
  final String dataMessage;
  final bool jenisUserMessage;
  final bool bSpace;
  const ComponenChatBubbleProduct({Key? key, required this.image, required this.dataName, required this.dataHarga, required this.dataMessage, required this.jenisUserMessage, required this.bSpace}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: (jenisUserMessage == true) ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(//?
          child: Container(
            margin: EdgeInsets.only(top:(bSpace == true) ? themeBox.defaultHeightBox30 : themeBox.defaultHeightBox12 , right: (jenisUserMessage == true) ? themeBox.defaultWidthBox30 : 0, left: (jenisUserMessage == true) ? 0 : themeBox.defaultWidthBox30),
            padding: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox12, horizontal: themeBox.defaultWidthBox12),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width*0.6,
            ),
            decoration: BoxDecoration(
              color: (jenisUserMessage == true) ? kPurpleBlackColor : kBlackColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular((jenisUserMessage == true) ? themeBox.defaultRadius12 : 0),
                topRight: Radius.circular((jenisUserMessage == true) ? 0 : themeBox.defaultRadius12), 
                bottomLeft: Radius.circular(themeBox.defaultRadius12), 
                bottomRight: Radius.circular(themeBox.defaultRadius12),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: themeBox.defaultHeightBox20),
                  child: Row(children: [
                      Padding(
                        padding: EdgeInsets.only(right: themeBox.defaultWidthBox8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(themeBox.defaultRadius12),
                          child: Image.asset(
                            image,
                            height: themeBox.defaultHeightBox70,
                            width: themeBox.defaultWidthBox70,
                          ),
                        ),
                      ),
                      Expanded(child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(dataName, style: whiteTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont14)),
                            SizedBox(height: themeBox.defaultHeightBox4),
                            Text(formatCurrencyShort.format(double.parse(dataHarga.toString()).toInt()), style: blueTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont14)),
                          ]
                        ),
                      ),
                    ]                 
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox10, horizontal: themeBox.defaultWidthBox14),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: kPurpleColor,
                          width: themeBox.defaultWidthBox1,
                        ),
                        borderRadius: BorderRadius.circular(themeBox.defaultRadius8)
                      ),
                      child: Text("Add to Cart", style: purpleTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont14), overflow: TextOverflow.ellipsis,),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox10, horizontal: themeBox.defaultWidthBox14),
                      decoration: BoxDecoration(
                        color: kPurpleColor,
                        borderRadius: BorderRadius.circular(themeBox.defaultRadius8)
                      ),
                      child: Text("Buy Now", style: purpleBlackTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont14), overflow: TextOverflow.ellipsis,),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        )
      ]
    );
  }
}