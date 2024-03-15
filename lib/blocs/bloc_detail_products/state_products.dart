import 'package:foosel/model/detail_products.dart';

class DataStateProducts{
  bool loading, jenisDetail;
  Datum dataProducts;
  DataStateProducts(this.loading, this.dataProducts, this.jenisDetail);
}

class DataProducts extends DataStateProducts{
  DataProducts({
    required bool loading, 
    required Datum dataProducts, 
    required bool jenisDetail,
  }) : super(loading, dataProducts, jenisDetail);
}

class DataStateDetailProduct{
  String navigation;
  DataStateDetailProduct(this.navigation);
}

class DataDetailProduct extends DataStateDetailProduct{
  DataDetailProduct({required String navigation})
  : super(navigation);
}

