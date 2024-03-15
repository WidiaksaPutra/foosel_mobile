import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';

class ComponenCartCardAddress extends StatelessWidget {
  String storeLocation, yourLocation;
  ComponenCartCardAddress({Key? key, required this.storeLocation, required this.yourLocation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: themeBox.defaultHeightBox30),
      padding: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox20, horizontal: themeBox.defaultHeightBox20),
      decoration: BoxDecoration(
        color: kBlackColor,
        borderRadius: BorderRadius.circular(themeBox.defaultRadius12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Address Details", style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16)),
          Padding(
            padding: EdgeInsets.only(top: themeBox.defaultHeightBox12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                Padding(
                  padding: EdgeInsets.only(right: themeBox.defaultWidthBox12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "asset/icon/location_store_Icon.png",
                        height: 40,
                        width: 40,
                      ),
                      Image.asset(
                        "asset/icon/line_location_icon.png",
                        width: 30,
                        height: 30,
                      ),
                      Image.asset(
                        "asset/icon/location_your_Icon.png",
                        height: 40,
                        width: 40,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Store Location", style: grayTextStyle2.copyWith(fontWeight: light, fontSize: defaultFont12)),
                      Text(storeLocation, style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont14), overflow: TextOverflow.ellipsis),
                      SizedBox(height: themeBox.defaultHeightBox30),
                      Text("Your Location", style: grayTextStyle2.copyWith(fontWeight: light, fontSize: defaultFont12)),
                      Text(yourLocation, style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont14), overflow: TextOverflow.ellipsis),
                    ]
                  )
                ), 
              ]
            ),
          ),
        ],
      )
    );
  }
}