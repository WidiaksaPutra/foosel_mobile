// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_all_products/event_all_products.dart';
import 'package:foosel/blocs/bloc_all_products/interfaces_all_products.dart';
import 'package:foosel/blocs/bloc_default/state/state_product_basic.dart';
import 'package:foosel/helpers/products/product_all/interfaces/interface_delete_data_product_local.dart';
import 'package:foosel/helpers/products/product_all/interfaces/interface_insert_data_products_local.dart';
import 'package:foosel/service/api_products/interfaces/interface_get_data_product.dart';
import 'package:foosel/service/api_konstanta.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

ScrollController _scrollController = ScrollController();
late List _dataList = [];
late bool _loadingScrolling = false, _loadingApi = true;
class BlocAllProductConnect extends Bloc<DataEventAllProduct,DataStateProductBasic> implements InterfacesAllProductConnect{
  final InterfaceGetDataProduct _dataGetProduct = getItInstance<InterfaceGetDataProduct>();
  final InterfaceInsertDataProductsLocal _dataGetProductLocal = getItInstance<InterfaceInsertDataProductsLocal>();
  final InterfaceDeleteDataProductLocal _dataDeleteProductLocal = getItInstance<InterfaceDeleteDataProductLocal>();
  BlocAllProductConnect() : super(
    DataProductBasic(
      scrollControl: _scrollController,
      getData: _dataList,
      loadingScroll: _loadingScrolling,
      loadingApi: _loadingApi,
    ),
  ){
    on<Product>((event, emit) async{
      await getDataAllProduct(pages: event.pages);
      await saveLocalDataAllProduct(); 
      scrollControlAllProduct(pages: event.pages);
    });
  }

  @override
  Future<void> getDataAllProduct({required int pages}) async {
    _loadingScrolling = false;
    _dataList = await _dataGetProduct.getDataProduct(pages: pages);
    _loadingApi = false;
    _emitState();
  }
  
  @override
  Future<void> saveLocalDataAllProduct() async{
    await _dataDeleteProductLocal.deleteDataProductLocal();
    if(_dataList.length <= 10){
      for(int i = 0; i < _dataList.length; i++) {
        await _dataGetProductLocal.insertDataLocal(
          description: _dataList[i].description.toString(),
          tokenId: _dataList[i].tokenId.toString(),
          name: _dataList[i].name.toString(),
          email: _dataList[i].email.toString(),
          nameCategory: _dataList[i].category!.name.toString(),
          price: _dataList[i].price.toString(),
          imagePath: "${Api.linkURL}/${_dataList[i].urlImage.toString()}",
        );
      }
    }  
  }
  
  @override
  scrollControlAllProduct({required int pages}) {
    _scrollController.addListener(() async {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent && _loadingScrolling == false){
        _loadingScrolling = true;
        pages = pages + 4;
        _dataList = await _dataGetProduct.getDataProduct(pages: pages);
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
      DataProductBasic(
        scrollControl: _scrollController,
        getData: _dataList,
        loadingScroll: _loadingScrolling,
        loadingApi: _loadingApi,
      ),
    );
  }
}