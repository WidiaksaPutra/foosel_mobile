import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_message/state_message.dart';

class CubitBottomSpaceConnect extends Cubit<DataStateCubitBottomSpace>{
  CubitBottomSpaceConnect() : super(DataStateCubitBottomSpace([]));
  bottomSpace(List chatList){
    final List<bool> _bSpace = [];
    String _space = "-";
    for(int i = 0; i < chatList.length; i++){
      _bSpace.add(true);
      if(_space == "-"){
        _space = chatList[i]['penerima'].toString();
      }else{
        if(_space == chatList[i]['penerima'].toString()){
          _bSpace[i] = false;
        }
        _space = chatList[i]['penerima'].toString();
      }
    }
    emit(DataStateCubitBottomSpace(_bSpace));
  }
}