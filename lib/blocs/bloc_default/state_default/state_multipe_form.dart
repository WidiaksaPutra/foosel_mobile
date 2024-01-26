class DataStateMultiFormUser{
  bool formVisibleEmail, formVisiblePassword, formVisibleFullName, formVisibleUsername, formVisibleAlamat;
  String messageEmail, messagePassword, messageFullName, messageUsername, messageAlamat;
  DataStateMultiFormUser(
    this.formVisibleEmail, this.formVisiblePassword, this.formVisibleFullName, this.formVisibleUsername, this.formVisibleAlamat, 
    this.messageEmail, this.messagePassword, this.messageFullName, this.messageUsername, this.messageAlamat);
}

class DataStateInitialFormUser extends DataStateMultiFormUser{
  DataStateInitialFormUser() : super(
    false, false, false, false, false,
    '', '', '', '', '',
  );
}

class DataStateMultiFormProduct{
  bool formVisibleNameProduct, formVisiblePrice, formVisibleDescription, formVisibleType, formLengthVisiblePrice;
  String messageNameProduct, messagePrice, messageDescription, messageType, lengthPriceMessage;
  DataStateMultiFormProduct(
    this.formVisibleNameProduct, this.formVisiblePrice, this.formVisibleDescription, this.formVisibleType, this.formLengthVisiblePrice,
    this.messageNameProduct, this.messagePrice, this.messageDescription, this.messageType, this.lengthPriceMessage);
}

class DataStateInitialFormProduct extends DataStateMultiFormProduct{
  DataStateInitialFormProduct() : super(
    false, false, false, false, false,
    '', '', '', '', '',
  );
}