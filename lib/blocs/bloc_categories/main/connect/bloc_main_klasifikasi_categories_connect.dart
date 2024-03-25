// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_categories/event_categories.dart';
import 'package:foosel/blocs/bloc_categories/interfaces_category.dart';
import 'package:foosel/blocs/bloc_categories/state_categories.dart';
import 'package:foosel/service/api_products/interfaces/interface_get_data_products_category.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

ScrollController _scrollController = ScrollController();
late bool _loadingScrolling = false, _loadingApi = true;
late List _dataList = [];
class BlocKlasifikasiCategoriesConnect extends Bloc<DataEventKlasifikasi, DataStateCategori> implements InterfacesProductsCategoryConnect{
  final InterfaceGetDataProductsCategory _dataGetProductCategory = getItInstance<InterfaceGetDataProductsCategory>();
  BlocKlasifikasiCategoriesConnect() : super(
    DataCategori(
      dataKlassifikasiCategories: _dataList, 
      loadingKlassifikasi: _loadingApi, 
      loadingScrollKlassifikasi: _loadingScrolling,
      scrollControl: _scrollController,
    )
  ){
    on<KlasifikasiCategories>((event, emit) async{
      await getDataCategoryProduct(
        categoryKey: event.categoryKey,
        pages: event.pages,
      );
      scrollControlCategoryProduct(
        categoryKey: event.categoryKey,
        pages: event.pages,
      );
    });
  }

  @override
  Future<void> getDataCategoryProduct({
    required int pages,
    required String categoryKey,
  }) async {
    _loadingScrolling = false;
    _loadingApi = false;
    _dataList = await _dataGetProductCategory.getDataProductsCategory(
      categoriesId: categoryKey,
      fresh: true,
    );
    _emitState();
  }
  
  @override
  scrollControlCategoryProduct({
    required int pages,
    required String categoryKey,
  }) {
    _scrollController.addListener(() async {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent && _loadingScrolling == false){
        _loadingScrolling = true;
        _dataList = await _dataGetProductCategory.getDataProductsCategory(
          categoriesId: categoryKey,
          fresh: false,
        );
        _loadingApi = false;
        _emitState();
        await Future.delayed(
          Duration(milliseconds: 3000),
          () => _loadingScrolling = false,
        );
        _emitState();
      }
    });
  }

  void _emitState(){
    emit(
      DataCategori(
        dataKlassifikasiCategories: _dataList, 
        loadingKlassifikasi: _loadingApi,
        loadingScrollKlassifikasi: _loadingScrolling,
        scrollControl: _scrollController,
      ),
    );
  }
}