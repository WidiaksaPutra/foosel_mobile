// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/state/state_product_basic.dart';
import 'package:foosel/blocs/bloc_detail_products/interfaces/interfaces_cubit_detail_products_disconnect.dart';
import 'package:foosel/helpers/products/product_all/interfaces/interface_get_data_product_local.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

ScrollController _scrollController = ScrollController();
class CubitDetailProductsDisconnect extends Cubit<DataStateProductBasic> implements InterfacesCubitDetailProductsDisconnect{
  final InterfaceGetDataProductLocal _dataGetProductLocal = getItInstance<InterfaceGetDataProductLocal>();
  CubitDetailProductsDisconnect() : super(
    DataProductBasic(
      scrollControl: _scrollController, 
      getData: [],
      loadingScroll: true,
      loadingApi: true,
    ),
  );
  @override
  Future<void> getDetailProductDisconnect({required String tokenId}) async{
    final _dataLocalWhereId = await _dataGetProductLocal.getDataProductWhereIdLocal(tokenId: tokenId);
    emit(DataProductBasic(
      scrollControl: _scrollController, 
      getData: _dataLocalWhereId,
      loadingScroll: false,
      loadingApi: false,
    ));
  }
}