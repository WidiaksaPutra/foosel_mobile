import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

class ComponenDashBorderBox extends StatelessWidget {
  final double borderRadiusBox, dashLengthBox, borderSideWidth;
  final Color borderSideColor;
  final Widget contentBox;
  const ComponenDashBorderBox({
    required this.borderRadiusBox,
    required this.dashLengthBox,
    required this.borderSideWidth,
    required this.borderSideColor,
    required this.contentBox,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadiusBox.r),
        border: DashedBorder.fromBorderSide(
          dashLength: dashLengthBox, 
          side: BorderSide(
            color: borderSideColor, 
            width: borderSideWidth,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: kBlackColor3,
            offset: Offset(
              0.0,
              0.0,
            ),
            blurRadius: 1.0,
            spreadRadius: 0.1,
          ),
          BoxShadow(
            color: kBlackColor4,
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