abstract class InterfaceGetTransaksi{
  getTransaksi({
    bool testing = false,
    String testingToken = "",
    String email = "", transactionsId = "",
  });
  rolePenjual({
    bool testing = false,
    String email = "", transactionsId = "",
    required Map<String, String>? headers
  });
  rolePembeli({
    bool testing = false,
    String email = "", transactionsId = "",
    required Map<String, String>? headers
  });
  getDataTransaksi({
    bool testing = false,
    required Map<String, dynamic> parameterApi,
    required Map<String, String>? headers,
    required String link,
  });
}
