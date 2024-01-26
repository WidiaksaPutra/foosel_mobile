import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_message/state_message.dart';
import 'package:flutter_laravel_toko_sepatu/firebase/api_notification.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/firebase/interface_get_user_firebase.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/firebase/interface_insert_chat_firebase.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

late List userList = [];
class cubitTitleMessageConnect extends Cubit<DataStateTitleMessage> with defaultSharedPref, notificationFirebase{
  final interfaceGetUserFirebase dataGetUserFirebase = getItInstance<interfaceGetUserFirebase>();
  final interfaceInsertChatFirebase dataInsertChatFirebase = getItInstance<interfaceInsertChatFirebase>();
  cubitTitleMessageConnect() : super(DataTitleMessage("","","",true));
  getTitleMessage({required dynamic users, required String message}) async{
    await sharedPref();
    String emailPenerima = await prefs.getString('emailPenerima').toString();
    emit(DataTitleMessage("","","",true));
    userList = await dataGetUserFirebase.GetUserFirebase(email: prefs.getString('email').toString(), users: users);
    Future.delayed(const Duration(milliseconds: 1000));
    if(userList.isNotEmpty){
      for(int index = 0; index < userList.length; index++){
        if(userList[index].email == emailPenerima){
          emit(DataTitleMessage(userList[index].gambar.toString(), userList[index].status.toString(), userList[index].nama.toString(), false));
          break;
        }
        if(index == userList.length-1){
          insertFirebaseChatMessage(emailPenerima: emailPenerima, message: message, prefEmail: prefs.getString('email').toString(), tokenPenerima: "");
          break;
        }
      }
    }else{
      insertFirebaseChatMessage(emailPenerima: emailPenerima, message: message, prefEmail: prefs.getString('email').toString(), tokenPenerima: "");
    }
  }

  insertFirebaseChatMessage({
    required String emailPenerima,
    required String message,
    required String tokenPenerima,
    required String prefEmail
  }) async{
    if(message != ""){
      await dataInsertChatFirebase.InsertChatFirebase(
        emailPengirim: prefEmail, 
        emailPenerima: emailPenerima, 
        messager: message,
      );
      await pushNotificationFCM(
        deviceToken: tokenPenerima,
        body: message,
        title: prefEmail,
      ); 
    }
  }
}

  
