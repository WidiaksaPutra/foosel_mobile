import 'package:flutter/material.dart';

class ComponenBasicSearchFieldData extends StatelessWidget {
  final VoidCallback onTap;
  final TextStyle inputTextStyleSearch, hintTextStyleSearch;
  final Widget prefixIcon;
  final InputBorder? enabledBorder, focusedBorder, border;
  final double verticalPadding;
  final Color backgroundColor;
  final int flex;
  ComponenBasicSearchFieldData({Key? key,
    required this.onTap, 
    required this.inputTextStyleSearch, 
    required this.hintTextStyleSearch, 
    required this.prefixIcon,
    required this.enabledBorder,
    required this.focusedBorder,
    required this.border,
    required this.backgroundColor, 
    required this.verticalPadding,
    required this.flex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: TextField(
        keyboardType: TextInputType.text,
        style: inputTextStyleSearch,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: hintTextStyleSearch,
          prefixIcon: prefixIcon,
          filled: true,
          fillColor: backgroundColor,
          contentPadding: EdgeInsets.symmetric(vertical: verticalPadding),
          enabledBorder: enabledBorder,
          focusedBorder: focusedBorder,
          border: border
        ),
        onTap: onTap,
        // onSubmitted: (String value){
        //   if(value != ""){
        //     search(value);
        //   }else{
        //     refresh();
        //   }
        // }
      ),
    );
  }
}