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
mixin LoadingScrollData{
  Widget LoadingScrollHeight({
    required bool loadingScrollName, 
    required double withLoading, 
    required double heightLoading, 
    required double rightLoading,
    required BuildContext context,
  }){
    ThemeBox(context);
    // ignore: curly_braces_in_flow_control_structures
    return (loadingScrollName)
    ? Positioned(
        right: rightLoading,
        child: SizedBox(
          height: heightLoading,
          width: withLoading,
          child: Center(
            child: ComponenLoadingLottieHorizontal(height: ThemeBox.defaultHeightBox100),
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
//       margin: EdgeInsets.only(top: ThemeBox.defaultHeightBox20),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     margin: EdgeInsets.only(right: ThemeBox.defaultWidthBox20, left: ThemeBox.defaultWidthBox20, bottom: ThemeBox.defaultHeightBox20),
//                     padding: EdgeInsets.symmetric(horizontal: ThemeBox.defaultWidthBox16, vertical: ThemeBox.defaultHeightBox12),
//                     decoration: BoxDecoration(
//                       color: kBlackColor,
//                       borderRadius: BorderRadius.circular(ThemeBox.defaultRadius12)
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
//                   margin: EdgeInsets.only(right: ThemeBox.defaultWidthBox20, bottom: ThemeBox.defaultHeightBox20),
//                   decoration: BoxDecoration(
//                     color: kPurpleColor,
//                     borderRadius: BorderRadius.circular(ThemeBox.defaultRadius12),
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