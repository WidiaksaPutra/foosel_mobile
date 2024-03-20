class DataStateConnection{
  bool connectionBoolean;
  DataStateConnection(this.connectionBoolean);
}

class DataConnection extends DataStateConnection{
  DataConnection(bool connectionBoolean) : super(connectionBoolean);
}