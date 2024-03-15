abstract class interfaceGetDataProduct{
  GetDataProduct({
    bool testing = false,
    String testingToken = "",
    required int pages
  });
  TokenNull({
    bool testing = false,
    required int pages,
  });
  TokenNotNull({
    bool testing = false,
    required String tokens,
    required int pages,
  });
  RolePenjual({
    bool testing = false,
    required int pages,
    required Map<String, String>? headers
  });
  RolePembeli({
    bool testing = false,
    required int pages,
    required Map<String, String>? headers
  });
  GetDataProductUsers({
    bool testing = false,
    required Map<String, dynamic> parameterApi,
    required Map<String, String>? headers,
    required String link,
  });
}