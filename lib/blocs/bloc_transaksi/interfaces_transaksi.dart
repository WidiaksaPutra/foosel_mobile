import 'package:flutter/material.dart';

abstract class InterfacesInsertTransaksiLocal{
  Future<void> saveLocalDataTransaksi({
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
    required dynamic alamat,
  });
}

abstract class InterfacesInsertTransaksi{
  Future<void> saveDataTransaksi({
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
  Future<void> updateDataTransaksi({
    required String transactionsId,
    required String status,
    required BuildContext context,
  });
}

abstract class InterfacesGetTransaksiLocal{
  Future<void> getDataTransaksi();
  Future<void> getDataTransaksiWhereId({required String tokenId});
}

abstract class InterfacesGetTransaksiHistory{
  Future<void> getDataTransaksiHistory();
}

abstract class InterfacesGetTransaksiProductPenjual{
  Future<void> getDataTransaksiProductPenjual();
}

abstract class InterfacesDeleteTransaksi{
  Future<void> deleteDataTransaksi({required String tokenId});
}

abstract class InterfacesUpdateTransaksiLocal{
  Future<void> updateDataTransaksiLocal({
    required String tokenId,
    required int jumlah,
    required String hargaTotal,
  });
}
