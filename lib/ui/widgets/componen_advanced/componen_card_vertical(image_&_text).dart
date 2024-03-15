// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_text_column(crossStart_&_mainSpaceEvenly_&_gray2_and_white_and_blue_&_font12_and_font16_and_font14_&_regular_and_semiBold_and_medium).dart';
import 'package:foosel/ui/widgets/componen_basic/componen_basic_image.dart';

class ComponenCardVertical_ImageAndText extends StatelessWidget {
  String gambar, type, nama, harga;
  bool connection;
  ComponenCardVertical_ImageAndText({Key? key,
    required this.gambar, 
    required this.type, 
    required this.nama, 
    required this.harga,
    required this.connection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: themeBox.defaultHeightBox30),
      child: Row(        
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
          ComponenBasicImage(
            heightImage: themeBox.defaultHeightBox120,
            widthImage: themeBox.defaultWidthBox120,
            radiusImage: themeBox.defaultRadius12, 
            connection: connection, 
            gambar: gambar, 
            backgroundColor: kWhiteColor, 
            onTap: () {},
          ),
          SizedBox(width: themeBox.defaultWidthBox12),
          Expanded(
            child: ComponenTextColumn_CrossStartAndMainSpaceEvenlyAndGray2WhiteBlueAndFont12Font16Font14AndRegularSemiBoldMedium(
              nama: nama, 
              type: type, 
              harga: harga,
            ),
          ),
        ]
      ),
    );
  }
}

