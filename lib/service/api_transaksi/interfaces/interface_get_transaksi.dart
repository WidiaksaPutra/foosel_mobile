abstract class InterfaceGetTransaksi{
  Future getTransaksi({
    bool testing = false,
    String testingToken = "",
    String email = "", transactionsId = "",
  });
  Future rolePenjual({
    bool testing = false,
    String email = "", transactionsId = "",
    required Map<String, String>? headers
  });
  Future rolePembeli({
    bool testing = false,
    String email = "", transactionsId = "",
    required Map<String, String>? headers
  });
  Future getDataTransaksi({
    bool testing = false,
    required Map<String, dynamic> parameterApi,
    required Map<String, String>? headers,
    required String link,
  });
}
