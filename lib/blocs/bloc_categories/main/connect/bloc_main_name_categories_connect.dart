// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:foosel/blocs/bloc_categories/event_categories.dart';
import 'package:foosel/blocs/bloc_categories/interfaces_category.dart';
import 'package:foosel/blocs/bloc_categories/state_categories.dart';
import 'package:foosel/helpers/categories/interfaces/interface_delete_data_category_local.dart';
import 'package:foosel/helpers/categories/interfaces/interface_insert_data_category_local.dart';
import 'package:foosel/service/api_categories/interface_get_data_category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

ScrollController scrollController = ScrollController();
late dynamic dataList = [];
late bool loadingScrolling = false;
class BlocNameCategoriesConnect extends Bloc<DataEventKlasifikasi, DataStateNameCategories> implements InterfacesCategoryNameConnect{
  final InterfaceGetDataCategory dataGetNameCategoryFuture = getItInstance<InterfaceGetDataCategory>();
  final InterfaceInsertDataCategoryLocal dataInsertCategoryLocal = getItInstance<InterfaceInsertDataCategoryLocal>();
  final InterfaceDeleteDataCategoryLocal dataDeleteCategoryLocal = getItInstance<InterfaceDeleteDataCategoryLocal>();
  BlocNameCategoriesConnect() : super(
    DataNameCategories(
      dataNameCategories: dataList, 
      loadingNameCategories: true, 
      loadingScrollNameCategories: loadingScrolling,
      scrollControl: false,
    )
  ){
    on<NameCategories>((event, emit) async{
      await getNameCategories();
      await scrollControlNameCategories();
      await saveLocalDataCategories();
    });
  }

  @override
  getNameCategories() async{
    loadingScrolling = false;
    dataList = await dataGetNameCategoryFuture.getDataCategory(loadingApiService: true);
    emit(
      DataNameCategories(
        dataNameCategories: dataList, 
        loadingNameCategories: false, 
        loadingScrollNameCategories: loadingScrolling,
        scrollControl: scrollController,
      ),
    );
  }

  @override
  scrollControlNameCategories() async{
    scrollController.addListener(() async {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent && loadingScrolling == false){
        loadingScrolling = true;
        dataList = await dataGetNameCategoryFuture.getDataCategory(loadingApiService: true);
        emit(
          DataNameCategories(
            dataNameCategories: dataList, 
            loadingNameCategories: false, 
            loadingScrollNameCategories: loadingScrolling,
            scrollControl: scrollController,
          ),
        );
        await Future.delayed(
          const Duration(milliseconds: 3000),
          () => loadingScrolling = false,
        );
        emit(
          DataNameCategories(
            dataNameCategories: dataList, 
            loadingNameCategories: false, 
            loadingScrollNameCategories: loadingScrolling,
            scrollControl: scrollController,
          ),
        );
      }
    });
  }

  @override
  saveLocalDataCategories() async{
    await dataDeleteCategoryLocal.deleteDataCategoryLocal();
    if(dataList.length != 0){
      dataList.forEach((data) async{
        await dataInsertCategoryLocal.insertDataCategoryLocal(
          id: data.id.toString(),
          name: data.name.toString(),
        );
      });
    }
  }
}