// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/state/state_product_basic.dart';
import 'package:foosel/helpers/products/product_all/interfaces/interface_get_data_product_local.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

ScrollController scrollController = ScrollController();
class CubitDetailProductsDisconnect extends Cubit<DataStateProductBasic>{
  final InterfaceGetDataProductLocal dataGetProductLocal = getItInstance<InterfaceGetDataProductLocal>();
  CubitDetailProductsDisconnect() : super(
    DataProductBasic(
      scrollControl: scrollController, 
      getData: [],
      loadingScroll: true,
      loadingApi: true,
    ),
  );

  getDetailProductDisconnect({required String tokenId}) async{
    final dataLocalWhereId = await dataGetProductLocal.getDataProductWhereIdLocal(tokenId: tokenId);
    emit(DataProductBasic(
      scrollControl: scrollController, 
      getData: dataLocalWhereId,
      loadingScroll: false,
      loadingApi: false,
    ));
  }
}