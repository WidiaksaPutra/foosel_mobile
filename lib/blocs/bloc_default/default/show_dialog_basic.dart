import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';

mixin dialogBasic{
  void voidDialogBasic({
    required BuildContext context,
    required VoidCallback onTapCloseDialog,
    required Widget contentDialog,
    required bool barrierDismissible,
    required bool closeIconStatus,
    required EdgeInsetsGeometry margin,
    required EdgeInsetsGeometry padding,
    required Color color,
    required BorderRadiusGeometry borderRadius,
  }){
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: ((BuildContext context) => Container(
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(closeIconStatus == true)...[
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: onTapCloseDialog,
                  child: Image.asset(
                    'asset/icon/close_icon.png',
                    height: themeBox.defaultHeightBox10,
                    width: themeBox.defaultWidthBox10,
                  ),
                ),
              ),
            ],
            Expanded(child: contentDialog),
          ],
        ),
      )
    ));
  }
}
