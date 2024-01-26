import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_bottom_nav_pembeli/state_bottom_nav_pembeli.dart';

class cubitBottomNavPembeli extends Cubit<DataStateBottomNavigasiPembeli>{
  cubitBottomNavPembeli() : super(DataBottomNavigasiPembeli(currentButton: 0));
  navigation({required int currentButton}){
    emit(DataBottomNavigasiPembeli(currentButton: currentButton));
  }
}