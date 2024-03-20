// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foosel/service/api_konstanta.dart';
import 'package:foosel/shared/theme_box.dart';

class ComponenBasicImage extends StatelessWidget {
  late bool connection;
  late String gambar;
  late double widthImage, heightImage, radiusImage;
  late Color backgroundColor;
  late VoidCallback onTap;
  ComponenBasicImage({Key? key, 
    required this.connection, 
    required this.gambar,
    required this.widthImage,
    required this.heightImage,
    required this.radiusImage,
    required this.backgroundColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    return Container(
      width: widthImage,
      height: heightImage,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radiusImage),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: (connection == true)
        ? ClipRRect(
            borderRadius: BorderRadius.circular(ThemeBox.defaultRadius10),
            child: Image.network(
              "${Api.linkURL}/$gambar",
              fit: BoxFit.cover,
            )
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(ThemeBox.defaultRadius10),
            child: Image.asset(
              "asset/image/$gambar",
              fit: BoxFit.cover,
            ),
          ),
      )
    );
  }
}