import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/ui/widgets/componen_basic/componen_basic_button.dart';
import 'package:foosel/shared/theme_box.dart';

class ComponenHeadHomeMenu extends StatelessWidget {
  final VoidCallback button;
  const ComponenHeadHomeMenu({Key? key,
    required this.button,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    
    final InputBorder inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(ThemeBox.defaultRadius8),
      borderSide: BorderSide(color: kPurpleColor),
    );

    final TextStyle textStyleSearch = TextStyle(
        fontSize: defaultFont16, 
        color: kWhiteColor
    );

    return Container(
      margin: EdgeInsets.only(right: ThemeBox.defaultWidthBox30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ComponenBasicButton(
            content: Icon(Icons.input, color: kWhiteColor), 
            primaryColor: kPurpleColor,
            secondaryColor: kBlueColor,
            borderRadius: ThemeBox.defaultRadius8, 
            paddingVertical: ThemeBox.defaultHeightBox5,
            onPressed: button, 
          ),
        ],
      ),
    );
  }
}