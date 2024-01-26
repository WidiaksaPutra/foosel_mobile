import 'package:flutter_laravel_toko_sepatu/shared/theme_konstanta.dart';

class DataStateFormUser{
  bool formVisibleEmail, formVisiblePassword, formVisibleFullName, formVisibleUsername, formVisibleAlamat;  
  String message;
  DataStateFormUser(this.formVisibleEmail, this.formVisiblePassword, this.formVisibleFullName, this.formVisibleUsername, this.formVisibleAlamat, this.message);
}

class DataStateInitial extends DataStateFormUser{
  DataStateInitial() : super(false, false, false, false, false, "");
}

class DataStateFullName extends DataStateFormUser{
  DataStateFullName(bool formVisibleFullName) : super(false, false, formVisibleFullName, false, false, fullNameKosong);
}

class DataStateUsername extends DataStateFormUser{
  DataStateUsername(bool formVisibleUsername) : super(false, false, false, formVisibleUsername, false, usernameKosong);
}

class DataStateEmail extends DataStateFormUser{
  DataStateEmail(bool formVisibleEmail) : super(formVisibleEmail, false, false, false, false, emailKosong);
}

class DataStatePassword extends DataStateFormUser{
  DataStatePassword(bool formVisiblePassword) : super(false, formVisiblePassword, false, false, false, passwordKosong);
}

class DataStateAlamat extends DataStateFormUser{
  DataStateAlamat(bool formVisibleAlamat) : super(false, false, false, false, formVisibleAlamat, passwordKosong);
}