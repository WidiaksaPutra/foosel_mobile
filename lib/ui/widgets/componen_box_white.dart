import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ComponenBoxWhite extends StatelessWidget {
  final double marginTop, borderRadiusBox, marginBottom;
  final Widget contentBox;
  final Color colorCard;
  const ComponenBoxWhite({
    required this.marginTop,
    required this.marginBottom,
    required this.borderRadiusBox,
    required this.contentBox,
    required this.colorCard
  });

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    return Container(
      margin: EdgeInsets.only(
        top: marginTop,
        bottom: marginBottom
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadiusBox.r),
        border: Border.all(
          color: colorCard,
          width: ThemeBox.defaultWidthBox02,
        ),
        boxShadow: [
          BoxShadow(
            color: colorCard,
            offset: Offset(
              0.0,
              0.0,
            ),
            blurRadius: 1.0,
            spreadRadius: 0.1,
          ),
          BoxShadow(
            color: colorCard,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: contentBox,
    );
  }
}