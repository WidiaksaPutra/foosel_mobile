import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_transaksi/interfaces_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:foosel/interface/interface_local/helpers/interface_delete_data_product_transaksi_storage_local.dart';
import 'package:foosel/interface/interface_local/service/interface_delete_transaksi.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class CubitDeleteTransaksi extends Cubit<StateDeleteTransaksi> implements deleteTransaksi{
  final interfaceDeleteTransaksi dataDeleteTransaksi = getItInstance<interfaceDeleteTransaksi>();
  final interfaceDeleteDataProductTransaksiStorageLocal dataDeleteTransaksiLocal = getItInstance<interfaceDeleteDataProductTransaksiStorageLocal>();
  CubitDeleteTransaksi() : super(DeleteTransaksi(loadingDeleteTransaksi: false, statusAlert: '-'));

  @override
  DeleteDataTransaksi({required String tokenId}) async{
    emit(DeleteTransaksi(loadingDeleteTransaksi: true, statusAlert: '-'));
    String statusApi = await dataDeleteTransaksi.DeleteTransaksi(transactionsId: tokenId); 
    bool loadingDelete = await dataDeleteTransaksi.LoadingDeleteDataTransaksi();
    if(loadingDelete == false){
      await dataDeleteTransaksiLocal.DeleteDataProductTransaksiWhereIdTransaksi(tokenTransaksi: tokenId);
      emit(DeleteTransaksi(loadingDeleteTransaksi: loadingDelete, statusAlert: statusApi));
    }
  }
}