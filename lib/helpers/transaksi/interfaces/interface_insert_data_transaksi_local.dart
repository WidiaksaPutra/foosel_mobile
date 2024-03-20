abstract class InterfaceInsertDataTransaksiLocal{
  Future<int> insertDataTransaksiLocal({
    required String tokenId, 
    required String emailPenjual,
    required String emailPembeli,
    required String idCategory,
    required String name, 
    required String description, 
    required String nameCategory, 
    required String hargaSatuan,
    required String hargaTotal,
    required int jumlah,
    required String imagePath,
  });
}