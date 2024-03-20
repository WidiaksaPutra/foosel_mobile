abstract class InterfaceInsertDataProductTransaksiLocal{
  Future<int> insertDataProductTransaksiLocal({
    required String tokenTransaksi,
    required String usersEmailPembeli,
    required String usersEmailPenjual,
    required String tokenProduct, 
    required String name, 
    required String description, 
    required String nameCategory, 
    required String price,
    required String status,
    required String imagePath,
    required String quantity,
    required String totalPrice,
  });
}
