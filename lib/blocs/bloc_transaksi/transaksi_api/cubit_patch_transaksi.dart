import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_transaksi/interfaces_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/cubit_get_transaksi_product.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_update_data_product_transaksi_local.dart';
import 'package:foosel/service/api_transaksi/interfaces/interface_patch_transaksi.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class CubitPatchTransaksi extends Cubit<DataStatePatchTransaksi> implements InterfacesUpdateTransaksi{
  final InterfacePatchTransaksi _dataPatchTransaksi = getItInstance<InterfacePatchTransaksi>();
  final InterfaceUpdateDataProductTransaksiLocal _dataUpdateTransaksiLocal = getItInstance<InterfaceUpdateDataProductTransaksiLocal>();
  CubitPatchTransaksi() : super(DataStatePatchTransaksi(loadingTransaksi: false, status: false));
  
  @override
  Future<void> updateDataTransaksi({
    required String transactionsId, 
    required String status,
    required BuildContext context
  }) async{
    emit(DataStatePatchTransaksi(loadingTransaksi: true, status: false));
    String _respons = await _dataPatchTransaksi.patchTransaksi(
      transactionsId: transactionsId, 
      status: status,
    );
    if(_respons == "berhasil"){
      await _dataUpdateTransaksiLocal.updateDataProductTransaksiLocal(tokenTransaksi: transactionsId, status: status);
      await context.read<CubitGetTransaksiProduct>().getDataTransaksiHistory();
      emit(DataStatePatchTransaksi(loadingTransaksi: false, status: true));
    }else{
      emit(DataStatePatchTransaksi(loadingTransaksi: false, status: false));
    }
  }
}