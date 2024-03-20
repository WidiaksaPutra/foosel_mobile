import 'package:flutter/material.dart';
import 'package:foosel/routes/route_name.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';
import 'package:foosel/ui/widgets/componen_row_between_text_icon.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    String icon = "asset/icon/icon_button_back2.png";
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ThemeBox.defaultWidthBox30),
      child: ListView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.only(top: ThemeBox.defaultHeightBox20, bottom: ThemeBox.defaultHeightBox16),
            child: Text("Account", style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont16)),
          ),
          ComponenTextIcon(buttonName: 'Edit Profile', icon: icon, navigation: RouteName.editProfile),
          Padding(
            padding: EdgeInsets.symmetric(vertical: ThemeBox.defaultHeightBox20),
            child: ComponenTextIcon(buttonName: 'Your Orders', icon: icon, navigation: RouteName.editProfile),
          ),
          ComponenTextIcon(buttonName: 'Help', icon: icon, navigation: RouteName.editProfile),
          Padding(
            padding: EdgeInsets.only(top: ThemeBox.defaultHeightBox30, bottom: ThemeBox.defaultHeightBox16),
            child: Text("General", style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont16)),
          ),
          ComponenTextIcon(buttonName: 'Privacy & Policy', icon: icon, navigation: RouteName.editProfile),
          Padding(
            padding: EdgeInsets.symmetric(vertical: ThemeBox.defaultHeightBox20),
            child: ComponenTextIcon(buttonName: 'Term of Service', icon: icon, navigation: RouteName.editProfile),
          ),
          ComponenTextIcon(buttonName: 'Rate App', icon: icon, navigation: RouteName.editProfile),
        ],
      ),
    );
  }
}