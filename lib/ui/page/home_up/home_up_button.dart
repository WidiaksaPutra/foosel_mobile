// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/bloc_button_up/cubit_button_up.dart';
import 'package:foosel/blocs/bloc_default/class/class/connection_dialog.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/ui/page/connection/connection_category.dart';
import 'package:foosel/ui/widgets/componen_data_up_button.dart';
import 'package:foosel/ui/widgets/componen_loading.dart';
import 'package:foosel/shared/theme_box.dart';

class HomeUpButton extends StatelessWidget with SharedPref, LoadingScrollData{
  HomeUpButton({Key? key}) : super(key: key);

  void OnTapButtonUp({
    required int currentBody,
    required int currentTop, 
    required dynamic readBloc, 
    required BuildContext context,
    required int index,
  }){
    context.read<CubitUpButton>().upButton(
      currentBody: currentBody, 
      currentTop: currentTop, 
      readBloc: readBloc, 
      index: index,
    );
  }
  
  @override
  Widget build(BuildContext context) {
    ThemeBox(context);
    int currentTop = 0;
    int currentBody = 0;
    ClassConnectionDialog connection = ClassConnectionDialog();
    sharedPref();
    return ConnectionCategory(
      connection: connection.basicConnection,
      childConnect: (context, stateConn) => LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        return (stateConn.loadingNameCategories == true)
        ? Center(child: ComponenLoadingLottieHorizontal(height: ThemeBox.defaultHeightBox100))
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
                      readBloc: {prefs.setString("categoriesIdConnect", stateConn.dataNameCategories[index].id.toString())},
                    );
                  }
                );
              }
            ),
            LoadingScrollHeight(
              context: context,
              heightLoading: ThemeBox.defaultHeightBox50, 
              loadingScrollName: stateConn.loadingScrollNameCategories, 
              rightLoading: ThemeBox.defaultWidthBox20, 
              withLoading: constraints.maxWidth,
            ),
          ],);
      }), 
      childDisconnect: (context, stateDisc) => LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        return (stateDisc.loadingNameCategories == true)
        ? Center(child: ComponenLoadingLottieHorizontal(height: ThemeBox.defaultHeightBox100))
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
                    readBloc: {prefs.setString("categoriesIdDisconnect", stateDisc.dataNameCategories[index]['name'].toString())},
                  );
                }
              );
            }
          );
      }),
    );
  }
}