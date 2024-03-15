abstract class interfaceGetDataProductsCategory{
  GetDataProductsCategory({ 
    bool testing = false,
    String testingToken = "",
    required String categoriesId, 
    required bool fresh,
  });
  TokenNull({
    bool testing = false,
    required String categoriesId
  });
  TokenNotNull({
    bool testing = false,
    required String tokens,
    required String categoriesId,
  });
  RolePenjual({
    bool testing = false,
    required Map<String, String>? headers,
    required String categoriesId,
  });
  RolePembeli({
    bool testing = false,
    required Map<String, String>? headers,
    required String categoriesId,
  });
  GetDataProductUsers({
    bool testing = false,
    required Map<String, dynamic> parameterApi,
    required Map<String, String>? headers,
    required String link,
  });
}