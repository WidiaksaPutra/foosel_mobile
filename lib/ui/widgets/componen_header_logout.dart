import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';

class ComponenHeaderLogout extends StatelessWidget{
  final String image, title, email, logoutIcon;
  final VoidCallback onPressed;
  ComponenHeaderLogout({Key? key, 
    required this.image, 
    required this.title, 
    required this.email, 
    required this.logoutIcon, 
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){},
            child:  ClipOval(
              child: SizedBox.fromSize(
                child: (image.contains("https://"))
                ? Image.network(
                    image.toLowerCase(),
                    width: defaultFont54,
                    height: defaultFont54,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    image,
                    width: defaultFont54,
                    height: defaultFont54,
                    fit: BoxFit.cover,
                  )
              ),
            ),
          ),
          SizedBox(width: themeBox.defaultWidthBox20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hallo, $title", style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont24), overflow: TextOverflow.fade),
                Text(email, style: grayTextStyle.copyWith(fontWeight: regular, fontSize: defaultFont16)),
              ],
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: Image.asset(
              logoutIcon,
              height: themeBox.defaultHeightBox20,
              width: themeBox.defaultWidthBox20,
            ),
          )
        ],
      ),
    );
  }
}