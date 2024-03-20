// ignore_for_file: must_be_immutable
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';
import 'package:foosel/ui/widgets/componen_basic/componen_basic_text_form_field.dart';

class ComponenTextFormField_TextFormAndHintGrey14AndRadius12AndFillColorBlack extends StatelessWidget { 
  int maxLines;
  String? labelText, iconText;
  bool? hiddenText, update;
  TextInputType? keyboardType;
  List<TextInputFormatter>? inputFormatters;
  TextStyle? labelStyle;
  String hintText, nameController;
  dynamic contextForm;
  ComponenTextFormField_TextFormAndHintGrey14AndRadius12AndFillColorBlack({
    this.maxLines = 1,
    this.labelText = "",
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
    this.hiddenText = false,
    this.update = false,
    this.labelStyle,
    this.iconText = "asset/icon/union_Icon.png",
    required this.hintText,
    required this.nameController,
    required this.contextForm,
  });

  @override
  Widget build(BuildContext context) {
    return ComponenBasicTextFormField(
      maxLines: maxLines,
      labelText: labelText!, 
      hintText: hintText, 
      inputFormatters: (inputFormatters != null) ? inputFormatters! : [],
      keyboardType: keyboardType!,
      hiddenText: hiddenText!, 
      iconText: iconText!,
      nameController: nameController,
      labelStyle: (labelStyle != null) ? labelStyle! : nullTextStyle,
      hintStyle: grayTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont14),
      borderRadius: BorderRadius.circular(ThemeBox.defaultRadius12), 
      borderSide: BorderSide.none, 
      fillColor: kBlackColor4, 
      textFormFieldStyle: grayTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont14), 
      sizeLabelToTextForm: (labelStyle != null) ? ThemeBox.defaultHeightBox12 : 0.0,
      prefixPadding: EdgeInsets.symmetric(horizontal: ThemeBox.defaultWidthBox12),
      prefixHeight: ThemeBox.defaultHeightBox19,
      prefixWidth: ThemeBox.defaultWidthBox18,
      contextForm: contextForm, 
      update: update!
    );
  }
}

