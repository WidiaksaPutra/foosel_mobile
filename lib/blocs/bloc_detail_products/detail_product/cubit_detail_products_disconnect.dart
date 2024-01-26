// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/state_default/state_product_basic.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_get_data_product_storage_local.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

ScrollController scrollController = ScrollController();
class CubitDetailProductsDisconnect extends Cubit<DataStateProductBasic>{
  final interfaceGetDataProductStorageLocal dataGetProductLocal = getItInstance<interfaceGetDataProductStorageLocal>();
  CubitDetailProductsDisconnect() : super(
    DataProductBasic(
      scrollControl: scrollController, 
      getData: [],
      loadingScroll: true,
      loadingApi: true,
    ),
  );

  GetDetailProductDisconnect({required String tokenId}) async{
    final dataLocalWhereId = await dataGetProductLocal.GetDataProductWhereIdLocal(tokenId: tokenId);
    emit(DataProductBasic(
      scrollControl: scrollController, 
      getData: dataLocalWhereId,
      loadingScroll: false,
      loadingApi: false,
    ));
  }
}