// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';

class ComponenCarouselSliderImageSliver extends HookWidget {
  late List imageProduct;
  late bool connect;
  ComponenCarouselSliderImageSliver({Key? key,
    required this.imageProduct,
    required this.connect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState<int>(0);
    final index = useState<int>(-1);
    ThemeBox(context);
    return Container(
      color: kGreyColor6,
      child: Column(
        children: [
          CarouselSlider(
            items: (connect == true)
            ? imageProduct.map(
              (imageProduct) => Image.asset(
                imageProduct,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),).toList()
            : imageProduct.map(
              (imageProduct) => Image.asset(
                imageProduct,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),).toList(),
            options: CarouselOptions(
              autoPlay: true,
              reverse: true,
              viewportFraction: 1,
              initialPage: 0,
              onPageChanged: ((i, reason){
                currentIndex.value = i;//untuk memberikan nilai index pada currentIndex, digunakan untuk nilai index dari gambar
                index.value = -1;
              })
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageProduct.map(
              (e) {
                index.value++;
                return Container(
                  margin: EdgeInsets.only(right: ThemeBox.defaultWidthBox4),
                  width: (currentIndex.value == index.value) ? ThemeBox.defaultWidthBox16 : ThemeBox.defaultWidthBox4,
                  height: ThemeBox.defaultHeightBox4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(ThemeBox.defaultRadius10),
                    color: (currentIndex.value == index.value) ? kPurpleColor : kGreyColor5,
                  ),
                );
              }
            ).toList(),
          ),
        ],
      ),
    );
  }
}