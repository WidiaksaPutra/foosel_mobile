import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_transaksi/interfaces_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_local/state_transaksi.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_delete_data_transaksi_local.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class CubitDeleteTransaksiLocal extends Cubit<DataStatePostTransaksiLocal> implements InterfacesDeleteTransaksi{
  final InterfaceDeleteDataTransaksiLocal _dataDeleteTransaksiLocal = getItInstance<InterfaceDeleteDataTransaksiLocal>();
  CubitDeleteTransaksiLocal() : super(DataPostTransaksiLocal(loadingTransaksi: true, status: false));
  
  @override
  Future<void> deleteDataTransaksi({required String tokenId}) async{
    emit(DataPostTransaksiLocal(loadingTransaksi: true, status: false));
    final _respons = await _dataDeleteTransaksiLocal.deleteDataTransaksiLocalWhereId(tokenId: tokenId);
    if(_respons == 0){
      emit(DataPostTransaksiLocal(loadingTransaksi: false, status: true));
    }else{
      emit(DataPostTransaksiLocal(loadingTransaksi: false, status: false));
    }  
  }
}