class DataStateGetTransaksiLocal{
  late bool loadingTransaksi;
  late List getData;
  late int totalHarga;
  DataStateGetTransaksiLocal({
    required this.loadingTransaksi, 
    required this.getData,
    required this.totalHarga,
  });
}

class DataGetTransaksiLocal extends DataStateGetTransaksiLocal{
  DataGetTransaksiLocal({
    required bool loadingTransaksi, 
    required List getData,
    required int totalHarga,
  })
  : super(
      loadingTransaksi: loadingTransaksi, 
      getData: getData,
      totalHarga: totalHarga,
    );
}

class DataStatePostTransaksiLocal{
  late bool loadingTransaksi, status;
  DataStatePostTransaksiLocal({
    required this.loadingTransaksi,
    required this.status,
  });
}

class DataPostTransaksiLocal extends DataStatePostTransaksiLocal{
  DataPostTransaksiLocal({
    required bool loadingTransaksi,
    required bool status,
  })
  : super(loadingTransaksi: loadingTransaksi, status: status);
}

class DataStateUpdateTransaksiLocal{
  late bool status;
  DataStateUpdateTransaksiLocal({
    required this.status,
  });
}

class DataUpdateTransaksiLocal extends DataStateUpdateTransaksiLocal{
  DataUpdateTransaksiLocal({
    required bool status,
  })
  : super(status: status);
}