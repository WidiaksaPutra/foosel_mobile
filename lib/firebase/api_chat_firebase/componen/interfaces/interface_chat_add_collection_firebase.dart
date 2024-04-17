abstract class InterfaceChatAddCollectionFirebase{
  Future<void> chatAddCollection({
    required dynamic chatId, 
    required String emailPengirim, 
    required String emailPenerima, 
    required String messager, 
    required bool read,
  });
  Future<void> chatAddCollectionNotMessage({
    required dynamic chatId, 
    required String emailPengirim, 
    required String emailPenerima,
    required bool read,
  });
}