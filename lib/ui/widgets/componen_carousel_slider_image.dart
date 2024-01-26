import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_konstanta.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';

class ComponenCarouselSliderImage extends StatefulWidget {
  late double sizeWidth;
  late List imageProduct;
  late bool connect;
  ComponenCarouselSliderImage({Key? key, 
    required this.sizeWidth, 
    required this.imageProduct,
    required this.connect,
  }) : super(key: key);

  @override
  State<ComponenCarouselSliderImage> createState() => _ComponenCarouselSliderImageState();
}

class _ComponenCarouselSliderImageState extends State<ComponenCarouselSliderImage> {
  int currentIndex = 0;

  Widget indicator(index){
    return Container(
      margin: EdgeInsets.only(right: themeBox.defaultWidthBox4),
      width: (currentIndex == index) ? themeBox.defaultWidthBox16 : themeBox.defaultWidthBox4,
      height: themeBox.defaultHeightBox4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(themeBox.defaultRadius10),
        color: (currentIndex == index) ? kPurpleColor : kGreyColor5,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int index = -1;
    return Container(
      color: kGreyColor6,
      child: Column(
        children: [
          CarouselSlider(
            items: (widget.connect == true)
            ? widget.imageProduct.map(
                (imageProduct) => 
                Image.network(
                  "${Api.baseURLImage}${imageProduct.toString()}",
                  width: widget.sizeWidth,
                  height: themeBox.defaultHeightBox340,
                  fit: BoxFit.cover,
                )
              ).toList()
            : widget.imageProduct.map(
                (imageProduct) => 
                Image.asset(
                  imageProduct,
                  width: widget.sizeWidth,
                  height: themeBox.defaultHeightBox340,
                  fit: BoxFit.cover,
                )
              ).toList(),
            options: CarouselOptions(
              initialPage: 0,
              enlargeCenterPage: true,
              onPageChanged: ((index, reason){
                setState(() {
                  currentIndex = index;//untuk memberikan nilai index pada currentIndex, digunakan untuk nilai index dari gambar
                });
              })
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.imageProduct.map(//??
              (e) {
                index++;
                return indicator(index);
              }
            ).toList(),
          ),
        ],
      ),
    );
  }
}