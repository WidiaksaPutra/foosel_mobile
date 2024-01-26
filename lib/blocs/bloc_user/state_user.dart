class DataStateUser{
  bool loading;
  dynamic dataUser;
  DataStateUser(this.loading, this.dataUser);
}

class DataUser extends DataStateUser{
  DataUser(bool loading, dynamic dataUser) : super(loading, dataUser);
}