abstract class InterfaceGetChatFirebase{
  Future getChatFirebase({
    required String emailPengirim, 
    required String emailPenerima,
  });
  Future getJumlahFalseMessage({
    required String emailPengirim,
    required String emailPenerima,
  });
}