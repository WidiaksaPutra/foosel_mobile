abstract class InterfaceGetDataProductTransaksiLocal{
  Future<List<Map<String, dynamic>>> getDataProductTransaksiLocal();
  Future<List<Map<String, dynamic>>> getDataProductTransaksiWhereIdLocal({required String tokenTransaksi});
}