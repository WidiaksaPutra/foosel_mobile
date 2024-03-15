import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:foosel/blocs/bloc_message/event_message.dart';
import 'package:foosel/blocs/bloc_message/main/bloc_main_detail_message_connect.dart';
import 'package:foosel/blocs/bloc_message/main/cubit_nav_message.dart';
import 'package:foosel/blocs/bloc_message/state_message.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/ui/page/message/detail_message/real_time_chat.dart';
import 'package:foosel/ui/widgets/componen_bottom_chat_message.dart';
import 'package:foosel/ui/widgets/componen_loading.dart';

class BodyDetailMessage extends StatelessWidget with defaultSharedPref{
  BodyDetailMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late bool productPreview;
    sharedPref();
    
    Widget bodyTop(){
      // Size size = MediaQuery.of(context).size;
      productPreview = true;
      return BlocBuilder<cubitNavMessageDetail, DataStateNavMessageDetail>(
        builder: (context, state){
          return (state.tokenPenerima != "")
          ? Expanded(
              // height: (productPreview == true) ? size.height * 0.65 : size.height * 0.75,
              // height: size.height,
              child: RealTimeChat(),
            )
          : ComponenLoadingLottieBasic(height: themeBox.defaultHeightBox200);
        }
      );
    }

    Widget bodyBottom(){     
      return ComponenBottomChatMessage(
        nameController: "message", 
        hintText: "Typle Message...",
        // productPreview: ComponenProductPreview(image: "asset/image/sampel_sepatu_home_small.png", title: "COURT VISIO COURT VISIO", harga: "5715", productPreview: productPreview), 
        boolProductPreview: productPreview,
        iconBottom: BlocBuilder<cubitNavMessageDetail, DataStateNavMessageDetail>(
          builder: (context, state){
            return (state.tokenPenerima != "")
            ? IconButton(
                padding: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox13, vertical: themeBox.defaultHeightBox13),
                icon: Image.asset(
                  "asset/icon/icon_send_message.png",
                  height: themeBox.defaultHeightBox16,
                  width: themeBox.defaultWidthBox19,
                ),
                onPressed: () {
                  context.read<BlocDetailMessageConnect>().add(
                    DataEventPostMessage(
                      message: prefs.get("message").toString(), 
                      tokenPenerima: state.tokenPenerima,
                    )
                  );
                  prefs.remove("message");
                },
              )
            : ComponenLoadingLottieHorizontal(height: themeBox.defaultHeightBox100);
          }
        ),
      );
    }
    
    return Column(
      children: [
        bodyTop(),
        bodyBottom(),
      ],
    );
  }
}



// BlocBuilder<BlocDetailMessageConnect, dynamic>(
//   builder: (context, state){
//     if(state.loadingPostChat == false){
//       return ComponenBottomChatMessage(
//         nameController: "message", 
//         hintText: "Typle Message...",
//         // productPreview: ComponenProductPreview(image: "asset/image/sampel_sepatu_home_small.png", title: "COURT VISIO COURT VISIO", harga: "5715", productPreview: productPreview), 
//         boolProductPreview: productPreview,
//         iconBottom: IconButton(
//           padding: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox13, vertical: themeBox.defaultHeightBox13),
//           icon: Image.asset(
//             "asset/icon/icon_send_message.png",
//             height: themeBox.defaultHeightBox16,
//             width: themeBox.defaultWidthBox19,
//           ),
//           onPressed: () {
//             // context.read<BlocDetailMessageConnect>().add(
//             //   DataEventPostMessage(
//             //     emailPenerima: state.emailPenerima,
//             //     message: prefs.get("message").toString(), 
//             //     tokenPenerima: state.tokenPenerima,
//             //   )
//             // );
//             prefs.remove("message");
//           },
//         ),
//         // iconBottom: BlocBuilder<cubitNavMessageDetail, DataStateNavMessageDetail>(
//         //   builder: (context, state){
//         //     return (state.emailPenerima != "" && state.tokenPenerima != "")
//         //     ? IconButton(
//         //         padding: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox13, vertical: themeBox.defaultHeightBox13),
//         //         icon: Image.asset(
//         //           "asset/icon/icon_send_message.png",
//         //           height: themeBox.defaultHeightBox16,
//         //           width: themeBox.defaultWidthBox19,
//         //         ),
//         //         onPressed: () {
//         //           context.read<BlocDetailMessageConnect>().add(
//         //             DataEventPostMessage(
//         //               emailPenerima: state.emailPenerima,
//         //               message: prefs.get("message").toString(), 
//         //               tokenPenerima: state.tokenPenerima,
//         //             )
//         //           );
//         //           prefs.remove("message");
//         //         },
//         //       )
//         //     : ComponenLoadingLottieBasic(height: 100);
//         //   }
//         // ),
//       );
//     }else{
//       return ComponenLoadingChatMessage(
//         hintText: "Loading....",
//         iconBottom: IconButton(
//           padding: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox13, vertical: themeBox.defaultHeightBox13),
//           icon: CircularProgressIndicator(color: kWhiteColor),
//           onPressed: () {},
//         )
//       );
//     }
//   }
// );


// BlocBuilder<BlocDetailMessage, dynamic>(
//           builder: (context, state) => (state.loadingFetchChat == false)
//           ? ListView.builder(
//               physics: const BouncingScrollPhysics(),
//               reverse: true,
//               itemCount: state.message.length,
//               itemBuilder: (BuildContext context, int index) {  
//                 return ComponenChatBubbleBasic(
//                   dataMessage: state.message[index]['pesan'], 
//                   jenisUserMessage: state.message[index]['penerima'], 
//                   userPenerima: email, 
//                   // bSpace: state.bSpace[index],
//                 );
//                 // Column(
//                 //   children: [
//                     // (state.chatList[index].image == "-") 
//                     // ComponenChatBubbleBasic(
//                     //   dataMessage: state.message[index]['pesan'], 
//                     //   jenisUserMessage: state.message[index]['penerima'], 
//                     //   userPenerima: email, bSpace: state.bSpace[index],
//                     // );
//                     // ? ComponenChatBubbleBasic(image: listDataMessage[index].image, dataName: listDataMessage[index].dataName, dataHarga: listDataMessage[index].dataHarga, dataMessage: listDataMessage[index].data, jenisUserMessage: listDataMessage[index].jenisUserPembeli, bSpace: state1.bSpace[index])
//                     // : ComponenChatBubbleProduct(image: listDataMessage[index].image, dataName: listDataMessage[index].dataName, dataHarga: listDataMessage[index].dataHarga, dataMessage: listDataMessage[index].data, jenisUserMessage: listDataMessage[index].jenisUserPembeli, bSpace: state1.bSpace[index]),
//                 //   ],
//                 // );
//               },
//             )
//           : const ComponenLoadingLottieBasic(),
//         ), 