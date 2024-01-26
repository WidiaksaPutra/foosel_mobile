// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/connection_dialog.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_navigasi_role.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_user/event_user.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_user/main/connect/bloc_main_update_user_connect.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/connection/connection_profile.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/user_profile/account/body_edit_profile.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_get_back.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_loading.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatelessWidget with defaultSharedPref, navigasiRole, navigasiRoleBarRead{
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
    navigasi(context);
    navigasiR();
    sharedPref();
    Widget title() => Text("Edit Profile", 
      style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont18)
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
        height: themeBox.defaultHeightBox13,
        width: themeBox.defaultWidthBox18,
      ),
    ); 

    PreferredSizeWidget header(){
      ClassConnectionDialog connection = ClassConnectionDialog();
      return AppBar(
        toolbarHeight: themeBox.defaultHeightBox90,
        backgroundColor: kPrimaryColor,
        shadowColor: kBlackColor6,
        centerTitle: false,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: ConnectionHomeProfile(
          connection: connection.basicConnection,
          childConnect: (context, stateUserConn) => (stateUserConn.loading == true)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CompenenGetBackX(navBack: navigation),
                title(),
                getUpdate(),
              ]
            )
          : ComponenLoadingHashDataMap(boolLoading: stateUserConn.loading, data: stateUserConn.dataUser),
          childDisconnect: (context, stateUserDisconn) => (stateUserDisconn.loading == true)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CompenenGetBackX(navBack: navigation),
                title(),
                SizedBox(
                  width: themeBox.defaultWidthBox45,
                )
              ]
            )
          : ComponenLoadingHashDataMap(boolLoading: stateUserDisconn.loading, data: stateUserDisconn.dataUser),
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