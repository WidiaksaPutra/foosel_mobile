import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:lottie/lottie.dart';

class ComponenLoadingLottieBasic extends StatelessWidget {
  final double height;
  const ComponenLoadingLottieBasic({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        "asset/animations/loading_basic_lottie.json",
        height: height,
      ),
    );
  }
}

class ComponenLoadingLottieHorizontal extends StatelessWidget {
  final double height;
  const ComponenLoadingLottieHorizontal({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      "asset/animations/loading_horizontal_lottie.json",
      height: height,
    );
  }
}
mixin loadingScrollData{
  Widget loadingScrollHeight({
    required bool loadingScrollName, 
    required double withLoading, 
    required double heightLoading, 
    required double rightLoading,
  }){
    // ignore: curly_braces_in_flow_control_structures
    return (loadingScrollName)
    ? Positioned(
        right: rightLoading,
        child: SizedBox(
          height: heightLoading,
          width: withLoading,
          child: Center(
            child: ComponenLoadingLottieHorizontal(height: themeBox.defaultHeightBox100),
          ),
        )
      )
    : const Text("");
  }
}

// class ComponenLoadingChatMessage extends StatelessWidget{
//   Widget iconBottom;
//   String hintText;
//   ComponenLoadingChatMessage({Key? key, required this.hintText, required this.iconBottom}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: themeBox.defaultHeightBox20),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     margin: EdgeInsets.only(right: themeBox.defaultWidthBox20, left: themeBox.defaultWidthBox20, bottom: themeBox.defaultHeightBox20),
//                     padding: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox16, vertical: themeBox.defaultHeightBox12),
//                     decoration: BoxDecoration(
//                       color: kBlackColor,
//                       borderRadius: BorderRadius.circular(themeBox.defaultRadius12)
//                     ),
//                     child: TextFormField(
//                       readOnly: true,
//                       keyboardType: TextInputType.multiline,
//                       minLines: 1,
//                       maxLines: 5,
//                       style: whiteTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont14),
//                       decoration: InputDecoration.collapsed(
//                         hintText: hintText.toString(),
//                         hintStyle: grayTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont14),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(right: themeBox.defaultWidthBox20, bottom: themeBox.defaultHeightBox20),
//                   decoration: BoxDecoration(
//                     color: kPurpleColor,
//                     borderRadius: BorderRadius.circular(themeBox.defaultRadius12),
//                   ),
//                   child: iconBottom,
//                 ),
//               ],
//             ),          
//           ),
//         ],
//       ),
//     );
//   }
// }