import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';
import 'package:flutter_svg/svg.dart';

class ComponenFormKosong extends StatelessWidget {
  bool formVisible;
  String message;
  ComponenFormKosong({Key? key, required this.formVisible, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    return Visibility(
      visible: formVisible,
      child: Padding(
        padding: EdgeInsets.only(top: ThemeBox.defaultHeightBox5),
        child: Row(
          children: [
            SvgPicture.asset(
              "asset/icon/Error.svg",
              height: 14,
              width: 14,
            ),
            SizedBox(width: ThemeBox.defaultWidthBox4),
            Expanded(child: Text(message, style: redTextStyle.copyWith(fontSize: defaultFont12, fontWeight: regular), overflow: TextOverflow.ellipsis,)),
          ]
        ),
      ),
    );
  }
}