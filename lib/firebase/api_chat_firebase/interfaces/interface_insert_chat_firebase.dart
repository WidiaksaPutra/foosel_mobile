abstract class InterfaceInsertChatFirebase{
  Future<void> insertChatFirebase({
    required String emailPengirim,
    required String emailPenerima,
    required dynamic messager,
  });
}