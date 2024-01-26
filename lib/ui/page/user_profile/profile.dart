import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/routes/route_name.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_row_between_text_icon.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String icon = "asset/icon/icon_button_back2.png";
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox30),
      child: ListView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.only(top: themeBox.defaultHeightBox20, bottom: themeBox.defaultHeightBox16),
            child: Text("Account", style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont16)),
          ),
          ComponenTextIcon(buttonName: 'Edit Profile', icon: icon, navigation: RouteName.editProfile),
          Padding(
            padding: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox20),
            child: ComponenTextIcon(buttonName: 'Your Orders', icon: icon, navigation: RouteName.editProfile),
          ),
          ComponenTextIcon(buttonName: 'Help', icon: icon, navigation: RouteName.editProfile),
          Padding(
            padding: EdgeInsets.only(top: themeBox.defaultHeightBox30, bottom: themeBox.defaultHeightBox16),
            child: Text("General", style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont16)),
          ),
          ComponenTextIcon(buttonName: 'Privacy & Policy', icon: icon, navigation: RouteName.editProfile),
          Padding(
            padding: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox20),
            child: ComponenTextIcon(buttonName: 'Term of Service', icon: icon, navigation: RouteName.editProfile),
          ),
          ComponenTextIcon(buttonName: 'Rate App', icon: icon, navigation: RouteName.editProfile),
        ],
      ),
    );
  }
}