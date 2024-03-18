
// ignore_for_file: override_on_non_overriding_member
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:foosel/interface/interface_local/service/interface_get_transaksi.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class CubitGetDetailTransaksiProduct extends Cubit<DataStateGetTransaksi>{
  final interfaceGetTransaksi dataGetTransaksi = getItInstance<interfaceGetTransaksi>();
  CubitGetDetailTransaksiProduct() : super(DataGetTransaksi(loading: false, dataTransaksi: []));
  
  @override
  GetDataTransaksiDetail({required String transactionsId}) async{
    late List dataListTransaksi = [];
    emit(DataGetTransaksi(loading: true, dataTransaksi: []));
    dataListTransaksi = await dataGetTransaksi.GetTransaksi(transactionsId: transactionsId);
    Future.delayed(Duration(seconds: 10));
    if(dataListTransaksi.isNotEmpty){
      emit(DataGetTransaksi(loading: false, dataTransaksi: dataListTransaksi));
    }else{
      emit(DataGetTransaksi(loading: false, dataTransaksi: dataListTransaksi));
    }
  }
}