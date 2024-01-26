abstract class interfacePostTransaksi{
  PostTransaksi({
    required String usersEmailPembeli,
    required String usersEmailPenjual, 
    required String productsId,
    required String categoryId,
    required String total,
    required String totalPrice, 
    required String shippingPrice,
    required String quantity,
    required String status,
  });
}