import 'package:flutter/material.dart';
import 'package:foosel/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';

class ComponenBottomChatMessage extends StatelessWidget with defaultSharedPref{
  Widget iconBottom;
  // productPreview
  String hintText, nameController;
  bool boolProductPreview;
  ComponenBottomChatMessage({Key? key, required this.hintText, required this.nameController, required this.iconBottom, required this.boolProductPreview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sharedPref();
    return Container(
      margin: EdgeInsets.only(top: themeBox.defaultHeightBox20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Visibility(
          //   visible: boolProductPreview,
          //   child: productPreview,
          // ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: themeBox.defaultWidthBox20, left: themeBox.defaultWidthBox20, bottom: themeBox.defaultHeightBox20),
                    padding: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox16, vertical: themeBox.defaultHeightBox12),
                    decoration: BoxDecoration(
                      color: kBlackColor,
                      borderRadius: BorderRadius.circular(themeBox.defaultRadius12)
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 5,
                      style: whiteTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont14),
                      decoration: InputDecoration.collapsed(
                        hintText: hintText.toString(),
                        hintStyle: grayTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont14),
                      ),
                      onChanged: (value) {
                        prefs.setString(nameController, value);
                      },
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: themeBox.defaultWidthBox20, bottom: themeBox.defaultHeightBox20),
                  decoration: BoxDecoration(
                    color: kPurpleColor,
                    borderRadius: BorderRadius.circular(themeBox.defaultRadius12),
                  ),
                  child: iconBottom,
                ),
              ],
            ),          
          ),
        ],
      ),
    );
  }
}