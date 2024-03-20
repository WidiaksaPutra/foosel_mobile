import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_transaksi/interfaces_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_delete_data_product_transaksi_local.dart';
import 'package:foosel/service/api_transaksi/interfaces/interface_delete_transaksi.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class CubitDeleteTransaksi extends Cubit<StateDeleteTransaksi> implements InterfacesDeleteTransaksi{
  final InterfaceDeleteTransaksi dataDeleteTransaksi = getItInstance<InterfaceDeleteTransaksi>();
  final InterfaceDeleteDataProductTransaksiLocal dataDeleteTransaksiLocal = getItInstance<InterfaceDeleteDataProductTransaksiLocal>();
  CubitDeleteTransaksi() : super(DeleteTransaksi(loadingDeleteTransaksi: false, statusAlert: '-'));

  @override
  deleteDataTransaksi({required String tokenId}) async{
    emit(DeleteTransaksi(loadingDeleteTransaksi: true, statusAlert: '-'));
    String statusApi = await dataDeleteTransaksi.deleteTransaksi(transactionsId: tokenId); 
    bool loadingDelete = await dataDeleteTransaksi.loadingDeleteDataTransaksi();
    if(loadingDelete == false){
      await dataDeleteTransaksiLocal.deleteDataProductTransaksiWhereIdTransaksi(tokenTransaksi: tokenId);
      emit(DeleteTransaksi(loadingDeleteTransaksi: loadingDelete, statusAlert: statusApi));
    }
  }
}