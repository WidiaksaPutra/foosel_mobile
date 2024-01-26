import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/connection_dialog.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/default/ui/list_vertical_home.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/home_menu_user_klasifikasi/connection_home_menu_klasifikasi.dart';

class BodyHomeMenuKlasifikasi extends StatelessWidget{
  final double hightListView;
  const BodyHomeMenuKlasifikasi({Key? key, required this.hightListView}) : super(key: key);

  @override
  Widget build(BuildContext context){    
    ClassConnectionDialog connection = ClassConnectionDialog();
    return ConnectionHomeMenuKlasifikasi(
      connection: connection.basicConnection,
      childDisconnect: (context, state) => (state.loadingKlassifikasi == true)
      ? Center(child: CircularProgressIndicator(color: kPurpleColor))
      : ListVerticalHome(
          lengthList: state.dataKlassifikasiCategories.length, 
          data: state.dataKlassifikasiCategories, 
          labelList: "For You", 
          scrollControl: state.scrollControl, 
          loading: state.loadingScrollKlassifikasi, 
          connection: false, 
          hightListView: hightListView,
        ),
      childConnect: (context, state) => (state.loadingKlassifikasi == true)
      ? Center(child: CircularProgressIndicator(color: kPurpleColor))
      : ListVerticalHome(
          lengthList: state.dataKlassifikasiCategories.length, 
          data: state.dataKlassifikasiCategories,
          labelList: "For You", 
          scrollControl: state.scrollControl, 
          loading: state.loadingScrollKlassifikasi, 
          connection: true, 
          hightListView: hightListView,
        ),
    );
  }
}