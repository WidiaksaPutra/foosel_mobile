abstract class interfaceGetTransaksi{
  GetTransaksi({
    bool testing = false,
    String testingToken = "",
    String email = "", transactionsId = "",
  });
  RolePenjual({
    bool testing = false,
    String email = "", transactionsId = "",
    required Map<String, String>? headers
  });
  RolePembeli({
    bool testing = false,
    String email = "", transactionsId = "",
    required Map<String, String>? headers
  });
  GetDataTransaksi({
    bool testing = false,
    required Map<String, dynamic> parameterApi,
    required Map<String, String>? headers,
    required String link,
  });
}
