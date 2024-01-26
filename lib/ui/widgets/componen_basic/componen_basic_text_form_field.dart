// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ComponenBasicTextFormField extends StatelessWidget{
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
  ComponenBasicTextFormField({ Key? key,
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
    // TextEditingController controller = TextEditingController();
    // if(update == true){
      // controller.text = hintText.toString();
    // }
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: labelStyle),
        SizedBox(height: sizeLabelToTextForm),
        TextFormField(
          // controller: (update == true) ? controller : null,
          keyboardType: keyboardType,
          obscureText: hiddenText,//untuk mengatur hidden text
          inputFormatters: inputFormatters,
          style: textFormFieldStyle,
          onChanged: (value) async{
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.setString(nameController, value);
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
          ),
        ),
      ]
    );
  }
}