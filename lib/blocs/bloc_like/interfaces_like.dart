import 'package:flutter/material.dart';

abstract class InsertLike{
  Future<void> saveLocalDataLike({
    required String tokenId, 
    required String name,
    required String email,
    required String description,
    required String nameCategory,
    required String price,
    required String imagePath,
  });
  
  // SaveImageToLocalPath(String imageUrl);
}

abstract class GetLike{
  Future<void> getDataLike();
  Future<void> getDataLikeWhereIdLocal({required String tokenId});
}

abstract class Like{
  Future<void> getLikeInit({
    required String tokenId,
  });
  Future<void> getLikeOnClick({
    required String name,
    required String email,
    required String categoryName,
    required String tokenId,
    required String description,
    required String price,
    required String imagePath,
    required BuildContext context,
    required bool like,
  });

  Future<void> getLikeDelete({required String tokenId});
}