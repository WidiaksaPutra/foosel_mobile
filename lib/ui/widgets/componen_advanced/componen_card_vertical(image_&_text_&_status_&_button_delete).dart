// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foosel/service/api_konstanta.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';
import 'package:foosel/ui/widgets/componen_basic/componen_basic_button.dart';
import 'componen_text_column(crossStart_&_mainSpaceEvenly_&_gray2_and_white_and_blue_&_font12_and_font16_and_font14_&_regular_and_semiBold_and_medium).dart';

class ComponenCardVertical_ImageAndTextAndStatusAndButtonDelete extends StatelessWidget {
  late bool connection;
  late String image, textTitle, harga, status, type, jumlahItem, totalHarga, emailPembeli, emailPenjual;
  late VoidCallback onTapCard, onTapDelete;
  late dynamic kondisi, bukanTujuanKondisi;
  ComponenCardVertical_ImageAndTextAndStatusAndButtonDelete({Key? key,
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
    required this.onTapDelete,
    required this.onTapCard,
    required this.kondisi,
    required this.bukanTujuanKondisi,
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
                    borderRadius: BorderRadius.circular(themeBox.defaultRadius8),
                    child: (connection == false)
                    ? Image.asset(
                        "asset/image/disconnect_image.jpg", 
                        height: themeBox.defaultHeightBox60,
                        width: themeBox.defaultWidthBox60,
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        "${Api.linkURL}/$image", 
                        height: themeBox.defaultHeightBox60, 
                        width: themeBox.defaultWidthBox60,
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.cover,
                      )
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
                Expanded(
                  child: Column(
                    children: [
                      Text(status, style: purpleTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont14), overflow: TextOverflow.ellipsis),
                      if(kondisi != bukanTujuanKondisi)...[
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
                      ],
                    ]
                  ),
                )
              ]
            ),
          ],
        ),
      )
    );
  }
}