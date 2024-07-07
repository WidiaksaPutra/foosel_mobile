// ignore_for_file: must_be_immutable, unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_bottom_nav_pembeli/cubit_bottom_nav_pembeli.dart';
import 'package:foosel/blocs/bloc_bottom_nav_pembeli/state_bottom_nav_pembeli.dart';
import 'package:foosel/blocs/bloc_default/class/class/connection_dialog.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
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
import 'package:foosel/ui/page/user_pembeli/cart/cart_list.dart';
import 'package:foosel/ui/page/user_pembeli/home_menu_user/home_menu_user.dart';
import 'package:foosel/ui/page/user_pembeli/like/like_list.dart';
import 'package:foosel/ui/page/user_profile/profile.dart';
import 'package:foosel/ui/widgets/componen_header_logout.dart';
import 'package:foosel/ui/widgets/componen_loading.dart';
import 'package:lottie/lottie.dart';
import 'package:badges/badges.dart' as badges;

class BottomNavPembeli extends StatelessWidget with SharedPref{
  late bool loadingLogout = false;
  late BuildContext contexts;
  late Size size;
  late int currentButton = 0;

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    contexts = context;
    size = MediaQuery.of(context).size;
    sharedPref();
    return BlocBuilder<CubitBottomNavPembeli, DataStateBottomNavigasiPembeli>(
      builder: (context, state){
        currentButton = state.currentButton;
        return BlocBuilder<CubitLogout,StateDataLogout>(
          builder: (context, state1){
            loadingLogout = state1.loadingLogout;
            return Scaffold(
              appBar: appBar(),
              body: body(),
              floatingActionButton: (loadingLogout == false) ? customBottomNav() : Text(""),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              backgroundColor: (currentButton == 0 ) ? kPrimaryColor : kBlackColor6,
            );
          }
        );  
      }
    );
  }

  Widget message({required Widget contentMessage}){
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
    stream: contexts.read<CubitListMessageConnect>().getStreamFirebaseListMessage,
    builder: (context1, snapshot){
      if(snapshot.connectionState == ConnectionState.active){
        contexts.read<CubitListMessageConnect>().getListMessage(snapshot.data!.docs);
        return contentMessage;
      }else return Lottie.asset(
        "asset/animations/loading_horizontal_lottie.json",
        height: ThemeBox.defaultHeightBox20,
      );
    });   
  }

  Widget customBottomNav(){
    return Container(
    padding: EdgeInsets.all(ThemeBox.defaultWidthBox10),
    margin: EdgeInsets.only(
      left: ThemeBox.defaultWidthBox10,
      right: ThemeBox.defaultWidthBox10,
      bottom: ThemeBox.defaultHeightBox10),
    decoration: BoxDecoration(
      color: kBlackColor,
      borderRadius: BorderRadius.circular(ThemeBox.defaultRadius15),
      boxShadow: [
        BoxShadow(
          color: Colors.black,
          offset: Offset(4, 4),
          blurRadius: 15,
        ),
      ]
    ),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        children: [
          SizedBox(width: ThemeBox.defaultWidthBox20),
          IconButton(
            onPressed: () => contexts.read<CubitBottomNavPembeli>().navigation(currentButton: 0), 
            icon: message(
              contentMessage: BlocBuilder<CubitListMessageConnect, DataStateListMessage>(
                builder: (context2, listMessage){
                  if(listMessage.loading == false && listMessage.dataUser.isNotEmpty){
                    contexts.read<CubitJumlahBadges>().getBadgesMessage(listMessage.dataUser);
                  }
                  return Image.asset(
                    "asset/icon/home_icon.png",
                    color: (currentButton == 0) ? kPurpleColor : kGreyColor,
                    height: ThemeBox.defaultHeightBox20,
                  );
                },
              ),
            ),
          ),
          SizedBox(width: ThemeBox.defaultWidthBox20),
          IconButton(
            onPressed: () => contexts.read<CubitBottomNavPembeli>().navigation(currentButton: 1),
            icon: message(
              contentMessage: BlocBuilder<CubitListMessageConnect, DataStateListMessage>(
                builder: (context2, listMessage){
                  if(listMessage.loading == false && listMessage.dataUser.isNotEmpty){
                    return BlocBuilder<CubitJumlahBadges, DataStateBadges>(
                      builder: (context3, jumlahBadges){
                      if(jumlahBadges.loading == false && jumlahBadges.totalBadges.toString() != "0"){
                        prefs.setString("navBadges", jumlahBadges.totalBadges.toString());
                      }
                      return (jumlahBadges.loading == false)
                      ? (jumlahBadges.totalBadges.toString() == "0")
                        ? Image.asset(
                            "asset/icon/chat_icon.png",
                            color: (currentButton == 1) ? kPurpleColor : kGreyColor,
                            height: ThemeBox.defaultHeightBox20,
                          )
                        : badges.Badge(
                            badgeContent: Text(jumlahBadges.totalBadges.toString(), style: const TextStyle(fontSize: 12, color: Colors.white)), 
                            child: Image.asset(
                              "asset/icon/chat_icon.png",
                              color: (currentButton == 1) ? kPurpleColor : kGreyColor,
                              height: ThemeBox.defaultHeightBox20,
                            )
                          )
                      : (prefs.getString("navBadges") != null)
                      ? badges.Badge(
                          badgeContent: Text("...",
                          style: const TextStyle(fontSize: 12, color: Colors.white)), 
                          child: Image.asset(
                            "asset/icon/chat_icon.png",
                            color: (currentButton == 1) ? kPurpleColor : kGreyColor,
                            height: ThemeBox.defaultHeightBox20,
                          ),
                        )
                      : Image.asset(
                          "asset/icon/chat_icon.png",
                          color: (currentButton == 1) ? kPurpleColor : kGreyColor,
                          height: ThemeBox.defaultHeightBox20,
                        );
                      }
                    );
                  }else{
                    return Image.asset(
                      "asset/icon/chat_icon.png",
                      color: (currentButton == 1) ? kPurpleColor : kGreyColor,
                      height: ThemeBox.defaultHeightBox20,
                    );
                  }
                }
              ),
            ),
          ),
          SizedBox(width: ThemeBox.defaultWidthBox20),
          IconButton(
            onPressed: () => contexts.read<CubitBottomNavPembeli>().navigation(currentButton: 2),
            icon: Image.asset(
              "asset/icon/cart_Icon.png",
              color: (currentButton == 2) ? kPurpleColor : kGreyColor,
              height: ThemeBox.defaultHeightBox20,
            ),
          ),
          SizedBox(width: ThemeBox.defaultWidthBox20),
          IconButton(
            onPressed: () => contexts.read<CubitBottomNavPembeli>().navigation(currentButton: 3),
            icon: Image.asset(
              "asset/icon/love_icon.png",
              color: (currentButton == 3) ? kPurpleColor : kGreyColor,
              height: ThemeBox.defaultHeightBox20,
            ),
          ),
          SizedBox(width: ThemeBox.defaultWidthBox20),
          IconButton(
            onPressed: () => contexts.read<CubitBottomNavPembeli>().navigation(currentButton: 4),
            icon: Image.asset(
              "asset/icon/user_icon.png",
              color: (currentButton == 4) ? kPurpleColor : kGreyColor,
              height: ThemeBox.defaultHeightBox20,
            ),
          ),
          SizedBox(width: ThemeBox.defaultWidthBox20),
        ],
      ),
    ),);
  }

  PreferredSizeWidget? appBar(){
    switch(currentButton){
      case 1 :
        return AppBar(
          toolbarHeight: ThemeBox.defaultHeightBox80,
          backgroundColor: kPrimaryColor,
          shadowColor: kBlackColor6,
          automaticallyImplyLeading: false,
          title: Center(
            child: Text("Message Support", style: whiteTextStyle.copyWith(fontSize: defaultFont18, fontWeight: medium)),
          ),
        );
      case 2 :
        return AppBar(
          toolbarHeight: ThemeBox.defaultHeightBox80,
          backgroundColor: kPrimaryColor,
          shadowColor: kBlackColor6,
          automaticallyImplyLeading: false,
          title: Center(
            child: Text("Chart Product", style: whiteTextStyle.copyWith(fontSize: defaultFont18, fontWeight: medium)),
          ),
        );
      case 3 :
        return AppBar(
          toolbarHeight: ThemeBox.defaultHeightBox80,
          backgroundColor: kPrimaryColor,
          shadowColor: kBlackColor6,
          automaticallyImplyLeading: false,
          title: Center(
            child: Text("Favorite Product", style: whiteTextStyle.copyWith(fontSize: defaultFont18, fontWeight: medium)),
          ),
        );
      case 4 :
        ClassConnectionDialog connection = ClassConnectionDialog();
        if(loadingLogout == true){Future.delayed(Duration(seconds: 3),()=>loadingLogout = false);}
        return AppBar(
          toolbarHeight: ThemeBox.defaultHeightBox124,
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
                  onPressed: () => contexts.read<CubitLogout>().logout(context: contexts),
                )
              : Center(child: ComponenLoadingLottieHorizontal(height: ThemeBox.defaultHeightBox100)),
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
              : Center(child: ComponenLoadingLottieHorizontal(height: ThemeBox.defaultHeightBox100)),
            )
          : Center(child: ComponenLoadingLottieHorizontal(height: ThemeBox.defaultHeightBox100)),
        );
    }
    return null;
  }

  Widget body(){
    switch(currentButton){
      case 0 :
      return HomeMenuUser();
      case 1 :
      contexts.read<CubitListMessageConnect>().updateListMessage();
      return MessageList();
      case 2 :
      return Cart();
      case 3 :
      contexts.read<CubitGetLike>().getDataLike();
      return Like();
      case 4 :
      return const Profile();
      default :
      return HomeMenuUser();
    }
  }
}