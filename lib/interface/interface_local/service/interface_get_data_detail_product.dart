abstract class interfaceGetDataDetailProduct{
  GetDataDetailProduct({
    bool testing = false, 
    String testingToken = "",
    required String tokenId,
  });
  TokenNull({
    bool testing = false, 
    required String tokenId,
  });
  TokenNotNull({
    bool testing = false,
    required String tokens,
    required String tokenId
  });
  RolePenjual({
    bool testing = false,
    required Map<String, String>? headers,
    required String tokenId,
  });
  RolePembeli({
    bool testing = false,
    required Map<String, String>? headers,
    required String tokenId,
  });
  GetDataProductUsers({
    bool testing = false,
    required Map<String, dynamic> parameterApi,
    required Map<String, String>? headers,
    required String link,
  });
  bool LoadingGetDataDetailProduct();
}