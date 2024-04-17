import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_message/state_message.dart';

class CubitNavMessageDetail extends Cubit<DataStateNavMessageDetail>{
  CubitNavMessageDetail() : super(DataNavMessageDetail(tokenPenerima: '', roleBar: 1, detailMessage: false, loadingMessage: true));
  void navigation({required String tokenPenerima, required int roleBar, required bool detailMessage}){
    emit(DataNavMessageDetail(tokenPenerima: tokenPenerima, roleBar: roleBar, detailMessage: detailMessage, loadingMessage: false));
  }
}