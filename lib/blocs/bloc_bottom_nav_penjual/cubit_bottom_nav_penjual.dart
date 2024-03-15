import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_bottom_nav_penjual/state_bottom_nav_pembeli.dart';

class cubitBottomNavPenjual extends Cubit<DataStateBottomNavigasiPenjual>{
  cubitBottomNavPenjual() : super(DataBottomNavigasiPenjual(currentButton: 0));
  navigation({required int currentButton}){
    emit(DataBottomNavigasiPenjual(currentButton: currentButton));
  }
}