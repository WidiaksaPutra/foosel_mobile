import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_categories/event_categories.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_categories/main/connect/bloc_main_klasifikasi_categories_connect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_categories/main/disconnect/bloc_main_klasifikasi_categories_disconnect.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/bloc_button_up/cubit_button_up.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/connection_dialog.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_color.dart';
import 'package:flutter_laravel_toko_sepatu/ui/page/connection/connection_category.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_data_up_button.dart';
import 'package:flutter_laravel_toko_sepatu/ui/widgets/componen_loading.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_box.dart';

class HomeUpButton extends StatelessWidget with loadingScrollData{
  const HomeUpButton({Key? key}) : super(key: key);

  void OnTapButtonUp({
    required int currentBody, 
    required int currentTop, 
    required dynamic readBloc, 
    required BuildContext context,
    required int index,
  }) async{
    await context.read<cubitUpButton>().upButton(
      currentBody: currentBody, 
      currentTop: currentTop, 
      readBloc: readBloc, 
      index: index,
    );
    Future.delayed(const Duration(milliseconds: 1000));
  }
  
  @override
  Widget build(BuildContext context) {
    int currentTop = 0;
    int currentBody = 0;
    ClassConnectionDialog connection = ClassConnectionDialog();
    return Container(
      height: themeBox.defaultHeightBox50,
      margin: EdgeInsets.symmetric(vertical: themeBox.defaultHeightBox30),
      child: ConnectionCategory(
        connection: connection.basicConnection,
        childConnect: (context, stateConn) => LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
          return (stateConn.loadingNameCategories == true)
          ? Center(child: CircularProgressIndicator(color: kPurpleColor))
          : Stack(children: [
              ListView.builder(
                controller: stateConn.scrollControl,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: stateConn.dataNameCategories.length,
                itemBuilder: (BuildContext context, int index) {
                  return ComponenDataUpButton(
                    index: index, 
                    dataName: stateConn.dataNameCategories[index].name.toString(), 
                    dataLength: stateConn.dataNameCategories.length,
                    onTap: () {
                      OnTapButtonUp(
                        context: context, 
                        currentBody: currentBody, 
                        currentTop: currentTop, 
                        index: index, 
                        readBloc: {context.read<BlocKlasifikasiCategoriesConnect>().add(KlasifikasiCategories(categoryKey: stateConn.dataNameCategories[index].id.toString()))}, 
                      );
                    }
                  );
                }
              ),
              loadingScroll(stateConn.loadingScrollNameCategories, constraints.maxWidth, themeBox.defaultWidthBox20),
            ]);
        }), 
        childDisconnect: (context, stateDisc) => LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
          return (stateDisc.loadingNameCategories == true)
          ? Center(child: CircularProgressIndicator(color: kPurpleColor))
          : ListView.builder(
              controller: stateDisc.scrollControl,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: stateDisc.dataNameCategories.length,
              itemBuilder: (BuildContext context, int index) {
                return ComponenDataUpButton(
                  dataName: stateDisc.dataNameCategories[index]['name'].toString(), 
                  dataLength: stateDisc.dataNameCategories.length, 
                  index: index, 
                  onTap: () {
                    OnTapButtonUp(
                      context: context, 
                      currentBody: currentBody, 
                      currentTop: currentTop,
                      index: index, 
                      readBloc: {context.read<BlocKlasifikasiCategoriesDisconnect>().add(KlasifikasiCategories(categoryKey: stateDisc.dataNameCategories[index]['name'].toString()))},
                    );
                  }
                );
              }
            );
        }),
      ),
    );
  }
}