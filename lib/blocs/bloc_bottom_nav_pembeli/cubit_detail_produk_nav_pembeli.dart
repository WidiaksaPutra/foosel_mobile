import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_bottom_nav_pembeli/interfaces_bottom_nav_pembeli.dart';
import 'package:foosel/blocs/bloc_bottom_nav_pembeli/state_bottom_nav_pembeli.dart';

class CubitDetailProdukNavPembeli extends Cubit<DataStateDetailProdukNavPembeli> implements InterfacesDetailProdukNavPembeli{
  CubitDetailProdukNavPembeli() : super(DataDetailProdukNavPembeli(jenisDetail: ''));
  @override
  void detailProdukNavPembeli({
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
    if(jenisDetail == "TransaksiHistory"){
      readDetail;
      emit(DataDetailProdukNavPembeli(jenisDetail: jenisDetail));
    }
    if(jenisDetail == "TransaksiDetail"){
      readDetail;
      emit(DataDetailProdukNavPembeli(jenisDetail: jenisDetail));
    }
  }
}