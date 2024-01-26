import 'package:flutter/material.dart';

class ComponenListViewVertical extends StatelessWidget {
  double sizeHeightBox;
  Widget content;
  ComponenListViewVertical({ Key? key, required this.sizeHeightBox, required this.content }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      children: [
        ConstrainedBox(//container yang dapat menentukan batas maksimal box dan minimal box. dalam kasus ini perbedaannya dengan container, bahwa container kurang responsive
          constraints: BoxConstraints(minHeight: sizeHeightBox),
          child: IntrinsicHeight(//gunanya mengatur ketinggian hight child agar responsive, penggunaannya harus dengan ConstrainedBox,
          //SizeBox salah satu alternative, tapi kurang responsive dalam kasus ini, UnconstrainedBox?
            child: content,
          ),
        ),
      ],      
    );
  }
}