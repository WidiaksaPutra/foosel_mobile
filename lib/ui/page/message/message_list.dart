import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/cubit_connection_example.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/state_default/state_connection.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_message/main/cubit_main_list_message_connect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_message/main/cubit_nav_message.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_message/state_message.dart';
import 'package:flutter_laravel_toko_sepatu/routes/route_name.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_loading.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_message_card_vertical.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_page_kosong.dart';
import 'package:go_router/go_router.dart';

class MessageList extends StatelessWidget with defaultSharedPref{
  MessageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    sharedPref();
    context.read<cubitConnectionExample>().connectCheck(readBlocConnect: {},readBlocDisconnect: {});

    MessageConnection(){
      return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: context.read<cubitListMessageConnect>().getStreamFirebaseListMessage,
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.active){
            context.read<cubitListMessageConnect>().getListMessage(snapshot.data!.docs);
            return BlocBuilder<cubitListMessageConnect, DataStateListMessage>(
              builder: (context, listMessage) => (listMessage.loading == false)
              ? Stack(
                  children: [
                    if(listMessage.dataUser.isEmpty)...[
                      ComponenPageKosongBasic(
                        image: "asset/icon/headset_icon.png", 
                        titleText: "Opss no message yet?", 
                        messageText: "You have never done a transaction", 
                        size: size,
                      ),
                    ] else...[
                      ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: listMessage.dataUser.length,
                        itemBuilder: (BuildContext context , int index){
                          final String preConverted = listMessage.dataUser[index].lastTime;
                          final int seconds = int.parse(preConverted.substring(18, 28));
                          return Column(
                            children: [
                              ComponenMessageCardVertical(
                                icon: listMessage.dataUser[index].gambar, 
                                textTitle: listMessage.dataUser[index].nama, 
                                textSubTitle: (listMessage.dataUser[index].status == "Offline") 
                                  ? formatDate.format(DateTime.fromMillisecondsSinceEpoch(seconds * 1000)) 
                                  : "now", 
                                textTailing: listMessage.dataUser[index].status, 
                                onTap: () {
                                  prefs.setString('emailPenerima', listMessage.dataUser[index].email);
                                  context.read<cubitNavMessageDetail>().navigation(tokenPenerima: listMessage.dataUser[index].tokenNotive.toString(), roleBar: 1, detailMessage: false);
                                  context.go(RouteName.detailMessage);
                                },
                              ),
                              Divider(height: themeBox.defaultHeightBox12, thickness: 1, color: kBlackColor8, indent: themeBox.defaultWidthBox30, endIndent: themeBox.defaultWidthBox30),
                            ],
                          );
                        }, 
                      ),
                    ]
                  ]
                )
              : const ComponenLoadingBasic(colors: kPurpleColor)
            );
          }
          else{
            return const ComponenLoadingBasic(colors: kPurpleColor);
          }
        }
      );
    }

    return BlocBuilder<cubitConnectionExample, DataStateConnection>(
      builder: (context, state) => (state.connectionBoolean == true)
      ? MessageConnection()
      : ComponenPageKosongBasic(
        image: "asset/icon/headset_icon.png", 
        titleText: "Opss no message yet?", 
        messageText: "You have never done a transaction", 
        size: size,
      ),
    );
  }
}