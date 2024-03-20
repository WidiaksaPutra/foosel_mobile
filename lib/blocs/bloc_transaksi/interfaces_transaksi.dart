import 'package:flutter/material.dart';

abstract class InterfacesInsertTransaksiLocal{
  saveLocalDataTransaksi({
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

abstract class InterfacesInsertTransaksi{
  saveDataTransaksi({
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

abstract class InterfacesUpdateTransaksi{
  updateDataTransaksi({
    required String transactionsId,
    required String status,
    required BuildContext context,
  });
}

abstract class InterfacesGetTransaksiLocal{
  getDataTransaksi();
  getDataTransaksiWhereId({required String tokenId});
}

abstract class InterfacesGetTransaksiHistory{
  getDataTransaksiHistory();
}

abstract class InterfacesDeleteTransaksi{
  deleteDataTransaksi({required String tokenId});
}

abstract class InterfacesUpdateTransaksiLocal{
  updateDataTransaksiLocal({
    required String tokenId,
    required int jumlah,
    required String hargaTotal,
  });
}
