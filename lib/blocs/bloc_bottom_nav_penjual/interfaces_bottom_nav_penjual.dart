abstract class InterfacesBottomNavPenjual{
  void navigation({required int currentButton});
}

abstract class InterfacesDetailProdukNavPenjual{
  Future<void> detailProdukNavPenjual({
    required String jenisDetail,
    required dynamic readDetail
  });
}