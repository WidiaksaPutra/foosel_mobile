abstract class InterfacePostRegister{
  Future postRegister({
    bool testing = false,
    required String name,
    required String username, 
    required String alamat,
    required String email, 
    required String password,
    required String gambarUser,
    required String roles,
  });
}