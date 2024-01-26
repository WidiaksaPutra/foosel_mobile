class StateDeleteProduct{
  late bool loadingDeleteProduct;
  late String statusAlert;
  StateDeleteProduct(this.loadingDeleteProduct, this.statusAlert);
}

class DeleteProduct extends StateDeleteProduct{
  DeleteProduct({
    required bool loadingDeleteProduct,
    required String statusAlert,
  }) 
  : super(loadingDeleteProduct, statusAlert);
}
