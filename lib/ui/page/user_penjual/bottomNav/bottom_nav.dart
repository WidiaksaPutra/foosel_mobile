// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foosel/blocs/bloc_bottom_nav_penjual/cubit_bottom_nav_penjual.dart';
import 'package:foosel/blocs/bloc_bottom_nav_penjual/state_bottom_nav_pembeli.dart';
import 'package:foosel/blocs/bloc_default/bloc/bloc/cubit_connection_example.dart';
import 'package:foosel/blocs/bloc_default/class/class/connection_dialog.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/blocs/bloc_logout/cubit_logout.dart';
import 'package:foosel/blocs/bloc_logout/state_logout.dart';
import 'package:foosel/blocs/bloc_message/main/cubit_main_list_jumlah_badges.dart';
import 'package:foosel/blocs/bloc_message/main/cubit_main_list_message_connect.dart';
import 'package:foosel/blocs/bloc_message/state_message.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/cubit_get_transaksi_user_pembeli.dart';
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

class BottomNavPenjual extends StatelessWidget with SharedPref {
  BottomNavPenjual({ Key? key }) : super(key: key);
  late Size size;
  late int currentButton = 0;
  late bool loadingLogout = false;
  late BuildContext contexts;

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    contexts = context;
    size = MediaQuery.of(context).size;
    sharedPref();
    return BlocBuilder<CubitBottomNavPenjual, DataStateBottomNavigasiPenjual>(
      builder: (context, state){
        currentButton = state.currentButton;
        return BlocBuilder<CubitLogout,StateDataLogout>(
          builder: (context, state){
            loadingLogout = state.loadingLogout;
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
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
    decoration: BoxDecoration(
      color: kBlackColor,
      borderRadius: BorderRadius.circular(15),
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
            onPressed: () => contexts.read<CubitBottomNavPenjual>().navigation(currentButton: 0), 
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
            onPressed: () => contexts.read<CubitBottomNavPenjual>().navigation(currentButton: 1),
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
            onPressed: () => contexts.read<CubitBottomNavPenjual>().navigation(currentButton: 2),
            icon: Image.asset(
              "asset/icon/cart_Icon.png",
              color: (currentButton == 2) ? kPurpleColor : kGreyColor,
              height: ThemeBox.defaultHeightBox20,
            ),
          ),
          SizedBox(width: ThemeBox.defaultWidthBox20),
          IconButton(
            onPressed: () => contexts.read<CubitBottomNavPenjual>().navigation(currentButton: 3),
            icon: Image.asset(
              "asset/icon/icon_add.png",
              color: (currentButton == 3) ? kPurpleColor : kGreyColor,
              height: ThemeBox.defaultHeightBox20,
            ),
          ),
          SizedBox(width: ThemeBox.defaultWidthBox20),
          IconButton(
            onPressed: () => contexts.read<CubitBottomNavPenjual>().navigation(currentButton: 4),
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

  void cartProduct(){
    contexts.read<CubitConnectionExample>().connectCheck(
      readBlocConnect: {
        contexts.read<CubitGetTransaksiUserPembeli>().getDataTransaksiHistory(),
      }, 
      readBlocDisconnect: {}
    );
  }

  Widget body(){
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
      cartProduct();
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