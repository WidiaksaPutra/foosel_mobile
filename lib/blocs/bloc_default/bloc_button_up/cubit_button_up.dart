import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/bloc_button_up/state_button_up.dart';

class cubitUpButton extends Cubit<StateDataUpButton>{
  cubitUpButton() : super(StateUpButton(0,0));
  upButton({
    required int index, 
    required int currentTop, 
    required int currentBody, 
    required dynamic readBloc,
  }) async{
    currentBody = 1;
    if(index == 0){
      currentBody = 0;
    }
    currentTop = index;
    if(index != 0){
      readBloc;
    }
    emit(StateUpButton(currentTop, currentBody));
  }
}