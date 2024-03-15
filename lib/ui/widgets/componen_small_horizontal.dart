// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:foosel/shared/theme_box.dart';
// import 'package:foosel/shared/theme_data_dummy.dart';
// import 'package:foosel/shared/theme_font.dart';
// import 'package:foosel/shared/theme_text_style.dart';

// class ComponenSmallHorizontal extends StatelessWidget {
//   String titleImage;
//   ComponenSmallHorizontal({Key? key, required this.titleImage}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(titleImage, style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont14)),
//         Padding(
//           padding: EdgeInsets.only(top: themeBox.defaultHeightBox12),
//           child: SizedBox(
//             height: themeBox.defaultHeightBox60,
//             child: ListView.builder(
//               physics: const BouncingScrollPhysics(),
//               scrollDirection: Axis.horizontal,
//               itemCount: imageFamiliarShoes.length,
//               itemBuilder: ((context, index) => Padding(
//                 padding: EdgeInsets.only(right: themeBox.defaultWidthBox16),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(themeBox.defaultRadius6),
//                   child: Image.asset(
//                     imageFamiliarShoes[index],
//                     height: themeBox.defaultHeightBox54,
//                     width: themeBox.defaultWidthBox54,
//                   ),
//                 ),
//               ))
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }