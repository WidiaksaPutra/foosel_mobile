abstract class InterfaceGetDataTransaksiLocal{
  Future<List<Map<String, dynamic>>> getDataTransaksiLocal();
  Future<List<Map<String, dynamic>>> getDataTransaksiWhereIdLocal({required String tokenId});
}