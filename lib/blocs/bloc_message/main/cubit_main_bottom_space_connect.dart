import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_message/state_message.dart';

class CubitBottomSpaceConnect extends Cubit<DataStateCubitBottomSpace>{
  CubitBottomSpaceConnect() : super(DataStateCubitBottomSpace([]));
  bottomSpace(List chatList){
    final List<bool> bSpace = [];
    String space = "-";
    for(int i = 0; i < chatList.length; i++){
      bSpace.add(true);
      if(space == "-"){
        space = chatList[i]['penerima'].toString();
      }else{
        if(space == chatList[i]['penerima'].toString()){
          bSpace[i] = false;
        }
        space = chatList[i]['penerima'].toString();
      }
    }
    emit(DataStateCubitBottomSpace(bSpace));
  }
}