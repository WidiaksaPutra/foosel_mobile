abstract class InterfaceChatAddCollectionFirebase{
  chatAddCollection({
    required dynamic chatId, 
    required String emailPengirim, 
    required String emailPenerima, 
    required String messager, 
    required bool read,
  });
  chatAddCollectionNotMessage({
    required dynamic chatId, 
    required String emailPengirim, 
    required String emailPenerima,
    required bool read,
  });
}