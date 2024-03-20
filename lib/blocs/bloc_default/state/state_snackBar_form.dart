import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';

class StateSnackBar{
  bool loading;
  dynamic snackBar, snackBar2;
  StateSnackBar(this.loading, this.snackBar, this.snackBar2);
}

class DataStateSnackBar extends StateSnackBar{
  DataStateSnackBar(
    void routeNavigation,
    {
      required BuildContext context, 
      required bool loading, 
      required bool snackBar, 
      required String responMessage, 
      required Color colorSnackBar, 
      required String responApi,
      required bool snackBar2,
      required String responMessage2, 
      required Color colorSnackBar2,
    }
  ) : super(
  loading,
  (snackBar == true) 
  ? {
      ThemeBox(context),
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          duration: const Duration(milliseconds: 1000),
          backgroundColor: colorSnackBar,
          padding: EdgeInsets.symmetric(vertical: ThemeBox.defaultHeightBox12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ThemeBox.defaultRadius8),
          ),
          content: Text(responMessage,
            style: whiteTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont12),
            textAlign: TextAlign.center
          ),
        ),
      ),
      if(responApi == "berhasil"){
        routeNavigation,
      }
    }
  : const Text(""),
  (snackBar2 == true)
  ? {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          duration: const Duration(milliseconds: 1000),
          backgroundColor: colorSnackBar2,
          padding: EdgeInsets.symmetric(vertical: ThemeBox.defaultHeightBox12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ThemeBox.defaultRadius8),
          ),
          content: Text(responMessage2,
            style: whiteTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont12),
            textAlign: TextAlign.center
          ),
        ),
      ),
    }
  : const Text(""),
  );
}

class DataStateInitialSnackBar extends StateSnackBar{
  DataStateInitialSnackBar() : super(
    false,
    const Text(""),
    false,
  );
}