// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/bloc/bloc/cubit_connection_example.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_dialog_basic.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/blocs/bloc_default/state/state_connection.dart';
import 'package:foosel/blocs/bloc_message/main/cubit_main_delete_messege.dart';
import 'package:foosel/blocs/bloc_message/main/cubit_main_list_jumlah_badges.dart';
import 'package:foosel/blocs/bloc_message/main/cubit_main_list_message_connect.dart';
import 'package:foosel/blocs/bloc_message/main/cubit_nav_message.dart';
import 'package:foosel/blocs/bloc_message/state_message.dart';
import 'package:foosel/routes/route_name.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:foosel/shared/theme_konstanta.dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_content_dialog(image_&_text).dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_content_dialog(image_&_title_text_&_button_yes_and_button_no).dart';
import 'package:foosel/ui/widgets/componen_loading.dart';
import 'package:foosel/ui/widgets/componen_advanced/componen_card_vertical_message.dart';
import 'package:foosel/ui/widgets/componen_page_kosong.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:badges/badges.dart' as badges;

class MessageList extends HookWidget with SharedPref, DialogBasic{
  MessageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    context.read<CubitConnectionExample>().connectCheck(readBlocConnect: {},readBlocDisconnect: {});
    Size size = MediaQuery.of(context).size;
    var statusMessage = useState(false);
    sharedPref();
    Widget ContentMessage({
      required DataStateListMessage listMessage,
      required int index,
    }){
      final String preConverted = listMessage.dataUser[index].lastTime;
      final int seconds = int.parse(preConverted.substring(18, 28));
      return ComponenMessageCardVertical(
        icon: listMessage.dataUser[index].gambar, 
        textTitle: listMessage.dataUser[index].nama, 
        textSubTitle: (listMessage.dataUser[index].status == "Offline") 
          ? formatDate.format(DateTime.fromMillisecondsSinceEpoch(seconds * 1000)) 
          : "now",
        textTailing: listMessage.dataUser[index].status, 
        onLongPress: () => (listMessage.dataUser[index].status.toString() == "Offline")
        ? voidDialogBasic(
            context: context, 
            margin: EdgeInsets.symmetric(horizontal: ThemeBox.defaultWidthBox30, vertical: MediaQuery.of(context).size.height * 0.3),
            padding: EdgeInsets.only(left: ThemeBox.defaultWidthBox30, right: ThemeBox.defaultWidthBox30, top: ThemeBox.defaultHeightBox30),
            borderRadius: BorderRadius.circular(ThemeBox.defaultRadius10),
            color: kBlackColor6,
            closeIconStatus: true,
            barrierDismissible: false,
            contentDialog: BlocBuilder<CubitDeleteMessege, StateDeleteMessage>(
              builder: (context5, state2) => (state2.loadingDeleteTransaksi == false)
              ? (statusMessage.value == false)
                ? ComponenContentDialog_ImageAndTitleTextAndButtonYesAndButtonNo(
                    image: 'asset/animations/peringatan_lottie.json',
                    titleText: delleteMessageUser,
                    onTapYes: () async{
                      await context.read<CubitDeleteMessege>().deleteDataMessage(emailPengirim: prefs.getString('email').toString(), emailPenerima: listMessage.dataUser[index].email);
                      statusMessage.value = true;
                      Future.delayed(
                        Duration(seconds: 2),
                        (){
                          Navigator.of(context).pop();
                          statusMessage.value = false;
                        },
                      );
                    },
                  )
                : (state2.statusAlert == true)
                  ? ComponenContentDialog_ImageAndTitleText(
                      image: 'asset/animations/check_lottie.json',
                      text: 'Berhasil...',
                    )
                  : ComponenContentDialog_ImageAndTitleText(
                      image: 'asset/animations/close_lottie.json', 
                      text: 'Gagal..!',
                    )
              : ComponenContentDialog_ImageAndTitleText(
                  image: 'asset/animations/loading_dialog_lottie.json', 
                  text: '...',
                )
            ),
            onTapCloseDialog: () => Navigator.of(context).pop(), 
          )
        : voidDialogBasic(
            context: context, 
            margin: EdgeInsets.symmetric(horizontal: ThemeBox.defaultWidthBox30, vertical: MediaQuery.of(context).size.height * 0.3),
            padding: EdgeInsets.only(left: ThemeBox.defaultWidthBox30, right: ThemeBox.defaultWidthBox30, top: ThemeBox.defaultHeightBox30),
            borderRadius: BorderRadius.circular(ThemeBox.defaultRadius10),
            color: kBlackColor6,
            closeIconStatus: true,
            barrierDismissible: true,
            contentDialog: ComponenContentDialog_ImageAndTitleText(
              image: 'asset/animations/peringatan_lottie.json',
              text: 'User yang ingin diDelete masih Online...',
            ), onTapCloseDialog: () => Navigator.of(context).pop(),
          ),
        onTap: () {
          prefs.setString('emailPenerima', listMessage.dataUser[index].email);
          context.read<CubitNavMessageDetail>().navigation(
            tokenPenerima: listMessage.dataUser[index].tokenNotive.toString(), 
            roleBar: 1, 
            detailMessage: false,
          );
          context.go(RouteName.detailMessage);
        },
      );
    }
    return BlocBuilder<CubitConnectionExample, DataStateConnection>(
    builder: (context, state) => (state.connectionBoolean == true)
    ? BlocBuilder<CubitListMessageConnect, DataStateListMessage>(
        builder: (context2, listMessage){
          if(listMessage.loading == false){
            return Stack(
              children: [
                if(listMessage.dataUser.isEmpty)...[
                  ComponenPageKosongBasic(
                    image: "asset/animations/chat_lottie.json", 
                    titleText: "Opss no message yet?", 
                    messageText: "You have never done a transaction", 
                    sizeHeight: size.height, 
                    sizeWidth: size.width,
                  ),
                ] else...[
                  BlocBuilder<CubitJumlahBadges, DataStateBadges>(
                    builder: (context3, jumlahBadges) => ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: listMessage.dataUser.length,
                      itemBuilder: (BuildContext context4, int index) => Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: ThemeBox.defaultHeightBox22, left: ThemeBox.defaultWidthBox30, right: ThemeBox.defaultWidthBox30),
                            child: (jumlahBadges.loading == false)
                            ? (jumlahBadges.notivBadges[index].toString() == "0")
                              ? ContentMessage(listMessage: listMessage, index: index)
                              : badges.Badge(
                                  badgeContent: Text(jumlahBadges.notivBadges[index].toString(), style: const TextStyle(fontSize: 12, color: Colors.white)), 
                                  child: ContentMessage(listMessage: listMessage, index: index)
                                )
                            : Center(child: ComponenLoadingLottieHorizontal(height: ThemeBox.defaultHeightBox50))
                          ),
                          Divider(height: ThemeBox.defaultHeightBox12, thickness: 1, color: kBlackColor8, indent: ThemeBox.defaultWidthBox30, endIndent: ThemeBox.defaultWidthBox30),
                        ],
                      ),
                    ),
                  ),
                ]
              ]
            );
          }else return ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200);
        }
      )
    : ComponenPageKosongBasic(
        image: "asset/animations/chat_lottie.json", 
        titleText: "Opss no message yet?", 
        messageText: "You have never done a transaction", 
        sizeHeight: size.height, 
        sizeWidth: size.width,
      ),
    );
  }
}