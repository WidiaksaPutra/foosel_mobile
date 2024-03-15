import 'package:flutter/material.dart';
import 'package:foosel/blocs/bloc_default/default/default_navigasi_role.dart';
import 'package:foosel/blocs/bloc_default/default/show_dialog_basic.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_content_dialog(image_&_title_text_&_button_refresh).dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_content_dialog(image_&_title_text_&_text).dart';
import 'package:go_router/go_router.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ClassConnectionDialog with dialogBasic, navigasiRole, navigasiRoleBarRead{
  void basicConnection({
    required BuildContext context,
    required VoidCallback onTap,
    required bool buttonConnection,
  })async {
    var listener = InternetConnectionChecker().onStatusChange.listen((status){
      if (status == InternetConnectionStatus.disconnected) {
        voidDialogBasic(
          margin: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox30, vertical: MediaQuery.of(context).size.height * 0.3),
          padding: EdgeInsets.only(left: themeBox.defaultWidthBox30, right: themeBox.defaultWidthBox30, top: themeBox.defaultHeightBox30),
          borderRadius: BorderRadius.circular(themeBox.defaultRadius10),
          color: kBlackColor6,
          context: context, 
          closeIconStatus: false,
          barrierDismissible: true,
          contentDialog: (buttonConnection == false) 
          ? ComponenContentDialog_ImageAndTitleTextAndText(
              titleText: 'Koneksi Internet Terputus', 
              image: 'asset/animations/wifi_disconnect.json',
              text: 'penggunaan aplikasi akan dibatasi karena aplikasi dalam mode offline',
            )
          : ComponenContentDialog_ImageAndTitleTextAndButtonRefresh(
              text: 'Koneksi Internet Terputus',
              image: 'asset/animations/wifi_disconnect.json',
              onTapRefresh: () {
               navigasiRBR(context: context, value: 0);
               navigasiR();
               context.go(navigation);
              },
            ),
          onTapCloseDialog: onTap,
        );
      }
    });
    Future.delayed(
      const Duration(seconds: 30),
      () => listener.cancel(),
    ); 
  }
}