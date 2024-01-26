import 'package:flutter/material.dart';

abstract class insertLike{
  SaveLocalDataLike({
    required String tokenId, 
    required String name,
    required String description,
    required String nameCategory,
    required String price,
    required String imagePath,
  });
  
  SaveImageToLocalPath(String imageUrl);
}

abstract class getLike{
  GetDataLike();
  GetDataLikeWhereIdLocal({required String tokenId});
}

abstract class like{
  GetLikeInit({
    required String tokenId,
  });
  GetLikeOnClick({
    required String name,
    required String categoryName,
    required String tokenId,
    required String description,
    required String price,
    required String imagePath,
    required BuildContext context,
    required bool like,
  });

  GetLikeDelete({required String tokenId});
}