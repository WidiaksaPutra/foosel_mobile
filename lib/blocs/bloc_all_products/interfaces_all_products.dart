abstract class InterfacesAllProductConnect{
  Future<void> getDataAllProduct({required int pages});
  Future<void> saveLocalDataAllProduct();
  scrollControlAllProduct({required int pages});
}

abstract class InterfacesListAllProductDisconnect{
  Future<void> getListDataAllProduct();
}