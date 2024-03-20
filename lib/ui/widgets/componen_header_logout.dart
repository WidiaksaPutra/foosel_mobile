import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';

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
    ThemeBox(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: ThemeBox.defaultHeightBox30),
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
          SizedBox(width: ThemeBox.defaultWidthBox20),
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
              height: ThemeBox.defaultHeightBox20,
              width: ThemeBox.defaultWidthBox20,
            ),
          )
        ],
      ),
    );
  }
}