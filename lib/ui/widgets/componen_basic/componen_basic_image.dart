// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

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
        ? Image.network(
            gambar,
          )
        : Image.asset(
            gambar,
          ),
      )
    );
  }
}