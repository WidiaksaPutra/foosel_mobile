abstract class InterfaceGetDataLikeLocal{
  Future<List<Map<String, dynamic>>> getDataLikeLocal();
  Future<List<Map<String, dynamic>>> getDataLikeWhereIdLocal({required String tokenId});
}