// // ignore_for_file: must_be_immutable
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_laravel_toko_sepatu/blocs/bloc_like/cubit_insert_like.dart';
// import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
// import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
// import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
// import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';

// class RowLikeCopy extends HookWidget {
//   late String name, categoryName, tokenId, description, price, imagePath;
//   RowLikeCopy({Key? key, 
//     required this.name,
//     required this.categoryName,
//     required this.tokenId,
//     required this.description,
//     required this.price,
//     required this.imagePath,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final like = useState(false);
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(name, style: whiteTextStyle.copyWith(fontSize: defaultFont18, fontWeight: semiBold)),
//               Text(categoryName, style: grayTextStyle2.copyWith(fontSize: defaultFont12, fontWeight: regular)),
//             ],
//           ),
//         ),
//         GestureDetector(
//           onTap: (){
//             like.value = !like.value;
//             if(like.value == true){
//               context.read<cubitInsertLike>().SaveLocalDataLike(
//                 tokenId: tokenId, 
//                 name: name,
//                 nameCategory: categoryName, 
//                 description: description, 
//                 price: price,
//                 imagePath: imagePath,
//               );
//             }else{

//             }
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 backgroundColor: (like.value == false) ? kRedColor : kBlueColor2,
//                 padding: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox12),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.only(topLeft: Radius.circular(themeBox.defaultRadius8), topRight: Radius.circular(themeBox.defaultRadius8)),
//                 ),
//                 content: Text((like.value == false) ? "Has been removed from the Wishlist" : "Has been added to the Wishlist", 
//                   style: whiteTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont12),
//                   textAlign: TextAlign.center),
//               ),
//             );
//           },
//           child: Image.asset(
//             (like.value == false) ? 'asset/icon/black_love_icon.png' : 'asset/icon/blue_love_icon.png',
//             width: themeBox.defaultWidthBox46,
//             height: themeBox.defaultHeightBox46,
//           ),
//         ),
//       ],
//     );
//   }
// }