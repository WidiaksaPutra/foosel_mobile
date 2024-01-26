import 'package:flutter/material.dart';

mixin showSnackBar{
  void voidShowSnackBar({
    required BuildContext context,
    required Color color,
    required double vertical,
    required BorderRadius borderRadius,
    required Widget content,
    required SnackBarBehavior behavior,
    required Duration duration,
  }){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: behavior,
        duration: duration,
        backgroundColor: color,
        padding: EdgeInsets.symmetric(vertical: vertical),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        content: content,
      ),
    );
  }
}