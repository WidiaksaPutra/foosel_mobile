abstract class InterfaceDeleteDataProductTransaksiLocal{
  Future<int> deleteDataProductTransaksiLocal();
  Future<int> deleteDataProductTransaksiWhereIdTransaksi({required String tokenTransaksi});
  Future<int> deleteDataProductTransaksiWhereIdProduct({required String tokenProduct});
}