import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_categories/event_categories.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_categories/state_categories.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_categories/interfaces_category.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_get_data_products_category_local.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

ScrollController scrollController = ScrollController();
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
    dynamic dataList = await dataGetProductsCategoryLocal.GetDataLocal(nameCategory: categoryKey);
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