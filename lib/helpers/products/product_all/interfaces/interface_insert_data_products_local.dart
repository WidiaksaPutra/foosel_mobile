abstract class InterfaceInsertDataProductsLocal{
  Future<int> insertDataLocal({
    required String tokenId,
    required String email,
    required String name,
    required String description,
    required String nameCategory,
    required String price,
    required String imagePath
  });
}