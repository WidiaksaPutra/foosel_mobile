import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/interfaces_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_delete_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

class CubitDeleteTransaksi extends Cubit<StateDeleteTransaksi> implements deleteTransaksi{
  final interfaceDeleteTransaksi dataDeleteTransaksi = getItInstance<interfaceDeleteTransaksi>();
  CubitDeleteTransaksi() : super(DeleteTransaksi(loadingDeleteTransaksi: false, statusAlert: '-'));

  @override
  DeleteDataTransaksi({required String tokenId}) async{
    emit(DeleteTransaksi(loadingDeleteTransaksi: true, statusAlert: '-'));
    String statusApi = await dataDeleteTransaksi.DeleteTransaksi(transactionsId: tokenId); 
    bool loadingDelete = await dataDeleteTransaksi.LoadingDeleteDataTransaksi();
    if(loadingDelete == false){
      emit(DeleteTransaksi(loadingDeleteTransaksi: loadingDelete, statusAlert: statusApi));
    }
  }
}