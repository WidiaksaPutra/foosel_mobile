// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
class ComponenMoneyFormField extends StatelessWidget with SharedPref {
  String labelText, hintText, iconText, nameController;
  bool hiddenText;
  final keyboardType;
  dynamic contextForm;
  ComponenMoneyFormField({ Key? key, required this.labelText, required this.hintText, 
  required this.iconText, required this.hiddenText, required this.keyboardType, 
  required this.contextForm, required this.nameController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sharedPref();
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16)),
        SizedBox(height: ThemeBox.defaultHeightBox12),
        TextFormField(
          keyboardType: keyboardType,
          inputFormatters: [CurrencyInputFormatter()],
          obscureText: hiddenText,//untuk mengatur hidden text
          style: grayTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont14),
          onChanged: (value) {
            prefs.setString(nameController, value);
            contextForm(value);
          },
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: grayTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont14),
            filled: true,//untuk menerangkan fillColor
            fillColor: kBlackColor4,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(ThemeBox.defaultRadius12),
              borderSide: BorderSide.none,
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: ThemeBox.defaultWidthBox12, right: ThemeBox.defaultWidthBox12),
              child: Image.asset(
                iconText, 
                width: ThemeBox.defaultWidthBox18, 
                height: ThemeBox.defaultHeightBox19,
              ),
            ),
          ),
        ),
      ]
    );
  }
}