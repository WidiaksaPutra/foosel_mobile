
abstract class InterfaceGetDataProductsCategory{
  Future getDataProductsCategory({
    bool testing = false,
    String testingToken = "",
    required String categoriesId, 
    required bool fresh,
  });
  Future tokenNull({
    bool testing = false,
    required String categoriesId
  });
  Future tokenNotNull({
    bool testing = false,
    required String tokens,
    required String categoriesId,
  });
  Future rolePenjual({
    bool testing = false,
    required Map<String, String>? headers,
    required String categoriesId,
  });
  Future rolePembeli({
    bool testing = false,
    required Map<String, String>? headers,
    required String categoriesId,
  });
  Future getDataProductUsers({
    bool testing = false,
    required Map<String, dynamic> parameterApi,
    required Map<String, String>? headers,
    required String link,
  });
}