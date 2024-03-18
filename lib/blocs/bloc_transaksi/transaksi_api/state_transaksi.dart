class DataStatePostTransaksi{
  late bool loadingTransaksi, status;
  DataStatePostTransaksi({
    required this.loadingTransaksi,
    required this.status,
  });
}

class DataPostTransaksi extends DataStatePostTransaksi{
  DataPostTransaksi({
    required bool loadingTransaksi,
    required bool status,
  })
  : super(loadingTransaksi: loadingTransaksi, status: status);
}

class DataStatePatchTransaksi{
  late bool loadingTransaksi, status;
  DataStatePatchTransaksi({
    required this.loadingTransaksi,
    required this.status,
  });
}

class DataPatchTransaksi extends DataStatePatchTransaksi{
  DataPatchTransaksi({
    required bool loadingTransaksi,
    required bool status,
  })
  : super(loadingTransaksi: loadingTransaksi, status: status);
}

class DataStateGetTransaksi{
  late List dataTransaksi;
  late bool loading;
  DataStateGetTransaksi(this.dataTransaksi, this.loading);
}

class DataGetTransaksi extends DataStateGetTransaksi{
  DataGetTransaksi({
    required List dataTransaksi, 
    required bool loading,
  }) : super(dataTransaksi, loading);
}

class StateDeleteTransaksi{
  late bool loadingDeleteTransaksi;
  late String statusAlert;
  StateDeleteTransaksi(this.loadingDeleteTransaksi, this.statusAlert);
}

class DeleteTransaksi extends StateDeleteTransaksi{
  DeleteTransaksi({
    required bool loadingDeleteTransaksi,
    required String statusAlert,
  }) 
  : super(loadingDeleteTransaksi, statusAlert);
}