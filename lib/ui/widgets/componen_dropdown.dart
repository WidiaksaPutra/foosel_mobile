// import 'package:flutter/material.dart';
// import 'package:foosel/shared/theme_color.dart';
// import 'package:foosel/shared/theme_font.dart';
// import 'package:foosel/shared/theme_text_style.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ComponenTextDropDownBasic extends StatelessWidget{
//   final String hintText;
//   final double paddingVertical, paddingHorizontal, radiusBorder, fontSize;
//   final List<dynamic> list;
//   final Color colorBorder;
//   final dynamic onClicked;
//   final IconData? dropdownIcon;

//   const ComponenTextDropDownBasic({ Key? key,
//     required this.colorBorder,
//     required this.paddingVertical,
//     required this.paddingHorizontal,
//     required this.radiusBorder, 
//     required this.hintText,
//     required this.list,
//     required this.fontSize,
//     required this.onClicked,
//     required this.dropdownIcon
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: paddingVertical),
//       decoration: BoxDecoration(
//         border: Border.all(color: colorBorder),
//         borderRadius: BorderRadius.circular(radiusBorder.r), 
//       ),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton(
//           itemHeight: 50,
//           hint: Center(child: Text(hintText, style: whiteTextStyle.copyWith(fontSize: fontSize.sp, fontWeight: medium))),
//           icon: Icon(dropdownIcon, color: kPrimaryColor,),
//           style: blackTextStyle.copyWith(fontSize: fontSize.sp, fontWeight: medium),
//           items: list.map(buildMenuItems).toList(),
//           borderRadius: BorderRadius.circular(radiusBorder.r),
//           underline: const SizedBox(),
//           isExpanded: true,
//           onChanged:(value){
//             onClicked(value: value, list: list);
//           },
//         ),
//       ), 
//     );
//   }

//   DropdownMenuItem<String> buildMenuItems(dynamic item)
//   => DropdownMenuItem(
//     value: item.isNotEmpty ? item : null,
//     child: Center(child: Text(item)),
//   );
// }