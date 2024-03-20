// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/blocs/bloc_message/main/bloc_main_detail_message_connect.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:foosel/ui/widgets/componen_chat_bubble_basic.dart';
import 'package:foosel/ui/widgets/componen_loading.dart';
import 'package:foosel/ui/widgets/componen_page_kosong.dart';

class RealTimeChat extends StatelessWidget with SharedPref{
  RealTimeChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    Size size = MediaQuery.of(context).size;
    sharedPref();
    context.read<BlocDetailMessageConnect>().getStreamFirebaseChatMessage;
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
                late String preConverted = allChats[index]['time'].toString();
                late int seconds = int.parse(preConverted.substring(18, 28));
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
            return ComponenLoadingLottieBasic(height: ThemeBox.defaultHeightBox200);
          }
        }else{
          return Expanded(
            child: ComponenPageKosongBasic(
              image: "asset/animations/chat_lottie.json", 
              titleText: "Opss no message yet?", 
              messageText: "You have never done a transaction", 
              sizeHeight: size.height, 
              sizeWidth: size.width,
            ),
          );
        }
      }
    );
  }
}