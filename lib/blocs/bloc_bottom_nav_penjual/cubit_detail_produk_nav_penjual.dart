import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_bottom_nav_penjual/state_bottom_nav_pembeli.dart';

class CubitDetailProdukNavPenjual extends Cubit<DataStateDetailProdukNavPenjual>{
  CubitDetailProdukNavPenjual() : super(DataDetailProdukNavPenjual(jenisDetail: ''));
  DetailProdukNavPenjual({
    required String jenisDetail,
    required dynamic readDetail
  }){
    if(jenisDetail == "AllProduct"){
      readDetail;
      emit(DataDetailProdukNavPenjual(jenisDetail: jenisDetail));
    }
    if(jenisDetail == "Transaksi"){
      readDetail;
      emit(DataDetailProdukNavPenjual(jenisDetail: jenisDetail));
    }
  }
}