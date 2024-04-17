// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';
import 'package:go_router/go_router.dart';

class ShowDialogDetail extends StatelessWidget {
  String navigationCart, navBack;
  Widget buttonName;
  ShowDialogDetail({Key? key,
    required this.buttonName, 
    required this.navigationCart,
    required this.navBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> successDialog(){
      return showDialog(
        context: context, 
        builder: ((BuildContext context) => Container(
          margin: EdgeInsets.symmetric(horizontal: ThemeBox.defaultWidthBox30, vertical: MediaQuery.of(context).size.height * 0.3),
          padding: EdgeInsets.only(left: ThemeBox.defaultWidthBox30, right: ThemeBox.defaultWidthBox30, top: ThemeBox.defaultHeightBox30, bottom: ThemeBox.defaultHeightBox20),
          decoration: BoxDecoration(
            color: kBlackColor6,
            borderRadius: BorderRadius.circular(ThemeBox.defaultRadius30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => context.go(navBack),
                  child: Image.asset(
                    'asset/icon/close_icon.png',
                    height: ThemeBox.defaultHeightBox10,
                    width: ThemeBox.defaultWidthBox10,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'asset/icon/icon_success_dialog.png',
                        height: ThemeBox.defaultHeightBox100,
                        width: ThemeBox.defaultWidthBox100,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: ThemeBox.defaultHeightBox12),
                        child: Text("Hurray :)", style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont18)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: ThemeBox.defaultHeightBox20),
                        child: Text("Item added successfully", style: grayTextStyle2.copyWith(fontWeight: regular, fontSize: defaultFont14)),
                      ),
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed:() => context.go(navigationCart),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: ThemeBox.defaultHeightBox10, horizontal: ThemeBox.defaultWidthBox10),
                  decoration: BoxDecoration(
                    color: kPurpleColor,
                    borderRadius: BorderRadius.circular(ThemeBox.defaultRadius12),
                  ),
                  child: Text("View My Cart", style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: defaultFont16),),
                )
              ),
            ],
          ),
        )
      ));
    }

    return GestureDetector(
      onTap: () => successDialog(),
      child: buttonName,
    );
  }
}