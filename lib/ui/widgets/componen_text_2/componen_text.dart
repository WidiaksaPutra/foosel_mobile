import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';

class ComponenText2 extends StatelessWidget {
  String labelText, hintText;
  double paddingTextFormFieldBottom, paddingTextFormFieldLeft, paddingTextFormFieldRight;
  ComponenText2({ Key? key, required this.labelText, required this.hintText, 
  required this.paddingTextFormFieldBottom, required this.paddingTextFormFieldLeft, 
  required this.paddingTextFormFieldRight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: paddingTextFormFieldBottom, left: paddingTextFormFieldLeft, right: paddingTextFormFieldRight),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelText, style: grayTextStyle2.copyWith(fontWeight: regular, fontSize: defaultFont13)),
          SizedBox(height: themeBox.defaultHeightBox4),
          TextFormField(
            readOnly: true,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: whiteTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont16),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kBlackColor2,
                )
              )
            ),
          ),
        ]
      ),
    );
  }
}