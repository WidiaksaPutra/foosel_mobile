abstract class InterfaceInsertDataUserLocal{
  Future<int> insertDataUser({
    required String name, 
    required String email, 
    required String username, 
    required String phone, 
    required String profilePhoto,
  });
}