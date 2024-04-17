import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_transaksi/interfaces_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_delete_data_product_transaksi_local.dart';
import 'package:foosel/service/api_transaksi/interfaces/interface_delete_transaksi.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class CubitDeleteTransaksi extends Cubit<StateDeleteTransaksi> implements InterfacesDeleteTransaksi{
  final InterfaceDeleteTransaksi _dataDeleteTransaksi = getItInstance<InterfaceDeleteTransaksi>();
  final InterfaceDeleteDataProductTransaksiLocal _dataDeleteTransaksiLocal = getItInstance<InterfaceDeleteDataProductTransaksiLocal>();
  CubitDeleteTransaksi() : super(DeleteTransaksi(loadingDeleteTransaksi: false, statusAlert: '-'));

  @override
  Future<void> deleteDataTransaksi({required String tokenId}) async{
    emit(DeleteTransaksi(loadingDeleteTransaksi: true, statusAlert: '-'));
    String _statusApi = await _dataDeleteTransaksi.deleteTransaksi(transactionsId: tokenId); 
    bool _loadingDelete = await _dataDeleteTransaksi.loadingDeleteDataTransaksi();
    if(_loadingDelete == false){
      await _dataDeleteTransaksiLocal.deleteDataProductTransaksiWhereIdTransaksi(tokenTransaksi: tokenId);
      emit(DeleteTransaksi(loadingDeleteTransaksi: _loadingDelete, statusAlert: _statusApi));
    }
  }
}