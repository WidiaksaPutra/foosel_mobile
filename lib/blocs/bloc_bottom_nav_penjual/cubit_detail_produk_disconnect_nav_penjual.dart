import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_bottom_nav_penjual/state_bottom_nav_pembeli.dart';

class CubitDetailProdukNavPenjual extends Cubit<DataStateDetailProdukNavPenjual>{
  CubitDetailProdukNavPenjual() : super(DataDetailProdukNavPenjual(jenisDetail: ''));
  DetailProdukNavPembeli({
    required String jenisDetail,
    required dynamic readDetail
  }){
    if(jenisDetail == "AllProduct"){
      readDetail;
      emit(DataDetailProdukNavPenjual(jenisDetail: jenisDetail));
    }
    if(jenisDetail == "Transaksi"){
      emit(DataDetailProdukNavPenjual(jenisDetail: jenisDetail));
    }
  }
}