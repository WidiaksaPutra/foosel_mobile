abstract class InterfaceGetDataProduct{
  Future getDataProduct({
    bool testing = false,
    String testingToken = "",
    required int pages
  });
  Future tokenNull({
    bool testing = false,
    required int pages,
  });
  Future tokenNotNull({
    bool testing = false,
    required String tokens,
    required int pages,
  });
  Future rolePenjual({
    bool testing = false,
    required int pages,
    required Map<String, String>? headers
  });
  Future rolePembeli({
    bool testing = false,
    required int pages,
    required Map<String, String>? headers
  });
  Future getDataProductUsers({
    bool testing = false,
    required Map<String, dynamic> parameterApi,
    required Map<String, String>? headers,
    required String link,
  });
}