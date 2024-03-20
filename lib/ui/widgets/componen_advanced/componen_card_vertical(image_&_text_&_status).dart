// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foosel/service/api_konstanta.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_text_column(crossStart_&_mainSpaceEvenly_&_gray2_and_white_and_blue_&_font12_and_font16_and_font14_&_regular_and_semiBold_and_medium).dart';

class ComponenCardVertical_ImageAndTextAndStatus extends StatelessWidget {
  late bool connection;
  late String image, textTitle, harga, status, type, jumlahItem, totalHarga, emailPembeli, emailPenjual;
  late VoidCallback onTapCard;
  ComponenCardVertical_ImageAndTextAndStatus({Key? key, 
    this.emailPembeli = "-",
    this.emailPenjual = "-",
    required this.connection,
    required this.status,
    required this.image, 
    required this.textTitle, 
    required this.harga,
    required this.type,
    this.jumlahItem = "-",
    this.totalHarga = "-",
    required this.onTapCard,
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
                  child: ComponenTextColumn_CrossStartAndMainSpaceEvenlyAndGray2WhiteBlueAndFont12Font16Font14AndRegularSemiBoldMedium(
                    nama: textTitle, 
                    type: type, 
                    harga: harga,
                    jumlahItem: jumlahItem,
                    totalHarga: totalHarga,
                    emailPenjual: emailPenjual,
                    emailPembeli: emailPembeli,
                  ),
                ), 
                Text(status, style: purpleTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont14), overflow: TextOverflow.ellipsis), 
              ]
            ),
          ],
        ),
      )
    );
  }
}