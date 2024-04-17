abstract class InterfaceChatUpdateCollectionReadFirebase{
  Future<void> chatUpdateCollectionRead({
    required dynamic chatId,
    required bool read,
    required dynamic messageId,
  });
}