// ignore_for_file: override_on_non_overriding_member
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_message/state_message.dart';
import 'package:foosel/interface/interface_local/firebase/interface_delete_chat_firebase.dart';
import 'package:foosel/interface/interface_local/firebase/interface_delete_user_firebase.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class CubitDeleteMessege extends Cubit<StateDeleteMessage>{
  final interfaceDeleteUserFirebase dataDeleteUser = getItInstance<interfaceDeleteUserFirebase>();
  final interfaceDeleteChatFirebase dataDeleteChat = getItInstance<interfaceDeleteChatFirebase>();
  CubitDeleteMessege() : super(DeleteMessage(loadingDeleteMessage: false, statusAlert: false));
  
  @override
  DeleteDataMessage({
    required String emailPengirim,
    required String emailPenerima,
  }) async{
    emit(DeleteMessage(loadingDeleteMessage: true, statusAlert: false));
    bool statusApiChat = await dataDeleteChat.DeleteChatFirebase(emailPengirim: emailPengirim, emailPenerima: emailPenerima);
    bool statusApiUser = await dataDeleteUser.DeleteUserFirebase(emailPenerima: emailPenerima, emailPengirim: emailPengirim);
    if(statusApiUser == true && statusApiChat == true){
      emit(DeleteMessage(loadingDeleteMessage: false, statusAlert: true));
    }
  }
}