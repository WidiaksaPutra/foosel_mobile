// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_all_products/interfaces_all_products.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/state_default/state_product_basic.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_get_data_product_storage_local.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

ScrollController scrollController = ScrollController();
class CubitMainListAllProductsDisconnect extends Cubit<DataStateProductBasic> implements interfacesListAllProductDisconnect{
  final interfaceGetDataProductStorageLocal dataGetProductLocal = getItInstance<interfaceGetDataProductStorageLocal>();
  CubitMainListAllProductsDisconnect() : super(
    DataProductBasic(
      scrollControl: scrollController, 
      getData: [],
      loadingScroll: true,
      loadingApi: true,
    ),
  );

  @override
  GetListDataAllProduct() async{
    final dataLocal = await dataGetProductLocal.GetDataProductLocal();
    emit(DataProductBasic(
      scrollControl: scrollController, 
      getData: dataLocal,
      loadingScroll: false,
      loadingApi: false,
    ));
  }
}