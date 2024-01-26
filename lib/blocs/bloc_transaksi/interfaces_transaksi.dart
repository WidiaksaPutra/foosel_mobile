abstract class insertTransaksiLocal{
  SaveLocalDataTransaksi({
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

abstract class insertTransaksi{
  SaveDataTransaksi({
    required String emailPenjual,
    required String emailPembeli,
    required String productsId,
    required String categoryId,
    required String total,
    required String totalPrice,
    required String shippingPrice,
    required String quantity,
    required String status,
  });
}

abstract class updateTransaksi{
  UpdateDataTransaksi({
    required String transactionsId,
    required String status,
  });
}

abstract class getTransaksiLocal{
  GetDataTransaksi();
  GetDataTransaksiWhereId({required String tokenId});
}

abstract class getTransaksi{
  GetDataTransaksi();
}

abstract class getTransaksiHistory{
  GetDataTransaksiHistory();
}

abstract class deleteTransaksi{
  DeleteDataTransaksi({required String tokenId});
}

abstract class updateTransaksiLocal{
  UpdateDataTransaksiLocal({
    required String tokenId,
    required int jumlah,
    required String hargaTotal,
  });
}
