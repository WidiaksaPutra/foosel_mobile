// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foosel/shared/theme_color.dart';
import 'package:foosel/shared/theme_font.dart';
import 'package:foosel/shared/theme_text_style.dart';
import 'package:foosel/shared/theme_box.dart';

class BodyAddImage extends StatelessWidget {
  late List imageFileList;
  dynamic selectImage, selectImageCamera;
  BodyAddImage({Key? key, required this.imageFileList, required this.selectImage, required this.selectImageCamera}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), 
                itemCount: imageFileList.length,
                itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.file(
                      imageFileList[index],
                      fit: BoxFit.cover,
                    ),
                  );
                }
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox10, vertical: themeBox.defaultHeightBox4),
                margin: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox10),
                decoration: BoxDecoration(
                  color: kPurpleColor,
                  borderRadius: BorderRadius.circular(themeBox.defaultRadius12),
                ),
                child: TextButton(
                  onPressed: (){
                    selectImage();
                  },
                  child: Text("galery", style: grayTextStyle3.copyWith(fontWeight: medium, fontSize: defaultFont16)),
                ),  
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: themeBox.defaultWidthBox10, vertical: themeBox.defaultHeightBox4),
                margin: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox10),
                decoration: BoxDecoration(
                  color: kPurpleColor,
                  borderRadius: BorderRadius.circular(themeBox.defaultRadius12),
                ),
                child: TextButton(
                  onPressed: (){
                    selectImageCamera();
                  },
                  child: Text("camera", style: grayTextStyle3.copyWith(fontWeight: medium, fontSize: defaultFont16)),
                ),  
              ),
            ],
          ),
        ],
      )
    );
  }
}