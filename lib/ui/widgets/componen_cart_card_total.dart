import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_konstanta.dart';
import 'package:foosel/shared/theme_text_style.dart';

class ComponenCartCardTotal extends StatelessWidget {
  String productQuantity, productPrice, shipping, total;
  ComponenCartCardTotal({Key? key, required this.productQuantity, required this.productPrice, required this.shipping, required this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox30),
      padding: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox20, horizontal: themeBox.defaultHeightBox20),
      decoration: BoxDecoration(
        color: kBlackColor,
        borderRadius: BorderRadius.circular(themeBox.defaultRadius12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Payment Summary", style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16)),
          SizedBox(height: themeBox.defaultHeightBox12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Product Quantity", style: grayTextStyle2.copyWith(fontWeight: regular, fontSize: defaultFont12)),
              Text("$productQuantity Items", style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont14)),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Product Price", style: grayTextStyle2.copyWith(fontWeight: regular, fontSize: defaultFont12)),
                Text(formatCurrency.format(double.parse(productPrice.toString()).toInt()), style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont14)),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Shipping", style: grayTextStyle2.copyWith(fontWeight: regular, fontSize: defaultFont12)),
              Text(shipping, style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont14)),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: themeBox.defaultHeightBox11, bottom: themeBox.defaultHeightBox10),
            child: Divider(height: themeBox.defaultHeightBox12, thickness: 1, color: kBlackColor10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total", style: blueTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont14)),
              Text(formatCurrencyShort.format(double.parse(total.toString()).toInt()), style: blueTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont14)),
            ],
          ),
        ],
      )
    );
  }
}