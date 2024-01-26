import 'package:flutter/material.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_categories/event_categories.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_categories/state_categories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_categories/interfaces_category.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_get_data_category_storage_local.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

ScrollController scrollController = ScrollController();
class BlocNameCategoriesDisconnect extends Bloc<DataEventKlasifikasi, DataStateNameCategories> implements interfacesCategoryNameDisconnect{
  final interfaceGetDataCategoryStorageLocal dataGetNameCategoriesLocal = getItInstance<interfaceGetDataCategoryStorageLocal>();
  BlocNameCategoriesDisconnect() : super(
    DataNameCategories(
      dataNameCategories: [], 
      loadingNameCategories: true, 
      loadingScrollNameCategories: false,
      scrollControl: false,
    )
  ){
    on<NameCategories>((event, emit) async{
      await GetDataNameCategoriesLocal();
    });
  }

  GetDataNameCategoriesLocal() async{
    dynamic dataList = await dataGetNameCategoriesLocal.GetDataCategoryLocal();
    // ignore: invalid_use_of_visible_for_testing_member
    emit(
      DataNameCategories(
        dataNameCategories: dataList, 
        loadingNameCategories: false, 
        loadingScrollNameCategories: false,
        scrollControl: scrollController,
      ),
    );
  }
}