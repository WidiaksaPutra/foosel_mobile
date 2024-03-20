// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/class/connection_dialog.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_navigasi_role.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/blocs/bloc_user/event_user.dart';
import 'package:foosel/blocs/bloc_user/main/connect/bloc_main_update_user_connect.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';
import 'package:foosel/ui/page/connection/connection_profile.dart';
import 'package:foosel/ui/page/user_profile/account/body_edit_profile.dart';
import 'package:foosel/ui/widgets/componen_advanced/compenen_get_back.dart';
import 'package:foosel/ui/widgets/componen_loading.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatelessWidget with SharedPref, NavigasiRole, NavigasiRoleBarRead{
  EditProfile({Key? key}) : super(key: key);

  void navigasi(BuildContext context) async{
    SharedPreferences tokenUser = await SharedPreferences.getInstance();
    Map<String, dynamic> decodeTokenUser = JwtDecoder.decode(tokenUser.getString('token').toString());
    if(decodeTokenUser['roles'].toString() == "PENJUAL"){
      navigasiRBR(context: context, value: 4);
    }else{
      navigasiRBR(context: context, value: 3);
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    navigasi(context);
    navigasiR();
    sharedPref();
    Widget title() => Expanded(
      child: Text("Edit Profile", 
        style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont18),
        overflow: TextOverflow.ellipsis,
      ),
    );

    Widget getUpdate() => IconButton(
      onPressed: () {
        context.read<BlocMainUpdateUserConnect>().add(
          DataEventUpdateUser(
            name: prefs.getString('fullNameUpdate').toString(), 
            alamat: prefs.getString('alamatUpdate').toString(),
            username: prefs.getString('usernameUpdate').toString(), 
            email: prefs.getString('emailUpdate').toString(), 
            context: context, 
            navigation: navigation
          )
        );
        BlocMainUpdateUserConnect().close();
      },
      icon: Image.asset(
        "asset/icon/submit_icon.png",
        height: ThemeBox.defaultHeightBox13,
        width: ThemeBox.defaultWidthBox18,
      ),
    ); 

    PreferredSizeWidget header(){
      ClassConnectionDialog connection = ClassConnectionDialog();
      return AppBar(
        toolbarHeight: ThemeBox.defaultHeightBox90,
        backgroundColor: kPrimaryColor,
        shadowColor: kBlackColor6,
        centerTitle: false,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: ConnectionHomeProfile(
          connection: connection.basicConnection,
          childConnect: (context1, stateUserConn) => (stateUserConn.loading == true)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CompenenGetBackX(onPressed: () => context.go(navigation)),
                title(),
                getUpdate(),
              ]
            )
          : ComponenLoadingLottieHorizontal(height: ThemeBox.defaultHeightBox50),
          childDisconnect: (context1, stateUserDisconn) => (stateUserDisconn.loading == true)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CompenenGetBackX(onPressed: () => context.go(navigation)),
                title(),
                SizedBox(
                  width: ThemeBox.defaultWidthBox45,
                )
              ]
            )
          : ComponenLoadingLottieHorizontal(height: ThemeBox.defaultHeightBox50)
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBlackColor6,
      appBar: header(),
      body: const BodyEditProfile(),
    );
  }
}