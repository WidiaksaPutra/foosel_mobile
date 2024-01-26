import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_like/cubit_insert_like.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_like/interfaces_like.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_like/state_like.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_delete_data_like_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_get_data_like_local.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

class cubitLike extends Cubit<DataStateLike> with like{
  final interfaceGetDataLikeLocal dataGetLike = getItInstance<interfaceGetDataLikeLocal>();
  final interfaceDeleteDataLikeLocal dataDeleteLike = getItInstance<interfaceDeleteDataLikeLocal>();
  cubitLike() : super(DataStateLike(statusLike: false, loadingLike: true));
  
  @override
  GetLikeInit({
    required String tokenId,
  }) async {
    emit(DataStateLike(statusLike: false, loadingLike: true));
    final dataLocal = await dataGetLike.GetDataLikeWhereIdLocal(tokenId: tokenId);
    if(dataLocal.isEmpty){
      emit(DataStateLike(statusLike: false, loadingLike: false));  
    }else{
      emit(DataStateLike(statusLike: true, loadingLike: false));
    }
  }
  
  @override
  GetLikeOnClick({
    required String name, 
    required String categoryName, 
    required String tokenId, 
    required String description, 
    required String price, 
    required String imagePath, 
    required BuildContext context,
    required bool like,
  }) async {
    like = !like;
    if(like == true){
      context.read<cubitInsertLike>().SaveLocalDataLike(
        tokenId: tokenId, 
        name: name,
        nameCategory: categoryName, 
        description: description, 
        price: price,
        imagePath: imagePath,
      );
    }else{
      await dataDeleteLike.DeleteDataLikeLocalWhereIdLocal(tokenId: tokenId); 
    }
    emit(DataStateLike(statusLike: like, loadingLike: false));
  }
  
  @override
  GetLikeDelete({required String tokenId}) async{
    emit(DataStateLike(statusLike: false, loadingLike: true));
    await dataDeleteLike.DeleteDataLikeLocalWhereIdLocal(tokenId: tokenId);
    emit(DataStateLike(statusLike: true, loadingLike: false));
  }
}