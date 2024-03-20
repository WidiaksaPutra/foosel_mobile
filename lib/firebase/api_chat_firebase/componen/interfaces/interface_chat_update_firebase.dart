abstract class InterfaceChatUpdateFirebase{
  chatUpdate({
    required String chatId,
    required int totalChats,
    required int totalRead,
    required int totalUnread,
  });
}