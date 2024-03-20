import 'package:foosel/shared/theme_konstanta.dart';

class DataStateFormProduct{
  bool formVisibleNameProduct, formVisiblePrice, formVisibleDescription, formVisibleType; 
  String message;
  DataStateFormProduct(this.formVisibleNameProduct, this.formVisiblePrice, this.formVisibleDescription, this.formVisibleType, this.message);
}

class DataStateInitial extends DataStateFormProduct{
  DataStateInitial() : super(false, false, false, false, "");
}

class DataStateNameProduct extends DataStateFormProduct{
  DataStateNameProduct(bool formVisibleNameProduct) : super(formVisibleNameProduct, false, false, false, nameProductKosong);
}

class DataStatePriceProduct extends DataStateFormProduct{
  DataStatePriceProduct(bool formVisiblePriceProduct) : super(false, formVisiblePriceProduct, false, false, priceProductKosong);
}

class DataStateDescriptionProduct extends DataStateFormProduct{
  DataStateDescriptionProduct(bool formVisibleDescriptionProduct) : super(false, false, formVisibleDescriptionProduct, false, descriptionProduct);
}

class DataStateTypeProduct extends DataStateFormProduct{
  DataStateTypeProduct(bool formVisibleType) : super(false, false, false, formVisibleType, typeProductKosong);
}