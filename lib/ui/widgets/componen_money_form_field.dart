import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_multi_formatter/formatters/money_input_formatter.dart';
import 'package:intl/intl.dart';

class ComponenMoneyFormField extends StatelessWidget with defaultSharedPref {
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
        SizedBox(height: themeBox.defaultHeightBox12),
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
              borderRadius: BorderRadius.circular(themeBox.defaultRadius12),
              borderSide: BorderSide.none,
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: themeBox.defaultWidthBox12, right: themeBox.defaultWidthBox12),
              child: Image.asset(
                iconText, 
                width: themeBox.defaultWidthBox18, 
                height: themeBox.defaultHeightBox19,
              ),
            ),
          ),
        ),
      ]
    );
  }
}