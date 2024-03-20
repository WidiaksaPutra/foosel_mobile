abstract class InterfaceInsertDataLikeLocal{
  Future<int> insertDataLikeLocal({
    required String tokenId,
    required String name,
    required String email,
    required String description,
    required String nameCategory,
    required String price,
    required String imagePath,
  });
}