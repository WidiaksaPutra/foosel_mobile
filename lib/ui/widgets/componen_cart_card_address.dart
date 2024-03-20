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
    ThemeBox(context);
    return Container(
      margin: EdgeInsets.only(top: ThemeBox.defaultHeightBox30),
      padding: EdgeInsets.symmetric(vertical: ThemeBox.defaultHeightBox20, horizontal: ThemeBox.defaultHeightBox20),
      decoration: BoxDecoration(
        color: kBlackColor,
        borderRadius: BorderRadius.circular(ThemeBox.defaultRadius12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Address Details", style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16)),
          Padding(
            padding: EdgeInsets.only(top: ThemeBox.defaultHeightBox12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                Padding(
                  padding: EdgeInsets.only(right: ThemeBox.defaultWidthBox12),
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
                      SizedBox(height: ThemeBox.defaultHeightBox30),
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