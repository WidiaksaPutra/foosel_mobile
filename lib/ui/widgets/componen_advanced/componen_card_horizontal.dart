import 'package:flutter/material.dart';
import 'package:foosel/service/api_konstanta.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_konstanta.dart';
import 'package:foosel/shared/theme_text_style.dart';

// ignore: must_be_immutable
class ComponenCardHorizontal extends StatelessWidget{
  String gambar, jenis, nama, harga, navigation;
  double widthCardGambar;
  bool connect;
  VoidCallback onTap;
  ComponenCardHorizontal ({Key? key,
    required this.gambar, 
    required this.jenis, 
    required this.nama, 
    required this.harga, 
    required this.navigation,
    required this.widthCardGambar,
    required this.connect,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(ThemeBox.defaultRadius10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(ThemeBox.defaultRadius10),
                topRight: Radius.circular(ThemeBox.defaultRadius10),
              ),// Mengatur borderRadius menjadi setengah dari lebar/tinggi
              child: (connect == true)
            ? Image.network(
                "${Api.linkURL}/$gambar",
                width: widthCardGambar,
                height: ThemeBox.defaultHeightBox140,
                fit: BoxFit.cover,
              )
            : Image.asset(
                "asset/image/$gambar",
                width: widthCardGambar,
                height: ThemeBox.defaultHeightBox140,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ThemeBox.defaultWidthBox20),
              child: SizedBox(
                height: ThemeBox.defaultHeightBox70,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:[
                      Text(jenis, style: grayTextStyle2.copyWith(fontWeight: regular, fontSize: defaultFont12), overflow: TextOverflow.ellipsis),
                      Text(nama, style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont18), maxLines: 2, overflow: TextOverflow.ellipsis),
                      Text(formatCurrency.format(double.parse(harga.toString()).toInt()), style: blueTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont14), overflow: TextOverflow.ellipsis),
                    ]
                  ),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}