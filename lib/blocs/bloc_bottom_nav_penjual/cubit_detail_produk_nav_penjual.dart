import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_bottom_nav_penjual/interfaces_bottom_nav_penjual.dart';
import 'package:foosel/blocs/bloc_bottom_nav_penjual/state_bottom_nav_pembeli.dart';

class CubitDetailProdukNavPenjual extends Cubit<DataStateDetailProdukNavPenjual> implements InterfacesDetailProdukNavPenjual{
  CubitDetailProdukNavPenjual() : super(DataDetailProdukNavPenjual(jenisDetail: ''));
  @override
  Future<void> detailProdukNavPenjual({
    required String jenisDetail,
    required dynamic readDetail
  }) async{
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