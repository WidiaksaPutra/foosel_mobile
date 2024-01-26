// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_message/main/bloc_main_detail_message_connect.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_chat_bubble_basic.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_loading.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_page_kosong.dart';

class RealTimeChat extends StatelessWidget with defaultSharedPref{
  RealTimeChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    sharedPref();
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: context.read<BlocDetailMessageConnect>().getStreamFirebaseChatMessage,
      builder: (context, snapshot){
        if(snapshot.data != null){
          if(snapshot.connectionState == ConnectionState.active){
            var allChats = snapshot.data!.docs;
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              reverse: true,
              itemCount: allChats.length,
              itemBuilder: (BuildContext context, int index) {
                final String preConverted = allChats[index]['time'].toString();
                final int seconds = int.parse(preConverted.substring(18, 28));
                context.read<BlocDetailMessageConnect>().updateFirebaseChatMessage(emailPenerima: prefs.getString('emailPenerima').toString(), emailPengirim: prefs.getString('email').toString());
                return 
                // BlocBuilder<CubitBottomSpace, dynamic>(
                //   builder: (context, state2) => 
                  ComponenChatBubbleBasic(
                    dataMessage: allChats[index]['pesan'], 
                    jenisUserMessage: allChats[index]['penerima'], 
                    userPenerima: prefs.getString('emailPenerima').toString(), 
                    dataTimeMinute: formatMinute.format(DateTime.fromMillisecondsSinceEpoch(seconds * 1000)), 
                    dataIsRead: allChats[index]['isRead'],
                    // bSpace: state2.bSpace[index],
                  );
                // );
              },
            );
          }else{
            return const ComponenLoadingBasic(colors: kPurpleColor);
          }
        }else{
          return ComponenPageKosongBasic(
            image: "asset/icon/headset_icon.png", 
            titleText: "Opss no message yet?", 
            messageText: "You have never done a transaction",
            size: size,
          );
        }
      }
    );
  }
}