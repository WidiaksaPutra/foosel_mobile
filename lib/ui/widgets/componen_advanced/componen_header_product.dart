import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/ui/widgets/componen_advanced/compenen_get_back.dart';
import 'package:foosel/shared/theme_box.dart';

class HeaderDetailProduct extends StatelessWidget {
  final bool guestUser;
  final VoidCallback onPressedChart, onPressedBack;
  final String icon;
  const HeaderDetailProduct({Key? key,
    required this. guestUser,
    required this. onPressedChart,
    required this. onPressedBack,
    required this. icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ThemeBox.defaultHeightBox62,
      color: kGreyColor6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ 
          CompenenGetBackBasic2(onPressedBack: onPressedBack),
          IconButton(
            onPressed: onPressedChart,
            icon: (guestUser == false)
            ? Image.asset(
                icon,
                height: ThemeBox.defaultHeightBox22,
                width: ThemeBox.defaultWidthBox20,
              )
            : Text(""),
          ),
        ]
      ),
    );
  }
}