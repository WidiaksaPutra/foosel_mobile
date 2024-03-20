abstract class InterfaceGetDataProductLocal{
  Future<List<Map<String, dynamic>>> getDataProductLocal();
  Future<List<Map<String, dynamic>>> getDataProductWhereIdLocal({required String tokenId});
}