
// ignore_for_file: override_on_non_overriding_member
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:foosel/service/api_transaksi/interfaces/interface_get_transaksi.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class CubitGetDetailTransaksiProduct extends Cubit<DataStateGetTransaksi>{
  final InterfaceGetTransaksi dataGetTransaksi = getItInstance<InterfaceGetTransaksi>();
  CubitGetDetailTransaksiProduct() : super(DataGetTransaksi(loading: false, dataTransaksi: []));
  
  @override
  getDataTransaksiDetail({required String transactionsId}) async{
    late List dataListTransaksi = [];
    emit(DataGetTransaksi(loading: true, dataTransaksi: []));
    dataListTransaksi = await dataGetTransaksi.getTransaksi(transactionsId: transactionsId);
    Future.delayed(Duration(seconds: 10));
    if(dataListTransaksi.isNotEmpty){
      emit(DataGetTransaksi(loading: false, dataTransaksi: dataListTransaksi));
    }else{
      emit(DataGetTransaksi(loading: false, dataTransaksi: dataListTransaksi));
    }
  }
}