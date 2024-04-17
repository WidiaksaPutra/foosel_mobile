abstract class InterfaceGetLogin{
  Future getLogin({
    bool testing = false,
    required String email, 
    required String password,
  });
}