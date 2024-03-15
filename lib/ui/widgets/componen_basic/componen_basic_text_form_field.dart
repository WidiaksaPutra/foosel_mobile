// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foosel/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
class ComponenBasicTextFormField extends HookWidget with defaultSharedPref{
  String labelText, hintText, iconText, nameController;
  bool update, hiddenText;
  TextInputType keyboardType;
  TextStyle labelStyle, textFormFieldStyle, hintStyle;
  double sizeLabelToTextForm, prefixHeight, prefixWidth;
  Color fillColor;
  BorderRadius borderRadius;
  BorderSide borderSide;
  EdgeInsetsGeometry prefixPadding;
  List<TextInputFormatter> inputFormatters;
  dynamic contextForm;
  int maxLines;
  ComponenBasicTextFormField({ Key? key,
    this.maxLines = 1,
    required this.labelText, 
    required this.hintText, 
    required this.iconText, 
    required this.hiddenText,
    required this.keyboardType, 
    required this.update,
    required this.nameController,
    required this.labelStyle,
    required this.sizeLabelToTextForm,
    required this.textFormFieldStyle,
    required this.inputFormatters,
    required this.hintStyle,
    required this.fillColor,
    required this.borderRadius,
    required this.borderSide,
    required this.prefixPadding,
    required this.prefixHeight,
    required this.prefixWidth,
    required this.contextForm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sharedPref();
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: labelStyle),
        SizedBox(height: sizeLabelToTextForm),
        TextFormField(
          // controller: (update == true) ? controller : null,
          maxLines: maxLines,
          keyboardType: keyboardType,
          obscureText: hiddenText,//untuk mengatur hidden text
          inputFormatters: inputFormatters,
          style: textFormFieldStyle,
          onChanged: (value) async{
            prefs.setString(nameController, value);
            contextForm(value);
          },
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle,
            filled: true,//untuk menerangkan fillColor
            fillColor: fillColor,
            border: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: borderSide,
            ),
            prefixIcon: Padding(
              padding: prefixPadding,
              child: Image.asset(
                iconText, 
                width: prefixWidth, 
                height: prefixHeight,
              ),
            ),
            // suffixIcon: Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
            //   child: IconButton(
            //     onPressed: (){
            //       hiddenText =! hiddenText;
            //     },
            //     icon: SvgPicture.asset(
            //       (hiddenText) ? "assets/icons/eye.svg" : "assets/icons/eye_hide.svg",
            //       height: themeBox.defaultHeightBox20,
            //       color: (hiddenText) ? const Color.fromRGBO(217, 217, 217, 1) : Colors.green,
            //     ),
            //   ),
            // )
          ),
        ),
      ]
    );
  }
}



// TextEditingController controller = TextEditingController();
    // if(update == true){
      // controller.text = hintText.toString();
    // }