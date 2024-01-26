mixin chatUpdateCollectionReadFirebase{
  chatUpdateCollectionRead({
    required dynamic chatId,
    required bool read,
    required dynamic messageId,
  }) async{
    await chatId.collection("message").doc(messageId).update({
      'isRead': read,
    });
  }
}



