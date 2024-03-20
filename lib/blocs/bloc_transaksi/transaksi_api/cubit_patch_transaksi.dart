import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_transaksi/interfaces_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/cubit_get_transaksi_product.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_update_data_product_transaksi_local.dart';
import 'package:foosel/service/api_transaksi/interfaces/interface_patch_transaksi.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class CubitPatchTransaksi extends Cubit<DataStatePatchTransaksi> implements InterfacesUpdateTransaksi{
  final InterfacePatchTransaksi dataPatchTransaksi = getItInstance<InterfacePatchTransaksi>();
  final InterfaceUpdateDataProductTransaksiLocal dataUpdateTransaksiLocal = getItInstance<InterfaceUpdateDataProductTransaksiLocal>();
  CubitPatchTransaksi() : super(DataStatePatchTransaksi(loadingTransaksi: false, status: false));
  
  @override
  updateDataTransaksi({
    required String transactionsId, 
    required String status,
    required BuildContext context
  }) async{
    emit(DataStatePatchTransaksi(loadingTransaksi: true, status: false));
    String respons = await dataPatchTransaksi.patchTransaksi(
      transactionsId: transactionsId, 
      status: status,
    );
    if(respons == "berhasil"){
      await dataUpdateTransaksiLocal.updateDataProductTransaksiLocal(tokenTransaksi: transactionsId, status: status);
      await context.read<CubitGetTransaksiProduct>().getDataTransaksiHistory();
      emit(DataStatePatchTransaksi(loadingTransaksi: false, status: true));
    }else{
      emit(DataStatePatchTransaksi(loadingTransaksi: false, status: false));
    }
  }
}