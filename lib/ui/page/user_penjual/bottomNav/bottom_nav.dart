// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foosel/blocs/bloc_bottom_nav_penjual/cubit_bottom_nav_penjual.dart';
import 'package:foosel/blocs/bloc_bottom_nav_penjual/state_bottom_nav_pembeli.dart';
import 'package:foosel/blocs/bloc_default/class/class/connection_dialog.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
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
import 'package:foosel/ui/page/user_penjual/cart/cart_penjual.dart';
import 'package:foosel/ui/page/user_penjual/home_menu_user/home_menu_user.dart';
import 'package:foosel/ui/page/user_penjual/insert_barang/button_insert/add_insert/insert_add_barang.dart';
import 'package:foosel/ui/page/user_profile/profile.dart';
import 'package:foosel/ui/widgets/componen_header_logout.dart';
import 'package:foosel/ui/widgets/componen_loading.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:badges/badges.dart' as badges;

class BottomNavPenjual extends HookWidget with SharedPref {
  BottomNavPenjual({ Key? key }) : super(key: key);
  late Size size;

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    var loadingLogout = useState<bool>(false);
    var currentButton = useState<int>(0);
    size = MediaQuery.of(context).size;
    sharedPref();
    return BlocBuilder<CubitBottomNavPenjual, DataStateBottomNavigasiPenjual>(
      builder: (context, state){
        currentButton.value = state.currentButton;
        return BlocBuilder<CubitLogout,StateDataLogout>(
          builder: (context, state){
            loadingLogout.value = state.loadingLogout;
            return Scaffold(
              appBar: appBar(contexts: context, currentButton: currentButton.value, loadingLogout: loadingLogout.value),
              body: body(contexts: context, currentButton: currentButton.value),
              // floatingActionButton: (loadingLogout == false) ? FloatingButtonNav() : Text(""),
              // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: (loadingLogout.value == false) ? customBottomNav(contexts: context, currentButton: currentButton.value) : Text(""),
              backgroundColor: (currentButton.value == 0 ) ? kPrimaryColor : kBlackColor6,
            );
          }
        );
      }
    );
  }

  Widget message({
    required Widget contentMessage,
    required BuildContext contexts,
  }){
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
    stream: contexts.read<CubitListMessageConnect>().getStreamFirebaseListMessage,
    builder: (context1, snapshot){
      if(snapshot.connectionState == ConnectionState.active){
        contexts.read<CubitListMessageConnect>().getListMessage(snapshot.data!.docs);
        return contentMessage;
      }else return Lottie.asset(
        "asset/animations/loading_horizontal_lottie.json",
        height: ThemeBox.defaultHeightBox50,
      );
    });
  }

  Widget customBottomNav({
    required BuildContext contexts,
    required int currentButton,
  }){
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(30),
      ),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 12,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          backgroundColor: kBlackColor,
          type: BottomNavigationBarType.fixed,
          onTap: (value){            
            contexts.read<CubitBottomNavPenjual>().navigation(currentButton: value);
          },
          items: [            
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: message(
                  contexts: contexts,
                  contentMessage: BlocBuilder<CubitListMessageConnect, DataStateListMessage>(
                    builder: (context2, listMessage){
                      if(listMessage.loading == false && listMessage.dataUser.isNotEmpty){
                        contexts.read<CubitJumlahBadges>().getBadgesMessage(listMessage.dataUser);
                      }
                      return Image.asset(
                        "asset/icon/home_icon.png",
                        color: (currentButton == 0) ? kPurpleColor : kGreyColor,
                        width: 21.0,
                        height: 20.0,
                      );
                    },
                  ),
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: message(
                  contexts: contexts,
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
                                ),
                              )
                          : (prefs.getString("navBadges") != null)
                          ? badges.Badge(
                              badgeContent: Text("...",
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
                    },
                  ),
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.asset(
                  "asset/icon/cart_Icon.png",
                  color: (currentButton == 2) ? kPurpleColor : kGreyColor,
                  width: 20.0,
                  height: 22.0,
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.asset(
                  "asset/icon/icon_add.png",
                  color: (currentButton == 3) ? kPurpleColor : kGreyColor,
                  width: 28.0,
                  height: 25.0,
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.asset(
                  "asset/icon/user_icon.png",
                  color: (currentButton == 4) ? kPurpleColor : kGreyColor,
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

  PreferredSizeWidget? appBar({
    required BuildContext contexts,
    required int currentButton,
    required bool loadingLogout,
  }){
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
            child: Text("Cart Penjual", style: whiteTextStyle.copyWith(fontSize: defaultFont18, fontWeight: medium)),
          ),
        );
      case 3 :
        return AppBar(
          toolbarHeight: ThemeBox.defaultHeightBox80,
          backgroundColor: kPrimaryColor,
          shadowColor: kBlackColor6,
          automaticallyImplyLeading: false,
          title: Center(
            child: Text("Add Barang", style: whiteTextStyle.copyWith(fontSize: defaultFont18, fontWeight: medium),            ),
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
                onPressed: (){}
                // voidDialogBasic(context: context, text: 'Koneksi Internet Terputus', titleText: 'penggunaan aplikasi akan dibatasi karena aplikasi dalam mode offline', image: 'asset/icon/bad_connaction.png', onTap: () {  }),
              )
            : Center(child: ComponenLoadingLottieHorizontal(height: ThemeBox.defaultHeightBox100)),
          )
        : Center(child: ComponenLoadingLottieHorizontal(height: ThemeBox.defaultHeightBox100)),
      );
    }
    return null;
  }

  void removeAddProduct() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('namaProduct');
    prefs.remove('deskripsi');
    prefs.remove('price');
    prefs.remove('typeProduct');
    prefs.remove('indexDropdown');
  }

  void removeUpdateProduct() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getBool('statusUpdateNull') == true){
      prefs.remove('namaProduct');
      prefs.remove('deskripsi');
      prefs.remove('price');
      prefs.remove('typeProduct');
      prefs.remove('indexDropdown');
      prefs.remove('tokenId');
      prefs.remove('oldImage');
      prefs.remove('statusUpdateNull');
    }
  }

  Widget body({
    required BuildContext contexts,
    required int currentButton,
  }){
    switch(currentButton){
      case 0 :
      removeAddProduct();
      return HomeMenuUser();
      case 1 :
      removeAddProduct();
      contexts.read<CubitListMessageConnect>().updateListMessage();
      return MessageList();
      case 2 :
      removeAddProduct();
      return CartPenjual();
      case 3 :
      removeUpdateProduct();
      return InsertAddBarangPenjual();
      case 4 :
      removeAddProduct();
      return const Profile();
      default :
      removeAddProduct();
      return HomeMenuUser();
    }
  }
}