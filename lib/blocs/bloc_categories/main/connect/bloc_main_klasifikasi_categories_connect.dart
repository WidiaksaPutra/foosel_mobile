// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_categories/event_categories.dart';
import 'package:foosel/blocs/bloc_categories/interfaces_category.dart';
import 'package:foosel/blocs/bloc_categories/state_categories.dart';
import 'package:foosel/service/api_products/interfaces/interface_get_data_products_category.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

ScrollController scrollController = ScrollController();
late bool loadingScrolling = false;
late List dataList = [];
class BlocKlasifikasiCategoriesConnect extends Bloc<DataEventKlasifikasi, DataStateCategori> implements InterfacesProductsCategoryConnect{
  final InterfaceGetDataProductsCategory dataGetProductCategoryFuture = getItInstance<InterfaceGetDataProductsCategory>();
  BlocKlasifikasiCategoriesConnect() : super(
    DataCategori(
      dataKlassifikasiCategories: dataList, 
      loadingKlassifikasi: true, 
      loadingScrollKlassifikasi: loadingScrolling,
      scrollControl: false,
    )
  ){
    on<KlasifikasiCategories>((event, emit) async{
      await getDataCategoryProduct(categoryKey: event.categoryKey);
      await scrollControlCategoryProduct(categoryKey: event.categoryKey);
    });
  }

  @override
  getDataCategoryProduct({required String categoryKey}) async {
    loadingScrolling = false;
    dataList = await dataGetProductCategoryFuture.getDataProductsCategory(categoriesId: categoryKey, fresh: true);
    emit(
      DataCategori(
        dataKlassifikasiCategories: dataList, 
        loadingKlassifikasi: false, 
        loadingScrollKlassifikasi: loadingScrolling,
        scrollControl: scrollController,
      ),
    );
  }
  
  @override
  scrollControlCategoryProduct({required String categoryKey}) {
    scrollController.addListener(() async {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent && loadingScrolling == false){
        loadingScrolling = true;
        dataList = await dataGetProductCategoryFuture.getDataProductsCategory(categoriesId: categoryKey, fresh: false);
        emit(
          DataCategori(
            dataKlassifikasiCategories: dataList, 
            loadingKlassifikasi: false, 
            loadingScrollKlassifikasi: loadingScrolling,
            scrollControl: scrollController,
          ),
        );
        await Future.delayed(
          Duration(milliseconds: 3000),
          () => loadingScrolling = false,
        );
        emit(
          DataCategori(
            dataKlassifikasiCategories: dataList, 
            loadingKlassifikasi: false,
            loadingScrollKlassifikasi: loadingScrolling,
            scrollControl: scrollController,
          ),
        );
      }
    });
  }
}