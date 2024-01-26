import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_basic/componen_basic_button.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_basic/componen_basic_search_field_data.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';

class ComponenHeadHomeMenu extends StatelessWidget {
  final VoidCallback search, button;
  const ComponenHeadHomeMenu({Key? key,
    required this.search,
    required this.button,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final InputBorder inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(themeBox.defaultRadius8),
      borderSide: BorderSide(color: kPurpleColor),
    );

    final TextStyle textStyleSearch = TextStyle(
        fontSize: defaultFont16, 
        color: kWhiteColor
    );

    return Container(
      margin: EdgeInsets.only(right: themeBox.defaultWidthBox30),
      child: Row(
        children: [
          ComponenBasicSearchFieldData(
            flex: 4,
            prefixIcon: const Icon(Icons.search, color: kWhiteColor), 
            backgroundColor: kPrimaryColor, 
            inputTextStyleSearch: textStyleSearch, 
            hintTextStyleSearch: textStyleSearch, 
            focusedBorder: inputBorder,
            enabledBorder: inputBorder,
            border: inputBorder,
            verticalPadding: themeBox.defaultHeightBox5,
            onTap: search,
          ),
          SizedBox(width: themeBox.defaultWidthBox10),
          Expanded(
            flex: 1,
            child: ComponenBasicButton(
              content: Icon(Icons.input, color: kWhiteColor), 
              primaryColor: kPurpleColor,
              secondaryColor: kBlueColor,
              borderRadius: themeBox.defaultRadius8, 
              paddingVertical: themeBox.defaultHeightBox5,
              onPressed: button, 
            ),
          ),
        ],
      ),
    );
  }
}