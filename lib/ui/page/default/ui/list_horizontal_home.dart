// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/routes/route_name.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_font.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_text_style.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_card_horizontal.dart';

class ListHorizontalHome extends StatelessWidget {
  late int lengthList;
  late List data;
  late String labelList;
  late bool connection;
  ListHorizontalHome({Key? key, required this.lengthList, required this.data, required this.labelList, required this.connection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: themeBox.defaultHeightBox30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelList, style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: defaultFont22)),
          SizedBox(
            height: themeBox.defaultHeightBox292,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: lengthList,
              itemBuilder: (BuildContext context, int index) {
                return (connection == true)
                ? ComponenCardHorizontal(
                    nama: data[index].name.toString(), 
                    jenis: data[index].category.name.toString(), 
                    harga: data[index].price.toString(), 
                    gambar: "asset/image/sampel_sepatu_home_medium.png", 
                    navigation: '${RouteName.detailProductPembeli}?idProduct=${data[index].tokenId.toString()}'
                  )
                : ComponenCardHorizontal(
                    nama: data[index]['name'].toString(), 
                    jenis: data[index]['nameCategory'].toString(), 
                    harga: data[index]['price'].toString(), 
                    gambar: "asset/image/sampel_sepatu_home_medium.png", 
                    navigation: '${RouteName.detailProductPembeli}?idProduct=${data[index]['tokenId'].toString()}',
                  );
              },
            ),
          ),
        ],
      ),
    );
  }
}