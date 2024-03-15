// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';

class ComponenTextDropDown extends StatelessWidget{
  final String labelText;
  late String viewDropdownButton;
  final List list;
  final dynamic onClicked;
  ComponenTextDropDown({ Key? key,
    required this.labelText,
    required this.viewDropdownButton,
    required this.list,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16)),
        SizedBox(height: themeBox.defaultHeightBox12),
        Container(
          padding: EdgeInsets.only(left: themeBox.defaultWidthBox12, right: themeBox.defaultWidthBox12, top: themeBox.defaultWidthBox8),
          decoration: BoxDecoration(
            color: kBlackColor4,
            borderRadius: BorderRadius.circular(themeBox.defaultRadius12), 
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              itemHeight: 50,
              hint: (viewDropdownButton.isNotEmpty) ? Center(child: Text(viewDropdownButton, style: grayTextStyle.copyWith(fontSize: defaultFont14, fontWeight: medium))) : null,
              style: grayTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont14),
              items: list.map(buildMenuItems).toList(),
              borderRadius: BorderRadius.circular(themeBox.defaultRadius15),
              underline: SizedBox(),
              isExpanded: true,
              onChanged: (value){
                onClicked(value: value, list: list);
              }
            ),
          ),
        ),
      ]
    );
  }

  DropdownMenuItem<String> buildMenuItems(dynamic item)
  => DropdownMenuItem(
    value: item.isNotEmpty ? item : null,
    child: Center(child: Text(item)),
  );
}