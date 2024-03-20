abstract class InterfaceGetDataDetailProduct{
  getDataDetailProduct({
    bool testing = false, 
    String testingToken = "",
    required String tokenId,
  });
  tokenNull({
    bool testing = false, 
    required String tokenId,
  });
  tokenNotNull({
    bool testing = false,
    required String tokens,
    required String tokenId
  });
  rolePenjual({
    bool testing = false,
    required Map<String, String>? headers,
    required String tokenId,
  });
  rolePembeli({
    bool testing = false,
    required Map<String, String>? headers,
    required String tokenId,
  });
  getDataProductUsers({
    bool testing = false,
    required Map<String, dynamic> parameterApi,
    required Map<String, String>? headers,
    required String link,
  });
  bool loadingGetDataDetailProduct();
}