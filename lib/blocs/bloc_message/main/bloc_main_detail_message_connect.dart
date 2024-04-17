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
  final InterfaceInsertNotificationFirebase _dataInsertNotificationFirebase = getItInstance<InterfaceInsertNotificationFirebase>();
  final InterfaceInsertChatFirebase _dataInsertChatFirebase = getItInstance<InterfaceInsertChatFirebase>();
  final InterfaceGetChatFirebase _dataGetChatFirebase = getItInstance<InterfaceGetChatFirebase>();
  final InterfaceUpdateChatFirebase _dataUpdateChatFirebase = getItInstance<InterfaceUpdateChatFirebase>();
  final InterfaceSearchIdChatPersonalFirebase _dataSearchIdChatPersonal = getItInstance<InterfaceSearchIdChatPersonalFirebase>();
  BlocDetailMessageConnect() : super(DataBlocChatMessage(false)){
    on<DataEventPostMessage>((event, emit) async{
      await sharedPref();
      await firebaseChatMessage(
        message: event.message,
        tokenPenerima: event.tokenPenerima,
      );
    });
  }

  Future<void> firebaseChatMessage({
    required String message,
    required String tokenPenerima,
  }) async{
    emit(DataBlocChatMessage(true));
    String _emailPengirim = prefs.getString('email').toString();
    String _emailPenerima = prefs.getString('emailPenerima').toString();
    await insertFirebaseChatMessage(
      emailPenerima: _emailPenerima,
      message: message,
      tokenPenerima: tokenPenerima,
      prefEmail: _emailPengirim,
    );
    await getFirebaseChatMessage(
      emailPenerima: _emailPenerima, 
      message: message,
      prefEmail: _emailPengirim,
    );
    emit(DataBlocChatMessage(false));
  }

  Future<void> insertFirebaseChatMessage({
    required String emailPenerima,
    required String message,
    required String tokenPenerima,
    required String prefEmail
  }) async{
    if(message != ""){
      await _dataInsertChatFirebase.insertChatFirebase(
        emailPengirim: prefEmail, 
        emailPenerima: emailPenerima, 
        messager: message
      );
      await _dataInsertNotificationFirebase.insertNotificationFirebase(
        deviceToken: tokenPenerima,
        body: message,
        title: prefEmail,
      );
    }
  }

  Future<void> updateFirebaseChatMessage({
    required String emailPenerima,
    required String emailPengirim
  }) async{
    await _dataUpdateChatFirebase.updateChatFirebase(emailPenerima: emailPenerima, emailPengirim: emailPengirim);
  }

  Future<void> getFirebaseChatMessage({
    required String emailPenerima, 
    required String message, 
    required String prefEmail,
  }) async{
    await _dataGetChatFirebase.getChatFirebase(emailPengirim: prefEmail, emailPenerima: emailPenerima);
  }
  
  Stream<QuerySnapshot<Map<String, dynamic>>> get getStreamFirebaseChatMessage async*{
    SharedPreferences pref = await SharedPreferences.getInstance(); 
    String emailPenerima = pref.getString('emailPenerima').toString();
    String emailPengirim = pref.getString('email').toString();   
    String chatIdMessage = await _dataSearchIdChatPersonal.searchIdChatPersonal(
      emailPengirim: emailPengirim,
      emailPenerima: emailPenerima,
    );
    yield* firestore.collection('Chats').doc(chatIdMessage).collection("message").orderBy('time', descending: true).snapshots();
  }
}