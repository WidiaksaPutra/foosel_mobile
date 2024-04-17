abstract class InterfaceDeleteDataProduct{
  Future<String> deleteDataProduct({
    bool testing = false,
    String testingTokenPenjual = "",
    required String idProduct,
    required String image,
  });
  bool loadingDeleteDataProduct();
}