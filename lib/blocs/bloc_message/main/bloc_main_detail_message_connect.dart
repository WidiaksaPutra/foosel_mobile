// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/blocs/bloc_message/event_message.dart';
import 'package:foosel/blocs/bloc_message/state_message.dart';
import 'package:foosel/firebase/api_chat_firebase/componen/interfaces/interface_search_id_chat_personal_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/interfaces/interface_get_chat_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/interfaces/interface_insert_chat_firebase.dart';
import 'package:foosel/firebase/api_notification/interface_insert_notification_firebase.dart';
import 'package:foosel/firebase/api_chat_firebase/interfaces/interface_update_chat_firebase.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BlocDetailMessageConnect extends Bloc<DataEventMessage, DataBlocStateChatMessage> with SharedPref{
  final InterfaceInsertNotificationFirebase dataInsertNotificationFirebase = getItInstance<InterfaceInsertNotificationFirebase>();
  final InterfaceInsertChatFirebase dataInsertChatFirebase = getItInstance<InterfaceInsertChatFirebase>();
  final InterfaceGetChatFirebase dataGetChatFirebase = getItInstance<InterfaceGetChatFirebase>();
  final InterfaceUpdateChatFirebase dataUpdateChatFirebase = getItInstance<InterfaceUpdateChatFirebase>();
  final InterfaceSearchIdChatPersonalFirebase dataSearchIdChatPersonal = getItInstance<InterfaceSearchIdChatPersonalFirebase>();
  BlocDetailMessageConnect() : super(DataBlocChatMessage(false)){
    on<DataEventPostMessage>((event, emit) async{
      await sharedPref();
      await firebaseChatMessage(
        message: event.message,
        tokenPenerima: event.tokenPenerima,
      );
    });
  }

  firebaseChatMessage({
    required String message,
    required String tokenPenerima,
  }) async{
    emit(DataBlocChatMessage(true));
    String emailPengirim = prefs.getString('email').toString();
    String emailPenerima = prefs.getString('emailPenerima').toString();
    await insertFirebaseChatMessage(
      emailPenerima: emailPenerima,
      message: message,
      tokenPenerima: tokenPenerima,
      prefEmail: emailPengirim,
    );
    await getFirebaseChatMessage(
      emailPenerima: emailPenerima, 
      message: message,
      prefEmail: emailPengirim,
    );
    emit(DataBlocChatMessage(false));
  }

  insertFirebaseChatMessage({
    required String emailPenerima,
    required String message,
    required String tokenPenerima,
    required String prefEmail
  }) async{
    if(message != ""){
      await dataInsertChatFirebase.insertChatFirebase(
        emailPengirim: prefEmail, 
        emailPenerima: emailPenerima, 
        messager: message
      );
      await dataInsertNotificationFirebase.insertNotificationFirebase(
        deviceToken: tokenPenerima,
        body: message,
        title: prefEmail,
      );
    }
  }

  updateFirebaseChatMessage({
    required String emailPenerima,
    required String emailPengirim
  }) async{
    await dataUpdateChatFirebase.updateChatFirebase(emailPenerima: emailPenerima, emailPengirim: emailPengirim);
  }

  getFirebaseChatMessage({
    required String emailPenerima, 
    required String message, 
    required String prefEmail,
  }) async{
    await dataGetChatFirebase.getChatFirebase(emailPengirim: prefEmail, emailPenerima: emailPenerima);
  }
  
  Stream<QuerySnapshot<Map<String, dynamic>>> get getStreamFirebaseChatMessage async*{
    SharedPreferences pref = await SharedPreferences.getInstance(); 
    String emailPenerima = pref.getString('emailPenerima').toString();
    String emailPengirim = pref.getString('email').toString();   
    String chatIdMessage = await dataSearchIdChatPersonal.searchIdChatPersonal(
      emailPengirim: emailPengirim,
      emailPenerima: emailPenerima,
    );
    yield* firestore.collection('Chats').doc(chatIdMessage).collection("message").orderBy('time', descending: true).snapshots();
  }
}