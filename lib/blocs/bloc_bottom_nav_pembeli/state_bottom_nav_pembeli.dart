class DataStateBottomNavigasiPembeli{
  int currentButton;
  DataStateBottomNavigasiPembeli(this.currentButton);
}

class DataBottomNavigasiPembeli extends DataStateBottomNavigasiPembeli{
  DataBottomNavigasiPembeli({required int currentButton})
  : super(currentButton);
}

class DataStateDetailProdukNavPembeli{
  late String jenisDetail;
  DataStateDetailProdukNavPembeli(this.jenisDetail);
}

class DataDetailProdukNavPembeli extends DataStateDetailProdukNavPembeli{
  DataDetailProdukNavPembeli({required String jenisDetail})
  : super(jenisDetail);
}