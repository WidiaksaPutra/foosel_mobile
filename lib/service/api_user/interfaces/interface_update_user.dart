abstract class InterfaceUpdateUser{
  Future updateUser({
    bool testing = false,
    required String name, 
    required String email, 
    required String username,
    required String alamat,
  });
}