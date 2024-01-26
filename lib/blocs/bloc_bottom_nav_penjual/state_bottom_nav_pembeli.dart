class DataStateBottomNavigasiPenjual{
  int currentButton;
  DataStateBottomNavigasiPenjual(this.currentButton);
}

class DataBottomNavigasiPenjual extends DataStateBottomNavigasiPenjual{
  DataBottomNavigasiPenjual({required int currentButton})
  : super(currentButton);
}

class DataStateDetailProdukNavPenjual{
  late String jenisDetail;
  DataStateDetailProdukNavPenjual(this.jenisDetail);
}

class DataDetailProdukNavPenjual extends DataStateDetailProdukNavPenjual{
  DataDetailProdukNavPenjual({required String jenisDetail})
  : super(jenisDetail);
}