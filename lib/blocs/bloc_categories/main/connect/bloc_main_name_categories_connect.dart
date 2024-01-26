// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_categories/event_categories.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_categories/state_categories.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_categories/interfaces_category.dart';
import 'package:flutter_laravel_toko_sepatu/interface/default/interface_delete_data_storage_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_insert_data_category_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_get_data_category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

ScrollController scrollController = ScrollController();
late dynamic dataList = [];
late bool loadingScrolling = false;
class BlocNameCategoriesConnect extends Bloc<DataEventKlasifikasi, DataStateNameCategories> implements interfacesCategoryNameConnect{
  final interfaceGetDataCategory dataGetNameCategoryFuture = getItInstance<interfaceGetDataCategory>();
  final interfaceInsertDataCategoryLocal dataInsertCategoryLocal = getItInstance<interfaceInsertDataCategoryLocal>();
  final interfaceDeleteDataStorageLocal dataDeleteCategoryLocal = getItInstance<interfaceDeleteDataStorageLocal>();
  BlocNameCategoriesConnect() : super(
    DataNameCategories(
      dataNameCategories: dataList, 
      loadingNameCategories: true, 
      loadingScrollNameCategories: loadingScrolling,
      scrollControl: false,
    )
  ){
    on<NameCategories>((event, emit) async{
      await GetNameCategories();
      await ScrollControlNameCategories();
      await SaveLocalDataCategories();
    });
  }

  @override
  GetNameCategories() async{
    loadingScrolling = false;
    // print(dataList);
    dataList = await dataGetNameCategoryFuture.GetDataCategory(loadingApiService: true);
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
  ScrollControlNameCategories() async{
    scrollController.addListener(() async {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent && loadingScrolling == false){
        loadingScrolling = true;
        dataList = await dataGetNameCategoryFuture.GetDataCategory(loadingApiService: true);
        await Future.delayed(const Duration(milliseconds: 1000));
        emit(
          DataNameCategories(
            dataNameCategories: dataList, 
            loadingNameCategories: false, 
            loadingScrollNameCategories: loadingScrolling,
            scrollControl: scrollController,
          ),
        );
        await Future.delayed(const Duration(milliseconds: 1000));
        loadingScrolling = false;
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
  SaveLocalDataCategories() async{
    await dataDeleteCategoryLocal.DeleteDataLocal();
    if(dataList.length < 5){
      for(int i = 0; i < dataList.length; i++) {
        await dataInsertCategoryLocal.InsertDataLocal(id: dataList[i].id.toString(), name: dataList[i].name.toString());
      }
    }
  }
}