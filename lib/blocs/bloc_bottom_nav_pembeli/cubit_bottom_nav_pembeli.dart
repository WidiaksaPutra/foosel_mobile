import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_bottom_nav_pembeli/state_bottom_nav_pembeli.dart';

class cubitBottomNavPembeli extends Cubit<DataStateBottomNavigasiPembeli>{
  cubitBottomNavPembeli() : super(DataBottomNavigasiPembeli(currentButton: 0));
  navigation({required int currentButton}){
    emit(DataBottomNavigasiPembeli(currentButton: currentButton));
  }
}