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

ScrollController scrollController = ScrollController();
late List dataList = [];
late bool loadingScrolling = false, loadingApi = true;
class BlocAllProductConnect extends Bloc<DataEventAllProduct,DataStateProductBasic> implements InterfacesAllProductConnect{
  final InterfaceGetDataProduct dataGetProduct = getItInstance<InterfaceGetDataProduct>();
  final InterfaceInsertDataProductsLocal dataGetProductLocal = getItInstance<InterfaceInsertDataProductsLocal>();
  final InterfaceDeleteDataProductLocal dataDeleteProductLocal = getItInstance<InterfaceDeleteDataProductLocal>();
  BlocAllProductConnect() : super(
    DataProductBasic(
      scrollControl: scrollController,
      getData: dataList,
      loadingScroll: loadingScrolling,
      loadingApi: loadingApi,
    ),
  ){
    on<Product>((event, emit) async{
      await getDataAllProduct(pages: event.pages);
      await saveLocalDataAllProduct();
      await scrollControlAllProduct(pages: event.pages);
    });
  }

  @override
  getDataAllProduct({required int pages}) async {
    loadingScrolling = false;
    dataList = await dataGetProduct.getDataProduct(pages: pages);
    loadingApi = false;
    emit(
      DataProductBasic(
        scrollControl: scrollController,
        getData: dataList,
        loadingScroll: loadingScrolling,
        loadingApi: loadingApi,
      ),
    );
  }
  
  @override
  saveLocalDataAllProduct() async{
    await dataDeleteProductLocal.deleteDataProductLocal();
    if(dataList.length <= 10){
      for(int i = 0; i < dataList.length; i++) {
        await dataGetProductLocal.insertDataLocal(
          description: dataList[i].description.toString(),
          tokenId: dataList[i].tokenId.toString(),
          name: dataList[i].name.toString(),
          email: dataList[i].email.toString(),
          nameCategory: dataList[i].category!.name.toString(),
          price: dataList[i].price.toString(),
          imagePath: "${Api.linkURL}/${dataList[i].urlImage.toString()}",
        );
      }
    }  
  }
  
  @override
  scrollControlAllProduct({required int pages}) {
    scrollController.addListener(() async {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent && loadingScrolling == false){
        loadingScrolling = true;
        pages = pages + 5;
        dataList = await dataGetProduct.getDataProduct(pages: pages);
        loadingApi = false;
        emit(
          DataProductBasic(
            scrollControl: scrollController,
            getData: await dataList, 
            loadingScroll: loadingScrolling,
            loadingApi: loadingApi,
          ),
        );
        await Future.delayed(
          Duration(milliseconds: 3000),
          () => loadingScrolling = false,
        );
        emit(
          DataProductBasic(
            scrollControl: scrollController,
            getData: await dataList,
            loadingScroll: loadingScrolling,
            loadingApi: loadingApi,
          ),
        );
      }
    });
  } 
}