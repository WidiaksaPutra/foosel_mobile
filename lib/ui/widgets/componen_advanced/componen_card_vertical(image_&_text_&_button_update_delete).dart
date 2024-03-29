// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_text_column(crossStart_&_mainSpaceEvenly_&_gray2_and_white_and_blue_&_font12_and_font16_and_font14_&_regular_and_semiBold_and_medium).dart';
import 'package:foosel/ui/widgets/componen_basic/componen_basic_image.dart';
import 'package:foosel/ui/widgets/componen_basic/componen_basic_button.dart';

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
    ThemeBox(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: ThemeBox.defaultHeightBox20),
      child: Row(
        children:[
          ComponenBasicImage(
            heightImage: ThemeBox.defaultHeightBox120,
            widthImage: ThemeBox.defaultWidthBox120,
            radiusImage: ThemeBox.defaultRadius12, 
            connection: connection, 
            gambar: gambar, 
            backgroundColor: kWhiteColor, 
            onTap: onTapImage,
          ),
          SizedBox(width: ThemeBox.defaultWidthBox12),
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
                  borderRadius: ThemeBox.defaultRadius5, 
                  content: Icon(
                    Icons.update,
                    color: kBlackColor,
                  ),
                  onPressed: onTapUpdate, 
                  primaryColor: kYellowColor, 
                  secondaryColor: kGreyColor,
                ),
                SizedBox(height: ThemeBox.defaultHeightBox5),
                ComponenBasicButton(
                  paddingVertical: 0, 
                  borderRadius: ThemeBox.defaultRadius5, 
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

