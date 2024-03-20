import 'package:flutter/material.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';

class ComponenBottomChatMessage extends StatelessWidget with SharedPref{
  Widget iconBottom;
  // productPreview
  String hintText, nameController;
  bool boolProductPreview;
  ComponenBottomChatMessage({Key? key, required this.hintText, required this.nameController, required this.iconBottom, required this.boolProductPreview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    sharedPref();
    return Container(
      margin: EdgeInsets.only(top: ThemeBox.defaultHeightBox20),
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
                    margin: EdgeInsets.only(right: ThemeBox.defaultWidthBox20, left: ThemeBox.defaultWidthBox20, bottom: ThemeBox.defaultHeightBox20),
                    padding: EdgeInsets.symmetric(horizontal: ThemeBox.defaultWidthBox16, vertical: ThemeBox.defaultHeightBox12),
                    decoration: BoxDecoration(
                      color: kBlackColor,
                      borderRadius: BorderRadius.circular(ThemeBox.defaultRadius12)
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
                  margin: EdgeInsets.only(right: ThemeBox.defaultWidthBox20, bottom: ThemeBox.defaultHeightBox20),
                  decoration: BoxDecoration(
                    color: kPurpleColor,
                    borderRadius: BorderRadius.circular(ThemeBox.defaultRadius12),
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