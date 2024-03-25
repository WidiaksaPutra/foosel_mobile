import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/blocs/bloc_message/state_message.dart';
import 'package:foosel/firebase/api_user_firebase/interfaces/interface_get_user_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/interfaces/interface_insert_chat_firebase.dart';
import 'package:foosel/firebase/api_notification/interface_insert_notification_firebase.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

late List userList = [];
class CubitTitleMessageConnect extends Cubit<DataStateTitleMessage> with SharedPref{
  final InterfaceInsertNotificationFirebase _dataInsertNotificationFirebase = getItInstance<InterfaceInsertNotificationFirebase>();
  final InterfaceGetUserFirebase _dataGetUserFirebase = getItInstance<InterfaceGetUserFirebase>();
  final InterfaceInsertChatFirebase _dataInsertChatFirebase = getItInstance<InterfaceInsertChatFirebase>();
  CubitTitleMessageConnect() : super(DataTitleMessage("","","",true));
  getTitleMessage({required dynamic users, required String message}) async{
    await sharedPref();
    String _emailPenerima = await prefs.getString('emailPenerima').toString();
    emit(DataTitleMessage("","","",true));
    userList = await _dataGetUserFirebase.getUserFirebase(email: prefs.getString('email').toString(), users: users);
    Future.delayed(
      const Duration(milliseconds: 1000),
      (){
        if(userList.isNotEmpty){
          for(int index = 0; index < userList.length; index++){
            if(userList[index].email == _emailPenerima){
              emit(DataTitleMessage(userList[index].gambar.toString(), userList[index].status.toString(), userList[index].nama.toString(), false));
              break;
            }
            if(index == userList.length-1){
              insertFirebaseChatMessage(emailPenerima: _emailPenerima, message: message, prefEmail: prefs.getString('email').toString(), tokenPenerima: "");
              break;
            }
          }
        }else{
          insertFirebaseChatMessage(emailPenerima: _emailPenerima, message: message, prefEmail: prefs.getString('email').toString(), tokenPenerima: "");
        }
      } 
    );
  }

  insertFirebaseChatMessage({
    required String emailPenerima,
    required String message,
    required String tokenPenerima,
    required String prefEmail
  }) async{
    if(message != ""){
      await _dataInsertChatFirebase.insertChatFirebase(
        emailPengirim: prefEmail, 
        emailPenerima: emailPenerima, 
        messager: message,
      );
      await _dataInsertNotificationFirebase.insertNotificationFirebase(
        deviceToken: tokenPenerima,
        body: message,
        title: prefEmail,
      ); 
    }
  }
}

  
