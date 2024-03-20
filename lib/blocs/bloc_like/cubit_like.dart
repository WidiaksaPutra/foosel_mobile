import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_like/cubit_insert_like.dart';
import 'package:foosel/blocs/bloc_like/interfaces_like.dart';
import 'package:foosel/blocs/bloc_like/state_like.dart';
import 'package:foosel/helpers/like/interfaces/interface_delete_data_like_local.dart';
import 'package:foosel/helpers/like/interfaces/interface_get_data_like_local.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class CubitLike extends Cubit<DataStateLike> implements Like{
  final InterfaceGetDataLikeLocal dataGetLike = getItInstance<InterfaceGetDataLikeLocal>();
  final InterfaceDeleteDataLikeLocal dataDeleteLike = getItInstance<InterfaceDeleteDataLikeLocal>();
  CubitLike() : super(DataStateLike(statusLike: false, loadingLike: true));
  
  @override
  getLikeInit({
    required String tokenId,
  }) async {
    emit(DataStateLike(statusLike: false, loadingLike: true));
    final dataLocal = await dataGetLike.getDataLikeWhereIdLocal(tokenId: tokenId);
    if(dataLocal.isEmpty){
      emit(DataStateLike(statusLike: false, loadingLike: false));  
    }else{
      emit(DataStateLike(statusLike: true, loadingLike: false));
    }
  }
  
  @override
  getLikeOnClick({
    required String name,
    required String email, 
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
      await context.read<CubitInsertLike>().saveLocalDataLike(
        tokenId: tokenId, 
        name: name,
        email: email,
        nameCategory: categoryName, 
        description: description, 
        price: price,
        imagePath: imagePath,
      );
    }else{
      await dataDeleteLike.deleteDataLikeLocalWhereIdLocal(tokenId: tokenId); 
    }
    emit(DataStateLike(statusLike: like, loadingLike: false));
  }
  
  @override
  getLikeDelete({required String tokenId}) async{
    emit(DataStateLike(statusLike: false, loadingLike: true));
    await dataDeleteLike.deleteDataLikeLocalWhereIdLocal(tokenId: tokenId);
    emit(DataStateLike(statusLike: true, loadingLike: false));
  }
}