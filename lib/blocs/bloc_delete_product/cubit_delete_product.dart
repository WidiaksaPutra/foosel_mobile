import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_delete_product/interface_delete_product.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_delete_product/state_delete_product.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_like/cubit_like.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_delete_data_product.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

class cubitDeleteProduct extends Cubit<StateDeleteProduct> with interfaceDeleteProduct{
  final interfaceDeleteDataProduct dataDeleteProduct = getItInstance<interfaceDeleteDataProduct>();
  cubitDeleteProduct() : super(DeleteProduct(loadingDeleteProduct: false, statusAlert: '-'));

  @override
  DeleteDataProduct({
    required BuildContext context,
    required String idProduct, 
    required String image
  }) async {
    emit(DeleteProduct(loadingDeleteProduct: true, statusAlert: '-'));
    String statusApi = await dataDeleteProduct.DeleteDataProduct(idProduct: idProduct, image: image); 
    bool loadingDelete = await dataDeleteProduct.LoadingDeleteDataProduct();
    if(loadingDelete == false){
      context.read<cubitLike>().GetLikeDelete(tokenId: idProduct);
      emit(DeleteProduct(loadingDeleteProduct: loadingDelete, statusAlert: statusApi));
    }
  }
}