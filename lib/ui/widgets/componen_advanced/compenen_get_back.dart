// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_box.dart';

class CompenenGetBackX extends StatelessWidget {
  final VoidCallback onPressed;
  const CompenenGetBackX({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Image.asset(
        "asset/icon/close_icon.png",
        height: themeBox.defaultHeightBox14,
        width: themeBox.defaultWidthBox14,
      )
    );
  }
}

class CompenenGetBackBasic extends StatelessWidget {
  late VoidCallback onPressed;
  CompenenGetBackBasic({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Image.asset(
        "asset/icon/icon_button_back.png",
        height: themeBox.defaultHeightBox12,
        width: themeBox.defaultWidthBox6,
      ),
    );
  }
}

class CompenenGetBackBasic2 extends StatelessWidget {
  final VoidCallback onPressedBack;
  const CompenenGetBackBasic2({Key? key, required this.onPressedBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressedBack, 
      icon: Image.asset(
        "asset/icon/icon_button_back3.png",
        height: themeBox.defaultHeightBox12,
        width: themeBox.defaultWidthBox6,
      ),
    );
  }
}

