import 'package:flutter_laravel_toko_sepatu/model/detail_products.dart';

class DataStateProducts{
  bool loading;
  Datum dataProducts;
  DataStateProducts(this.loading, this.dataProducts);
}

class DataProducts extends DataStateProducts{
  DataProducts(bool loading, Datum dataProducts) : super(loading, dataProducts);
}

class DataStateDetailProduct{
  String navigation;
  DataStateDetailProduct(this.navigation);
}

class DataDetailProduct extends DataStateDetailProduct{
  DataDetailProduct({required String navigation})
  : super(navigation);
}

