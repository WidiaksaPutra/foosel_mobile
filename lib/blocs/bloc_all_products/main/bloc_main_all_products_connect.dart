// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_all_products/event_all_products.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_all_products/interfaces_all_products.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/state_default/state_product_basic.dart';
import 'package:flutter_laravel_toko_sepatu/interface/default/interface_delete_data_storage_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_insert_data_products_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_get_data_product.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_konstanta.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

ScrollController scrollController = ScrollController();
late List dataList = [];
late bool loadingScrolling = false, loadingApi = true;
class BlocAllProductConnect extends Bloc<dataEventAllProduct,DataStateProductBasic> implements interfacesAllProductConnect{
  final interfaceGetDataProduct dataGetProduct = getItInstance<interfaceGetDataProduct>();
  final interfaceInsertDataProductsLocal dataGetProductLocal = getItInstance<interfaceInsertDataProductsLocal>();
  final interfaceDeleteDataStorageLocal dataDeleteProductLocal = getItInstance<interfaceDeleteDataStorageLocal>();
  BlocAllProductConnect() : super(
    DataProductBasic(
      scrollControl: scrollController,
      getData: dataList,
      loadingScroll: loadingScrolling,
      loadingApi: loadingApi,
    ),
  ){
    on<Product>((event, emit) async{
      await GetDataAllProduct(event.pages);
      await ScrollControlAllProduct(event.pages);
      await SaveLocalDataAllProduct();
    });
  }

  @override
  GetDataAllProduct(int pages) async{
    print("qwerty 1");
    loadingScrolling = false;
    dataList = await dataGetProduct.GetDataProduct(pages: pages);
    print("qwerty $dataList");
    loadingApi = false;
    emit(
      DataProductBasic(
        scrollControl: scrollController,
        getData: await dataList,
        loadingScroll: loadingScrolling,
        loadingApi: loadingApi,
      ),
    );
  }
  
  @override
  ScrollControlAllProduct(int pages) async{
    scrollController.addListener(() async {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent && loadingScrolling == false){
        loadingScrolling = true;
        pages = pages + 5;
        dataList = await dataGetProduct.GetDataProduct(pages: pages);
        loadingApi = false;
        emit(
          DataProductBasic(
            scrollControl: scrollController,
            getData: await dataList, 
            loadingScroll: loadingScrolling,
            loadingApi: loadingApi,
          ),
        );
        await Future.delayed(const Duration(milliseconds: 1000));
        loadingScrolling = false;
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

  @override
  SaveLocalDataAllProduct() async{
    await dataDeleteProductLocal.DeleteDataLocal();
    if(dataList.length <= 10){
      for(int i = 0; i < dataList.length; i++) {
        await dataGetProductLocal.InsertDataLocal(
          description: dataList[i].description.toString(),
          tokenId: dataList[i].tokenId.toString(),
          name: dataList[i].name.toString(),
          nameCategory: dataList[i].category!.name.toString(),
          price: dataList[i].price.toString(),
          imagePath: "${Api.baseURLImage}${dataList[i].urlImage.toString()}",
        );
      }
    }
  }
  // @override
  // Future<void> close() {
  //   loadingScrolling = false;
  //   loadingApi = true;
  //   dataList.clear();
  //   return super.close();
  // }
}