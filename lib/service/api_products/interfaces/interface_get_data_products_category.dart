
abstract class InterfaceGetDataProductsCategory{
  getDataProductsCategory({
    bool testing = false,
    String testingToken = "",
    required String categoriesId, 
    required bool fresh,
  });
  tokenNull({
    bool testing = false,
    required String categoriesId
  });
  tokenNotNull({
    bool testing = false,
    required String tokens,
    required String categoriesId,
  });
  rolePenjual({
    bool testing = false,
    required Map<String, String>? headers,
    required String categoriesId,
  });
  rolePembeli({
    bool testing = false,
    required Map<String, String>? headers,
    required String categoriesId,
  });
  getDataProductUsers({
    bool testing = false,
    required Map<String, dynamic> parameterApi,
    required Map<String, String>? headers,
    required String link,
  });
}