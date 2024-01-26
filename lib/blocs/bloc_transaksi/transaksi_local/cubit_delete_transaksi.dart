import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/interfaces_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_local/state_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_delete_data_transaksi_local.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

class CubitDeleteTransaksiLocal extends Cubit<DataStatePostTransaksiLocal> with deleteTransaksi{
  final interfaceDeleteDataTransaksiLocal dataDeleteTransaksiLocal = getItInstance<interfaceDeleteDataTransaksiLocal>();
  CubitDeleteTransaksiLocal() : super(DataPostTransaksiLocal(loadingTransaksi: true, status: false));
  
  @override
  DeleteDataTransaksi({required String tokenId}) async{
    emit(DataPostTransaksiLocal(loadingTransaksi: true, status: false));
    final respons = await dataDeleteTransaksiLocal.DeleteDataTransaksiLocalWhereId(tokenId: tokenId);
    if(respons == 0){
      emit(DataPostTransaksiLocal(loadingTransaksi: false, status: true));
    }else{
      emit(DataPostTransaksiLocal(loadingTransaksi: false, status: false));
    }  
  }
}