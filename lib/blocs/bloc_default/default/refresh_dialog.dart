import 'package:flutter/material.dart';
import 'package:foosel/blocs/bloc_default/default/default_navigasi_role.dart';
import 'package:foosel/blocs/bloc_default/default/show_dialog_basic.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_content_dialog(image_&_title_text_&_button_refresh).dart';
import 'package:go_router/go_router.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class RefreshDialog with dialogBasic, navigasiRole, navigasiRoleBarRead{
  void basicRefresh({
    required BuildContext context,
    required VoidCallback onTap,
  })async {
    var listener = InternetConnectionChecker().onStatusChange.listen((status){
      if (status == InternetConnectionStatus.disconnected) {
        voidDialogBasic(
          margin: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox30, vertical: MediaQuery.of(context).size.height * 0.3),
          padding: EdgeInsets.only(left: themeBox.defaultWidthBox30, right: themeBox.defaultWidthBox30, top: themeBox.defaultHeightBox30),
          borderRadius: BorderRadius.circular(themeBox.defaultRadius10),
          color: kBlackColor6,
          context: context, 
          closeIconStatus: true,
          barrierDismissible: false,
          contentDialog: ComponenContentDialog_ImageAndTitleTextAndButtonRefresh(
            text: 'Halaman Perlu Di Refresh',
            image: 'asset/animations/loading_keong_lottie.json',
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