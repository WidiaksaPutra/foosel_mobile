import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/bloc_button_up/cubit_button_up.dart';
import 'package:foosel/blocs/bloc_default/bloc_button_up/state_button_up.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';

// ignore: must_be_immutable
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
    ThemeBox(context);
    return GestureDetector(//kegunaannya untuk menambah listener seperti onTap, onScale, dls
      //kegunaannya hampir mirip dengan TextButton, perbedaannya GestureDetector memiliki fitur listener yang lebih lengkap.
      onTap: onTap,
      child: BlocBuilder<CubitUpButton, StateDataUpButton>(builder: (context, stateDesign) 
        => AnimatedContainer(//perbedaannya continer tidak menyediakan duration yang mendukung pembuatan animasi, adanya duratian
      //menyebabkan tansisi dari bentuk 1 ke bentuk ke 2 menjadi lebih halus seperti animasi.
        duration: const Duration(milliseconds: 300),
        margin: (index == dataLength-1) ? EdgeInsets.only(right: ThemeBox.defaultWidthBox30) : EdgeInsets.only(right: ThemeBox.defaultWidthBox16),
        padding: EdgeInsets.symmetric(horizontal: ThemeBox.defaultWidthBox12, vertical: ThemeBox.defaultHeightBox10),
        decoration: BoxDecoration(
          color: (stateDesign.currentTop == index) ? kPurpleColor : null,
          border: Border.all(color: kBlackColor5, width: (stateDesign.currentTop == index) ? ThemeBox.defaultWidthBox0 : ThemeBox.defaultWidthBox05),
          borderRadius: BorderRadius.circular(ThemeBox.defaultRadius12)
        ),
        child: Center(child: Text(dataName, style: (stateDesign.currentTop == index) 
        ? whiteTextStyle.copyWith(fontSize: defaultFont13, fontWeight: medium) 
        : grayTextStyle.copyWith(fontSize: defaultFont13, fontWeight: medium))),
        ),
      ),
    );
  }
}




