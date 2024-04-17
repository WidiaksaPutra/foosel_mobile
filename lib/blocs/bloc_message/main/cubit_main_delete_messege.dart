// ignore_for_file: override_on_non_overriding_member
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_message/state_message.dart';
import 'package:foosel/firebase/api_chat_firebase/interfaces/interface_delete_chat_firebase.dart';
import 'package:foosel/firebase/api_user_firebase/interfaces/interface_delete_user_firebase.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class CubitDeleteMessege extends Cubit<StateDeleteMessage>{
  final InterfaceDeleteUserFirebase _dataDeleteUser = getItInstance<InterfaceDeleteUserFirebase>();
  final InterfaceDeleteChatFirebase _dataDeleteChat = getItInstance<InterfaceDeleteChatFirebase>();
  CubitDeleteMessege() : super(DeleteMessage(loadingDeleteMessage: false, statusAlert: false));
  
  @override
  Future<void> deleteDataMessage({
    required String emailPengirim,
    required String emailPenerima,
  }) async{
    emit(DeleteMessage(loadingDeleteMessage: true, statusAlert: false));
    bool _statusApiChat = await _dataDeleteChat.deleteChatFirebase(emailPengirim: emailPengirim, emailPenerima: emailPenerima);
    bool _statusApiUser = await _dataDeleteUser.deleteUserFirebase(emailPenerima: emailPenerima, emailPengirim: emailPengirim);
    if(_statusApiUser == true && _statusApiChat == true){
      emit(DeleteMessage(loadingDeleteMessage: false, statusAlert: true));
    }
  }
}