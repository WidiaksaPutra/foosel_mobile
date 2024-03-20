abstract class InterfaceGetDataProduct{
  getDataProduct({
    bool testing = false,
    String testingToken = "",
    required int pages
  });
  tokenNull({
    bool testing = false,
    required int pages,
  });
  tokenNotNull({
    bool testing = false,
    required String tokens,
    required int pages,
  });
  rolePenjual({
    bool testing = false,
    required int pages,
    required Map<String, String>? headers
  });
  rolePembeli({
    bool testing = false,
    required int pages,
    required Map<String, String>? headers
  });
  getDataProductUsers({
    bool testing = false,
    required Map<String, dynamic> parameterApi,
    required Map<String, String>? headers,
    required String link,
  });
}