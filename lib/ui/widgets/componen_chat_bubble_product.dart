import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_konstanta.dart';
import 'package:foosel/shared/theme_text_style.dart';

class ComponenChatBubbleProduct extends StatelessWidget {
  final String image, dataName, dataHarga;
  final String dataMessage;
  final bool jenisUserMessage;
  final bool bSpace;
  const ComponenChatBubbleProduct({Key? key, required this.image, required this.dataName, required this.dataHarga, required this.dataMessage, required this.jenisUserMessage, required this.bSpace}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    return Row(
      mainAxisAlignment: (jenisUserMessage == true) ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(//?
          child: Container(
            margin: EdgeInsets.only(top:(bSpace == true) ? ThemeBox.defaultHeightBox30 : ThemeBox.defaultHeightBox12 , right: (jenisUserMessage == true) ? ThemeBox.defaultWidthBox30 : 0, left: (jenisUserMessage == true) ? 0 : ThemeBox.defaultWidthBox30),
            padding: EdgeInsets.symmetric(vertical: ThemeBox.defaultHeightBox12, horizontal: ThemeBox.defaultWidthBox12),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width*0.6,
            ),
            decoration: BoxDecoration(
              color: (jenisUserMessage == true) ? kPurpleBlackColor : kBlackColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular((jenisUserMessage == true) ? ThemeBox.defaultRadius12 : 0),
                topRight: Radius.circular((jenisUserMessage == true) ? 0 : ThemeBox.defaultRadius12), 
                bottomLeft: Radius.circular(ThemeBox.defaultRadius12), 
                bottomRight: Radius.circular(ThemeBox.defaultRadius12),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: ThemeBox.defaultHeightBox20),
                  child: Row(children: [
                      Padding(
                        padding: EdgeInsets.only(right: ThemeBox.defaultWidthBox8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(ThemeBox.defaultRadius12),
                          child: Image.asset(
                            image,
                            height: ThemeBox.defaultHeightBox70,
                            width: ThemeBox.defaultWidthBox70,
                          ),
                        ),
                      ),
                      Expanded(child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(dataName, style: whiteTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont14)),
                            SizedBox(height: ThemeBox.defaultHeightBox4),
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
                      padding: EdgeInsets.symmetric(vertical: ThemeBox.defaultHeightBox10, horizontal: ThemeBox.defaultWidthBox14),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: kPurpleColor,
                          width: ThemeBox.defaultWidthBox1,
                        ),
                        borderRadius: BorderRadius.circular(ThemeBox.defaultRadius8)
                      ),
                      child: Text("Add to Cart", style: purpleTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont14), overflow: TextOverflow.ellipsis,),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: ThemeBox.defaultHeightBox10, horizontal: ThemeBox.defaultWidthBox14),
                      decoration: BoxDecoration(
                        color: kPurpleColor,
                        borderRadius: BorderRadius.circular(ThemeBox.defaultRadius8)
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