// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_advanced/componen_text_column(crossStart_&_mainSpaceEvenly_&_gray2_and_white_and_blue_&_font12_and_font16_and_font14_&_regular_and_semiBold_and_medium).dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_basic/componen_basic_image.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_basic/componen_basic_button.dart';

class ComponenCardVertical_ImageAndTextAndButtonUpdateDelete extends StatelessWidget {
  late String gambar, type, nama, harga;
  late bool connection;
  VoidCallback onTapImage, onTapUpdate, onTapDelete;
  ComponenCardVertical_ImageAndTextAndButtonUpdateDelete({Key? key,
    required this.gambar, 
    required this.type, 
    required this.nama, 
    required this.harga,
    required this.connection,
    required this.onTapImage,
    required this.onTapUpdate,
    required this.onTapDelete
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: themeBox.defaultHeightBox30),
      child: Row(        
        // mainAxisAlignment: MainAxisAlignment.start,
        children:[
          ComponenBasicImage(
            heightImage: themeBox.defaultHeightBox120,
            widthImage: themeBox.defaultWidthBox120,
            radiusImage: themeBox.defaultRadius12, 
            connection: connection, 
            gambar: gambar, 
            backgroundColor: kWhiteColor, 
            onTap: onTapImage,
          ),
          SizedBox(width: themeBox.defaultWidthBox12),
          Expanded(
            child: ComponenTextColumn_CrossStartAndMainSpaceEvenlyAndGray2WhiteBlueAndFont12Font16Font14AndRegularSemiBoldMedium(
              nama: nama, 
              type: type, 
              harga: harga,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ComponenBasicButton(
                  paddingVertical: 0, 
                  borderRadius: themeBox.defaultRadius5, 
                  content: Icon(
                    Icons.update,
                    color: kBlackColor,
                  ),
                  onPressed: onTapUpdate, 
                  primaryColor: kYellowColor, 
                  secondaryColor: kGreyColor,
                ),
                SizedBox(height: themeBox.defaultHeightBox5),
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
            ),
          )
        ]
      ),
    );
  }
}

