// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_bottom_nav_pembeli/cubit_bottom_nav_pembeli.dart';
import 'package:foosel/blocs/bloc_bottom_nav_pembeli/state_bottom_nav_pembeli.dart';
import 'package:foosel/blocs/bloc_default/default/connection_dialog.dart';
import 'package:foosel/blocs/bloc_default/default/cubit_connection_example.dart';
import 'package:foosel/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:foosel/blocs/bloc_default/state_default/state_connection.dart';
import 'package:foosel/blocs/bloc_like/cubit_get_like.dart';
import 'package:foosel/blocs/bloc_logout/cubit_logout.dart';
import 'package:foosel/blocs/bloc_logout/state_logout.dart';
import 'package:foosel/blocs/bloc_message/main/cubit_main_list_jumlah_badges.dart';
import 'package:foosel/blocs/bloc_message/main/cubit_main_list_message_connect.dart';
import 'package:foosel/blocs/bloc_message/state_message.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';
import 'package:foosel/ui/page/connection/connection_profile.dart';
import 'package:foosel/ui/page/message/message_list.dart';
import 'package:foosel/ui/page/user_pembeli/bottomNav/floating_button_nav.dart';
import 'package:foosel/ui/page/user_pembeli/home_menu_user/home_menu_user.dart';
import 'package:foosel/ui/page/user_pembeli/like/like_list.dart';
import 'package:foosel/ui/page/user_profile/profile.dart';
import 'package:foosel/ui/widgets/componen_header_logout.dart';
import 'package:foosel/ui/widgets/componen_loading.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:badges/badges.dart' as badges;

class BottomNavPembeli extends StatelessWidget with defaultSharedPref{
  late bool loadingLogout = false;
  late BuildContext contexts;
  late Size size;
  late int currentButton = 0;

  @override
  Widget build(BuildContext context) {
    contexts = context;
    size = MediaQuery.of(context).size;
    sharedPref();
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

  Widget message({required Widget contentMessage}){
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
    stream: contexts.read<cubitListMessageConnect>().getStreamFirebaseListMessage,
    builder: (context1, snapshot){
      if(snapshot.connectionState == ConnectionState.active){
        contexts.read<cubitListMessageConnect>().getListMessage(snapshot.data!.docs);
        return contentMessage;
      }else return Lottie.asset(
        "asset/animations/loading_horizontal_lottie.json",
        height: themeBox.defaultHeightBox50,
      );
    });   
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
                child: message(contentMessage: BlocBuilder<cubitListMessageConnect, DataStateListMessage>(
                builder: (context2, listMessage){
                  if(listMessage.loading == false && listMessage.dataUser.isNotEmpty){
                    contexts.read<cubitJumlahBadges>().getBadgesMessage(listMessage.dataUser);
                  }
                  return Image.asset(
                    "asset/icon/home_icon.png",
                    color: (currentButton == 0) ? kPurpleColor : kGreyColor,
                    width: 21.0,
                    height: 20.0,
                  );
                })),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(right: 44, top: 10),
                child: message(contentMessage: BlocBuilder<cubitListMessageConnect, DataStateListMessage>(
                  builder: (context2, listMessage){
                    if(listMessage.loading == false && listMessage.dataUser.isNotEmpty){
                      return BlocBuilder<cubitJumlahBadges, DataStateBadges>(
                        builder: (context3, jumlahBadges){
                        if(jumlahBadges.loading == false && jumlahBadges.totalBadges.toString() != "0"){
                          prefs.setString("navBadges", jumlahBadges.totalBadges.toString());
                        }
                        return (jumlahBadges.loading == false)
                        ? (jumlahBadges.totalBadges.toString() == "0")
                          ? Image.asset(
                              "asset/icon/chat_icon.png",
                              color: (currentButton == 1) ? kPurpleColor : kGreyColor,
                              width: 20.0,
                              height: 18.0,
                            )
                          : badges.Badge(
                              badgeContent: Text(jumlahBadges.totalBadges.toString(), style: const TextStyle(fontSize: 12, color: Colors.white)), 
                              child: Image.asset(
                                "asset/icon/chat_icon.png",
                                color: (currentButton == 1) ? kPurpleColor : kGreyColor,
                                width: 20.0,
                                height: 18.0,
                              )
                            )
                        : (prefs.getString("navBadges") != null)
                        ? badges.Badge(
                            badgeContent: Text(prefs.getString("navBadges").toString(),
                            style: const TextStyle(fontSize: 12, color: Colors.white)), 
                            child: Image.asset(
                              "asset/icon/chat_icon.png",
                              color: (currentButton == 1) ? kPurpleColor : kGreyColor,
                              width: 20.0,
                              height: 18.0,
                            ),
                          )
                        : Image.asset(
                            "asset/icon/chat_icon.png",
                            color: (currentButton == 1) ? kPurpleColor : kGreyColor,
                            width: 20.0,
                            height: 18.0,
                          );
                        }
                      );
                    }else{
                      return Image.asset(
                        "asset/icon/chat_icon.png",
                        color: (currentButton == 1) ? kPurpleColor : kGreyColor,
                        width: 20.0,
                        height: 18.0,
                      );
                    }
                  }
                ),),
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
      if(loadingLogout == true){Future.delayed(Duration(seconds: 3),()=>loadingLogout = false);}
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
            : Center(child: ComponenLoadingLottieHorizontal(height: themeBox.defaultHeightBox100)),
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
            : Center(child: ComponenLoadingLottieHorizontal(height: themeBox.defaultHeightBox100)),
          )
        : Center(child: ComponenLoadingLottieHorizontal(height: themeBox.defaultHeightBox100)),
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