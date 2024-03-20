import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_bottom_nav_penjual/state_bottom_nav_pembeli.dart';

class CubitBottomNavPenjual extends Cubit<DataStateBottomNavigasiPenjual>{
  CubitBottomNavPenjual() : super(DataBottomNavigasiPenjual(currentButton: 0));
  navigation({required int currentButton}){
    emit(DataBottomNavigasiPenjual(currentButton: currentButton));
  }
}