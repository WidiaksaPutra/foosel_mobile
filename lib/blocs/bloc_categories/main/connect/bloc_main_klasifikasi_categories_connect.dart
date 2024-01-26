// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_categories/event_categories.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_categories/state_categories.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_categories/interfaces_category.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_get_data_products_category.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

ScrollController scrollController = ScrollController();
late bool loadingScrolling = false;
late dynamic dataList = [];
class BlocKlasifikasiCategoriesConnect extends Bloc<DataEventKlasifikasi, DataStateCategori> implements interfacesProductsCategoryConnect{
  final interfaceGetDataProductsCategory dataGetProductCategoryFuture = getItInstance<interfaceGetDataProductsCategory>();
  BlocKlasifikasiCategoriesConnect() : super(
    DataCategori(
      dataKlassifikasiCategories: dataList, 
      loadingKlassifikasi: true, 
      loadingScrollKlassifikasi: loadingScrolling,
      scrollControl: false,
    )
  ){
    on<KlasifikasiCategories>((event, emit) async{
      await GetDataCategoryProduct(categoryKey: event.categoryKey);
      await ScrollControlCategoryProduct(categoryKey: event.categoryKey);
    });
  }
  
  @override
  GetDataCategoryProduct({required String categoryKey}) async{
    loadingScrolling = false;
    dataList = await dataGetProductCategoryFuture.GetDataProductsCategory(categoriesId: categoryKey, fresh: true);
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
  ScrollControlCategoryProduct({required String categoryKey}) async{
    scrollController.addListener(() async {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent && loadingScrolling == false){
        loadingScrolling = true;
        dataList = await dataGetProductCategoryFuture.GetDataProductsCategory(categoriesId: categoryKey, fresh: false);
        await Future.delayed(const Duration(milliseconds: 1000));
        emit(
          DataCategori(
            dataKlassifikasiCategories: dataList, 
            loadingKlassifikasi: false, 
            loadingScrollKlassifikasi: loadingScrolling,
            scrollControl: scrollController,
          ),
        );
        await Future.delayed(const Duration(milliseconds: 1000));
        loadingScrolling = false;
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