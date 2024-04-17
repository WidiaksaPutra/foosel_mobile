abstract class InterfaceGetDataDetailProduct{
  Future getDataDetailProduct({
    bool testing = false, 
    String testingToken = "",
    required String tokenId,
  });
  Future tokenNull({
    bool testing = false, 
    required String tokenId,
  });
  Future tokenNotNull({
    bool testing = false,
    required String tokens,
    required String tokenId
  });
  Future rolePenjual({
    bool testing = false,
    required Map<String, String>? headers,
    required String tokenId,
  });
  Future rolePembeli({
    bool testing = false,
    required Map<String, String>? headers,
    required String tokenId,
  });
  Future getDataProductUsers({
    bool testing = false,
    required Map<String, dynamic> parameterApi,
    required Map<String, String>? headers,
    required String link,
  });
  bool loadingGetDataDetailProduct();
}