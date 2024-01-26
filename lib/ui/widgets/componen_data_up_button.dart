import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/bloc_button_up/cubit_button_up.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/bloc_button_up/state_button_up.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';

class ComponenDataUpButton extends StatelessWidget {
  late int dataLength, index;
  late String dataName;
  late VoidCallback onTap;
  ComponenDataUpButton({Key? key, 
    required this.dataLength, 
    required this.index, 
    required this.dataName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(//kegunaannya untuk menambah listener seperti onTap, onScale, dls
      //kegunaannya hampir mirip dengan TextButton, perbedaannya GestureDetector memiliki fitur listener yang lebih lengkap.
      onTap: onTap,
      child: BlocBuilder<cubitUpButton, StateDataUpButton>(builder: (context, stateDesign) 
        => AnimatedContainer(//perbedaannya continer tidak menyediakan duration yang mendukung pembuatan animasi, adanya duratian
      //menyebabkan tansisi dari bentuk 1 ke bentuk ke 2 menjadi lebih halus seperti animasi.
        duration: const Duration(milliseconds: 300),
        margin: (index == dataLength-1) ? EdgeInsets.only(right: themeBox.defaultWidthBox30) : EdgeInsets.only(right: themeBox.defaultWidthBox16),
        padding: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox12, vertical: themeBox.defaultHeightBox10),
        decoration: BoxDecoration(
          color: (stateDesign.currentTop == index) ? kPurpleColor : null,
          border: Border.all(color: kBlackColor5, width: (stateDesign.currentTop == index) ? themeBox.defaultWidthBox0 : themeBox.defaultWidthBox05),
          borderRadius: BorderRadius.circular(themeBox.defaultRadius12)
        ),
        child: Center(child: Text(dataName, style: (stateDesign.currentTop == index) 
        ? whiteTextStyle.copyWith(fontSize: defaultFont13, fontWeight: medium) 
        : grayTextStyle.copyWith(fontSize: defaultFont13, fontWeight: medium))),
        ),
      ),
    );
  }
}




