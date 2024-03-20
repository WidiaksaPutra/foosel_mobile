// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_box.dart';

class CompenenGetBackX extends StatelessWidget {
  late VoidCallback onPressed;
  CompenenGetBackX({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Image.asset(
        "asset/icon/close_icon.png",
        height: ThemeBox.defaultHeightBox14,
        width: ThemeBox.defaultWidthBox14,
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
        height: ThemeBox.defaultHeightBox12,
        width: ThemeBox.defaultWidthBox6,
      ),
    );
  }
}

class CompenenGetBackBasic2 extends StatelessWidget {
  late VoidCallback onPressedBack;
  CompenenGetBackBasic2({Key? key, required this.onPressedBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressedBack, 
      icon: Image.asset(
        "asset/icon/icon_button_back3.png",
        height: ThemeBox.defaultHeightBox12,
        width: ThemeBox.defaultWidthBox6,
      ),
    );
  }
}

