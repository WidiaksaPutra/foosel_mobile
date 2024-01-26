import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';
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
          margin: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox30, vertical: MediaQuery.of(context).size.height * 0.3),
          padding: EdgeInsets.only(left: themeBox.defaultWidthBox30, right: themeBox.defaultWidthBox30, top: themeBox.defaultHeightBox30, bottom: themeBox.defaultHeightBox20),
          decoration: BoxDecoration(
            color: kBlackColor6,
            borderRadius: BorderRadius.circular(themeBox.defaultRadius30),
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
                    height: themeBox.defaultHeightBox10,
                    width: themeBox.defaultWidthBox10,
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
                        height: themeBox.defaultHeightBox100,
                        width: themeBox.defaultWidthBox100,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox12),
                        child: Text("Hurray :)", style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont18)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: themeBox.defaultHeightBox20),
                        child: Text("Item added successfully", style: grayTextStyle2.copyWith(fontWeight: regular, fontSize: defaultFont14)),
                      ),
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed:() => context.go(navigationCart),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox10, horizontal: themeBox.defaultWidthBox10),
                  decoration: BoxDecoration(
                    color: kPurpleColor,
                    borderRadius: BorderRadius.circular(themeBox.defaultRadius12),
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