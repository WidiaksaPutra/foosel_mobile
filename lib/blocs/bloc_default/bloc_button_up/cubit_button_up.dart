import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/bloc_button_up/interfaces_up_button.dart';
import 'package:foosel/blocs/bloc_default/bloc_button_up/state_button_up.dart';

class CubitUpButton extends Cubit<StateDataUpButton> implements InterfacesUpButton{
  CubitUpButton() : super(StateUpButton(0,0));
  void upButton({
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