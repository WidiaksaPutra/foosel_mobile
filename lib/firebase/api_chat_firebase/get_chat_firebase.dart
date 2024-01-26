import 'package:flutter_laravel_toko_sepatu/firebase/api_chat_firebase/mixin/search_id_chat_personal_firebase.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/firebase/interface_get_chat_firebase.dart';

class getChatFirebase with searchIdChatPersonalFirebase implements interfaceGetChatFirebase{
  @override
  GetChatFirebase({required String emailPengirim, required String emailPenerima}) async{
    await searchIdChatPersonal(emailPengirim: emailPengirim, emailPenerima: emailPenerima);
    return chatIdMessage;
  }
}