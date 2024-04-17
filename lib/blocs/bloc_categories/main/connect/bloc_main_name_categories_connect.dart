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

ScrollController _scrollController = ScrollController();
late dynamic _dataList = [];
late bool _loadingScrolling = false, _loadingApi = true;
class BlocNameCategoriesConnect extends Bloc<DataEventKlasifikasi, DataStateNameCategories> implements InterfacesCategoryNameConnect{
  final InterfaceGetDataCategory _dataGetNameCategoryFuture = getItInstance<InterfaceGetDataCategory>();
  final InterfaceInsertDataCategoryLocal _dataInsertCategoryLocal = getItInstance<InterfaceInsertDataCategoryLocal>();
  final InterfaceDeleteDataCategoryLocal _dataDeleteCategoryLocal = getItInstance<InterfaceDeleteDataCategoryLocal>();
  BlocNameCategoriesConnect() : super(
    DataNameCategories(
      dataNameCategories: _dataList, 
      loadingNameCategories: _loadingApi, 
      loadingScrollNameCategories: _loadingScrolling,
      scrollControl: _loadingScrolling,
    )
  ){
    on<NameCategories>((event, emit) async{
      await getNameCategories();
      await saveLocalDataCategories();
      scrollControlNameCategories();
    });
  }

  @override
  Future<void> getNameCategories() async{
    _loadingScrolling = false;
    _loadingApi = false;
    _dataList = await _dataGetNameCategoryFuture.getDataCategory(loadingApiService: true);
    _emitState();
  }

  @override
  Future<void> saveLocalDataCategories() async{
    await _dataDeleteCategoryLocal.deleteDataCategoryLocal();
    if(_dataList.length != 0){
      _dataList.forEach((_data) async{
        await _dataInsertCategoryLocal.insertDataCategoryLocal(
          id: _data.id.toString(),
          name: _data.name.toString(),
        );
      });
    }
  }

  @override
  void scrollControlNameCategories() async{
    _scrollController.addListener(() async {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent && _loadingScrolling == false){
        _loadingScrolling = true;
        _loadingApi = false;
        _dataList = await _dataGetNameCategoryFuture.getDataCategory(loadingApiService: true);
        _emitState();
        await Future.delayed(
          const Duration(milliseconds: 3000),
          () => _loadingScrolling = false,
        );
        _emitState();
      }
    });
  }

  void _emitState(){
    emit(
      DataNameCategories(
        dataNameCategories: _dataList, 
        loadingNameCategories: _loadingApi, 
        loadingScrollNameCategories: _loadingScrolling,
        scrollControl: _scrollController,
      ),
    );
  }
}