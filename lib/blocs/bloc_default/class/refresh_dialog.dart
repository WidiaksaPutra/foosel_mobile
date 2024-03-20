import 'package:flutter/material.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_dialog_basic.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_navigasi_role.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_content_dialog(image_&_title_text_&_button_refresh).dart';
import 'package:go_router/go_router.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class RefreshDialog with DialogBasic, NavigasiRole, NavigasiRoleBarRead{
  void basicRefresh({
    required BuildContext context,
    required VoidCallback onTap,
  })async {
    var listener = InternetConnectionChecker().onStatusChange.listen((status){
      if (status == InternetConnectionStatus.disconnected) {
        ThemeBox(context);
        voidDialogBasic(
          margin: EdgeInsets.symmetric(horizontal: ThemeBox.defaultWidthBox30, vertical: MediaQuery.of(context).size.height * 0.3),
          padding: EdgeInsets.only(left: ThemeBox.defaultWidthBox30, right: ThemeBox.defaultWidthBox30, top: ThemeBox.defaultHeightBox30),
          borderRadius: BorderRadius.circular(ThemeBox.defaultRadius10),
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