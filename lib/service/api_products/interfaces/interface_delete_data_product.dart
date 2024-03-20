abstract class InterfaceDeleteDataProduct{
  deleteDataProduct({
    bool testing = false,
    String testingTokenPenjual = "",
    required String idProduct,
    required String image,
  });
  bool loadingDeleteDataProduct();
}