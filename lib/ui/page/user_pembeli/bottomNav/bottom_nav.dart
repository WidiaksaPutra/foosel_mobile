// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_bottom_nav_pembeli/cubit_bottom_nav_pembeli.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_bottom_nav_pembeli/state_bottom_nav_pembeli.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/connection_dialog.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_like/cubit_get_like.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_logout/cubit_logout.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_logout/state_logout.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_message/main/cubit_main_list_message_connect.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/connection/connection_profile.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/message/message_list.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/user_pembeli/bottomNav/floating_button_nav.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/home_up/home_menu_user.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/user_pembeli/like/like_list.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/user_profile/profile.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_header_logout.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavPembeli extends StatelessWidget {
  late bool loadingLogout = false;
  late BuildContext contexts;
  late int currentButton = 0;

  @override
  Widget build(BuildContext context) {
    contexts = context;
    return BlocBuilder<cubitBottomNavPembeli, DataStateBottomNavigasiPembeli>(
      builder: (context, state){
        currentButton = state.currentButton;
        return BlocBuilder<cubitLogout,StateDataLogout>(
          builder: (context, state1){
            loadingLogout = state1.loadingLogout;
            return Scaffold(
              appBar: appBar(),
              body: body(),
              floatingActionButton: (loadingLogout == false) ? FloatingButtonNav() : Text(""),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: (loadingLogout == false) ? customBottomNav() : Text(""),
              backgroundColor: (currentButton == 0 ) ? kPrimaryColor : kBlackColor6,
            );
          }
        );  
      }
    );
  }

  Widget customBottomNav(){
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 12,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          backgroundColor: kBlackColor,
          type: BottomNavigationBarType.fixed,
          onTap: (value){
            contexts.read<cubitBottomNavPembeli>().navigation(currentButton: value);
          },
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.asset(
                  "asset/icon/home_icon.png",
                  color: (currentButton == 0) ? kPurpleColor : kGreyColor,
                  width: 21.0,
                  height: 20.0,
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(right: 44, top: 10),
                child: Image.asset(
                  "asset/icon/chat_icon.png",
                  color: (currentButton == 1) ? kPurpleColor : kGreyColor,
                  width: 20.0,
                  height: 18.0,
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(left: 44, top: 10),
                child: Image.asset(
                  "asset/icon/love_icon.png",
                  color: (currentButton == 2) ? kPurpleColor : kGreyColor,
                  width: 20.0,
                  height: 18.0,
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.asset(
                  "asset/icon/user_icon.png",
                  color: (currentButton == 3) ? kPurpleColor : kGreyColor,
                  width: 18.0,
                  height: 20.0,
                ),
              ),
              label: "",
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget? appBar(){
    switch(currentButton){
      case 1 :
        return AppBar(
          toolbarHeight: themeBox.defaultHeightBox80,
          backgroundColor: kPrimaryColor,
          shadowColor: kBlackColor6,
          automaticallyImplyLeading: false,
          title: Center(
            child: Text("Message Support", style: whiteTextStyle.copyWith(fontSize: defaultFont18, fontWeight: medium)),
          ),
        );
      case 2 :
        return AppBar(
          toolbarHeight: themeBox.defaultHeightBox80,
          backgroundColor: kPrimaryColor,
          shadowColor: kBlackColor6,
          automaticallyImplyLeading: false,
          title: Center(
            child: Text("Favorite Product", style: whiteTextStyle.copyWith(fontSize: defaultFont18, fontWeight: medium)),
          ),
        );
      case 3 :
      ClassConnectionDialog connection = ClassConnectionDialog();
      // Size size = MediaQuery.of(context).size;
      return AppBar(
        toolbarHeight: themeBox.defaultHeightBox124,
        backgroundColor: kPrimaryColor,
        shadowColor: kBlackColor6,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: (loadingLogout == false)
        ? ConnectionHomeProfile(
            connection: connection.basicConnection,
            childConnect: (BuildContext context1, stateUserConn) => (stateUserConn.loading == true)
            ? ComponenHeaderLogout(
                image: stateUserConn.dataUser.profilePhotoPath.toString(),
                title: stateUserConn.dataUser.name.toString(), 
                email: stateUserConn.dataUser.email.toString(),
                logoutIcon: "asset/icon/logout_bottom.png", 
                onPressed: () => contexts.read<cubitLogout>().logout(context: contexts),
              )
            : Center(child: CircularProgressIndicator(color: kPurpleColor)),
            childDisconnect: (BuildContext context1, stateUserDisconn) => (stateUserDisconn.loading == true)
            ? ComponenHeaderLogout(
                image: "asset/icon/profile_user.png", 
                title: stateUserDisconn.dataUser['nama'].toString(), 
                email: stateUserDisconn.dataUser['email'].toString(), 
                logoutIcon: "asset/icon/logout_bottom.png", 
                onPressed: (){
                  // voidDialogBasic(
                  //   context: context1, 
                  //   image: 'asset/icon/bad_connaction.png', 
                  //   text: 'Koneksi Internet Terputus', 
                  //   titleText: 'penggunaan aplikasi akan dibatasi karena aplikasi dalam mode offline',
                  //   onTap: () {context1.go(RouteName.profile);},
                  // );
                }
              )
            : Center(child: CircularProgressIndicator(color: kPurpleColor)),
          )
        : Center(child: CircularProgressIndicator(color: kPurpleColor)),
      );
    }
    return null;
  }

  // void closeBlocHomeMenuUser(){
    // contexts.read<BlocAllProductConnect>().close();
  // }

  void messageList() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('emailPenerima');
  }

  Widget body(){
    switch(currentButton){
      case 0 :
      messageList();
      return HomeMenuUser();
      case 1 :
      contexts.read<cubitListMessageConnect>().updateListMessage();
      return MessageList();
      case 2 :
      messageList();
      contexts.read<CubitGetLike>().GetDataLike();
      return Like();
      case 3 :
      messageList();
      return const Profile();
      default :
      messageList();
      return HomeMenuUser();
    }
  }
}

// case 0 :
      // Size size = MediaQuery.of(context).size;
      // return (Get.parameters['pageNav'] == "profile")
      // ? AppBar(
      //     toolbarHeight: defaultHeightBox124,
      //     backgroundColor: kPrimaryColor,
      //     shadowColor: kBlackColor6,
      //     centerTitle: false,
      //     automaticallyImplyLeading: false,
      //     title: const ComponenHeaderLogout(image: "asset/icon/profile_user.png", title: "Alex", email: "@alexkeinn", logoutIcon: "asset/icon/logout_bottom.png"),
      //   )
      // : AppBar(
      //     backgroundColor: kPrimaryColor,
      //     toolbarHeight: 0,
      //   );