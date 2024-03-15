// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_categories/event_categories.dart';
import 'package:foosel/blocs/bloc_categories/state_categories.dart';
import 'package:foosel/blocs/bloc_categories/interfaces_category.dart';
import 'package:foosel/interface/interface_local/helpers/interface_get_data_products_category_local.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

ScrollController scrollController = ScrollController();
late List dataList = [];
class BlocKlasifikasiCategoriesDisconnect extends Bloc<DataEventKlasifikasi, DataStateCategori> implements interfacesProductsCategoryDisconnect{
  final interfaceGetDataProductsCategoryLocal dataGetProductsCategoryLocal = getItInstance<interfaceGetDataProductsCategoryLocal>();
  BlocKlasifikasiCategoriesDisconnect() : super(
    DataCategori(
      dataKlassifikasiCategories: [], 
      loadingKlassifikasi: true, 
      loadingScrollKlassifikasi: false,
      scrollControl: false,
    )
  ){
    on<KlasifikasiCategories>((event, emit) async{
      await GetDataCategoryProductLocal(event.categoryKey);
    });
  }

  GetDataCategoryProductLocal(String categoryKey) async{
    print("data list disconnect $categoryKey");
    dataList = await dataGetProductsCategoryLocal.GetDataLocal(nameCategory: categoryKey);
    print("data list product $dataList");
    emit(
      DataCategori(
        dataKlassifikasiCategories: dataList, 
        loadingKlassifikasi: false, 
        loadingScrollKlassifikasi: false,
        scrollControl: scrollController,
      ),
    );
  }
}