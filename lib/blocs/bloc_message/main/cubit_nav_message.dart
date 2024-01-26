import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_message/state_message.dart';

class cubitNavMessageDetail extends Cubit<DataStateNavMessageDetail>{
  cubitNavMessageDetail() : super(DataNavMessageDetail(tokenPenerima: '', roleBar: 1, detailMessage: false, loadingMessage: true));
  navigation({required String tokenPenerima, required int roleBar, required bool detailMessage}){
    emit(DataNavMessageDetail(tokenPenerima: tokenPenerima, roleBar: roleBar, detailMessage: detailMessage, loadingMessage: false));
  }
}