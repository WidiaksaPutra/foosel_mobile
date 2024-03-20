import 'package:flutter/material.dart';

abstract class InsertLike{
  saveLocalDataLike({
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
  getDataLike();
  getDataLikeWhereIdLocal({required String tokenId});
}

abstract class Like{
  getLikeInit({
    required String tokenId,
  });
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
  });

  getLikeDelete({required String tokenId});
}