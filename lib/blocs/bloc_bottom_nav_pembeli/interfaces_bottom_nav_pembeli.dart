abstract class InterfacesBottomNavPembeli{
  void navigation({required int currentButton});
}

abstract class InterfacesDetailProdukNavPembeli{
  Future<void> detailProdukNavPembeli({
    required String jenisDetail,
    required dynamic readDetail
  });
}