import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_bottom_nav_pembeli/state_bottom_nav_pembeli.dart';

class CubitDetailProdukNavPembeli extends Cubit<DataStateDetailProdukNavPembeli>{
  CubitDetailProdukNavPembeli() : super(DataDetailProdukNavPembeli(jenisDetail: ''));
  DetailProdukNavPembeli({
    required String jenisDetail,
    required dynamic readDetail
  }){
    if(jenisDetail == "AllProduct"){
      readDetail;
      emit(DataDetailProdukNavPembeli(jenisDetail: jenisDetail));
    }
    if(jenisDetail == "Like"){
      readDetail;
      emit(DataDetailProdukNavPembeli(jenisDetail: jenisDetail));
    }
    if(jenisDetail == "Transaksi"){
      readDetail;
      emit(DataDetailProdukNavPembeli(jenisDetail: jenisDetail));
    }
  }
}