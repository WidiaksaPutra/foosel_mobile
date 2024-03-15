import 'package:flutter/material.dart';
import 'package:foosel/blocs/bloc_default/default/connection_dialog.dart';
import 'package:foosel/shared/theme_box.dart';
import 'package:foosel/ui/page/connection/connection_home_menu_klasifikasi.dart';
import 'package:foosel/ui/page/default/ui/list_horizontal_home.dart';
import 'package:foosel/ui/page/default/ui/list_vertical_home.dart';
import 'package:foosel/ui/widgets/componen_loading.dart';

class BodyHomeMenuKlasifikasi extends StatelessWidget{
  final double hightListView;
  const BodyHomeMenuKlasifikasi({Key? key, required this.hightListView}) : super(key: key);

  @override
  Widget build(BuildContext context){    
    ClassConnectionDialog connection = ClassConnectionDialog();
    return ConnectionHomeMenuKlasifikasi(
      connection: connection.basicConnection,
      childDisconnect: (context, state) => (state.loadingKlassifikasi == true)
      ? Center(child: ComponenLoadingLottieBasic(height: themeBox.defaultHeightBox200))
      : ListHorizontalHome(
          lengthList: state.dataKlassifikasiCategories.length, 
          data: state.dataKlassifikasiCategories,
          scrollControl: state.scrollControl, 
          loading: state.loadingScrollKlassifikasi,
          connection: false, 
          heightPage: hightListView,
        ),
      childConnect: (context, state) => (state.loadingKlassifikasi == true)
      ? Center(child: ComponenLoadingLottieBasic(height: themeBox.defaultHeightBox200))
      : ListVerticalHome(
          lengthList: state.dataKlassifikasiCategories.length, 
          data: state.dataKlassifikasiCategories,
          scrollControl: state.scrollControl, 
          loading: state.loadingScrollKlassifikasi, 
          connection: true, 
          hightListView: hightListView,
        ),
    );
  }
}