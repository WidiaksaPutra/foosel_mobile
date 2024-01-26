// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_navigasi_role.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_basic/componen_basic_button.dart';

class DetailBottomNavigationBarConnectionProductPenjual extends HookWidget with navigasiRole, navigasiRoleBarRead, defaultSharedPref{
  DetailBottomNavigationBarConnectionProductPenjual({Key? key}) : super(key: key);

  void navigationRole(BuildContext context) async{
    await navigasiRBR(context: context, value: 0);
    await navigasiR();
  }

  @override
  Widget build(BuildContext context) {
    sharedPref();
    return Container(
      padding: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox10),
      color: kPrimaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ComponenBasicButton(paddingVertical: themeBox.defaultHeightBox10, borderRadius: themeBox.defaultRadius5, content: Text("Update", style: blackTextStyle.copyWith(fontWeight: regular)), onPressed: () {  }, primaryColor: kYellowColor, secondaryColor: kGreyColor),
          ComponenBasicButton(paddingVertical: themeBox.defaultHeightBox10, borderRadius: themeBox.defaultRadius5, content: Text("Delete", style: blackTextStyle.copyWith(fontWeight: regular)), onPressed: () {  }, primaryColor: kRedColor, secondaryColor: kGreyColor),
        ],
      ),
    );
  }
}