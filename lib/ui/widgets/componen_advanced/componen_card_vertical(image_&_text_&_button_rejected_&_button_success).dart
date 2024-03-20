// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foosel/service/api_konstanta.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_konstanta.dart';
import 'package:foosel/shared/theme_text_style.dart';
import 'package:foosel/ui/widgets/componen_basic/componen_basic_button.dart';

class ComponenCardVertical_ImageAndTextAndButtonRejectedAndButtonSuccess extends StatelessWidget {
  late bool connection;
  late String image, textTitle, harga, status, type;
  late VoidCallback onTapCard, onTapReject, onTapApprove;
  late dynamic kondisi, bukanTujuanKondisi;
  ComponenCardVertical_ImageAndTextAndButtonRejectedAndButtonSuccess({Key? key, 
    required this.connection,
    required this.status,
    required this.image, 
    required this.textTitle, 
    required this.harga,
    required this.type,
    required this.onTapReject,
    required this.onTapApprove,
    required this.onTapCard,
    required this.kondisi,
    required this.bukanTujuanKondisi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ThemeBox.defaultHeightBox30, left: ThemeBox.defaultWidthBox30, right: ThemeBox.defaultWidthBox30),
      padding: EdgeInsets.symmetric(vertical: ThemeBox.defaultHeightBox10, horizontal: ThemeBox.defaultHeightBox16),
      decoration: BoxDecoration(
        color: kBlackColor,
        borderRadius: BorderRadius.circular(ThemeBox.defaultRadius12),
      ),
      child: GestureDetector(
        onTap: onTapCard,
        child: Column(
          children: [
            Row(
              children:[
                Padding(
                  padding: EdgeInsets.only(right: ThemeBox.defaultWidthBox12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(ThemeBox.defaultRadius12),
                    child: (connection == true)
                    ? Image.network(
                        "${Api.linkURL}/$image", 
                        height: ThemeBox.defaultHeightBox60, 
                        width: ThemeBox.defaultWidthBox60,
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        "asset/image/disconnect_image.jpg", 
                        height: ThemeBox.defaultHeightBox60,
                        width: ThemeBox.defaultWidthBox60,
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.cover,
                      ),
                  )
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(status, style: purpleTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont14), overflow: TextOverflow.ellipsis),
                      Text(type, style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont14), overflow: TextOverflow.ellipsis),
                      Text(textTitle, style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont14), overflow: TextOverflow.ellipsis),
                      Text(formatCurrency.format(double.parse(harga.toString()).toInt()), style: blueTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont14), overflow: TextOverflow.ellipsis),
                    ]
                  )
                ), 
                if(kondisi != bukanTujuanKondisi)...[
                  Column(
                    children: [
                      ComponenBasicButton(
                        paddingVertical: 0, 
                        borderRadius: ThemeBox.defaultRadius5, 
                        content: Icon(
                          Icons.check,
                          color: kBlackColor,
                        ),
                        onPressed: onTapApprove, 
                        primaryColor: kGreenColor, 
                        secondaryColor: kGreyColor,
                      ),
                      ComponenBasicButton(
                        paddingVertical: 0, 
                        borderRadius: ThemeBox.defaultRadius5, 
                        content: Icon(
                          Icons.close,
                          color: kBlackColor,
                        ),
                        onPressed: onTapReject, 
                        primaryColor: kRedColor, 
                        secondaryColor: kGreyColor,
                      ),
                    ]
                  ),
                ], 
              ]
            ),
          ],
        ),
      )
    );
  }
}