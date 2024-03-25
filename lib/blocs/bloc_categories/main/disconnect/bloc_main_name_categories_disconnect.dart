// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:foosel/blocs/bloc_categories/event_categories.dart';
import 'package:foosel/blocs/bloc_categories/interfaces_category.dart';
import 'package:foosel/blocs/bloc_categories/state_categories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/helpers/categories/interfaces/interface_get_data_category_local.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

ScrollController _scrollController = ScrollController();
late List _dataList = [];
class BlocNameCategoriesDisconnect extends Bloc<DataEventKlasifikasi, DataStateNameCategories> implements InterfacesCategoryNameDisconnect{
  final InterfaceGetDataCategoryLocal _dataGetNameCategoriesLocal = getItInstance<InterfaceGetDataCategoryLocal>();
  BlocNameCategoriesDisconnect() : super(
    DataNameCategories(
      dataNameCategories: _dataList, 
      loadingNameCategories: true, 
      loadingScrollNameCategories: false,
      scrollControl: _scrollController,
    )
  ){
    on<NameCategories>((event, emit) async{
      await getDataNameCategoriesLocal();
    });
  }
  
  @override
  Future<void> getDataNameCategoriesLocal() async{
    _dataList = await _dataGetNameCategoriesLocal.getDataCategoryLocal();
    emit(
      DataNameCategories(
        dataNameCategories: _dataList,
        loadingNameCategories: false, 
        loadingScrollNameCategories: false,
        scrollControl: _scrollController,
      ),
    );
  }
}