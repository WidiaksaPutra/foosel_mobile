import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';

class ComponenTextFormField2 extends StatelessWidget with defaultSharedPref{
  String labelText, hintText, nameController;
  bool hiddenText;
  final keyboardType;
  double paddingTextFormFieldBottom, paddingTextFormFieldLeft, paddingTextFormFieldRight;
  ComponenTextFormField2({Key? key, required this.labelText, required this.hintText, 
  required this.hiddenText, required this.nameController, required this.keyboardType, 
  required this.paddingTextFormFieldBottom, required this.paddingTextFormFieldLeft, 
  required this.paddingTextFormFieldRight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sharedPref();
    return Container(
      margin: EdgeInsets.only(bottom: paddingTextFormFieldBottom, left: paddingTextFormFieldLeft, right: paddingTextFormFieldRight),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelText, style: grayTextStyle2.copyWith(fontWeight: regular, fontSize: defaultFont13)),
          SizedBox(height: themeBox.defaultHeightBox4),
          TextFormField(
            keyboardType: keyboardType,
            obscureText: hiddenText,//untuk mengatur hidden text
            style: whiteTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont16),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: whiteTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont16),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kBlackColor2,
                )
              )
            ),
            onChanged: (value) {
              prefs.setString(nameController, value);
            },
          ),
        ]
      ),
    );
  }
}