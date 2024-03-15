mixin chatAddCollectionFirebase{
  chatAddCollection({
    required dynamic chatId, 
    required String emailPengirim, 
    required String emailPenerima, 
    required String messager, 
    required bool read,
  }) async{
    await chatId.collection("message").add({
      'isRead': read,
      'penerima': emailPenerima,
      'pengirim': emailPengirim,
      'pesan': messager,
      'time': DateTime.now().toLocal(),
    });
  }

  chatAddCollectionNotMessage({
    required dynamic chatId, 
    required String emailPengirim, 
    required String emailPenerima,
    required bool read,
  }) async{
    await chatId.collection("message").add({
      'isRead': read,
      'penerima': emailPenerima,
      'pengirim': emailPengirim,
      'time': DateTime.now().toLocal(),
    });
  }
}