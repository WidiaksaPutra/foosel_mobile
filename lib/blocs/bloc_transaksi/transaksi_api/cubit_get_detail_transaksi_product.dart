
// ignore_for_file: override_on_non_overriding_member
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:foosel/service/api_transaksi/interfaces/interface_get_transaksi.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class CubitGetDetailTransaksiProduct extends Cubit<DataStateGetTransaksi>{
  final InterfaceGetTransaksi _dataGetTransaksi = getItInstance<InterfaceGetTransaksi>();
  CubitGetDetailTransaksiProduct() : super(DataGetTransaksi(loading: false, dataTransaksi: []));
  
  @override
  Future<void> getDataTransaksiDetail({required String transactionsId}) async{
    late List _dataListTransaksi = [];
    emit(DataGetTransaksi(loading: true, dataTransaksi: []));
    _dataListTransaksi = await _dataGetTransaksi.getTransaksi(transactionsId: transactionsId);
    Future.delayed(Duration(seconds: 10));
    if(_dataListTransaksi.isNotEmpty){
      emit(DataGetTransaksi(loading: false, dataTransaksi: _dataListTransaksi));
    }else{
      emit(DataGetTransaksi(loading: false, dataTransaksi: _dataListTransaksi));
    }
  }
}