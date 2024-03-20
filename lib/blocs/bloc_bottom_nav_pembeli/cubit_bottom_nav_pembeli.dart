import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_bottom_nav_pembeli/state_bottom_nav_pembeli.dart';

class CubitBottomNavPembeli extends Cubit<DataStateBottomNavigasiPembeli>{
  CubitBottomNavPembeli() : super(DataBottomNavigasiPembeli(currentButton: 0));
  navigation({required int currentButton}){
    emit(DataBottomNavigasiPembeli(currentButton: currentButton));
  }
}