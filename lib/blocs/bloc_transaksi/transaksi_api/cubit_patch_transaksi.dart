import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_transaksi/interfaces_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/cubit_get_transaksi_product.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:foosel/interface/interface_local/helpers/interface_update_data_product_transaksi_local.dart';
import 'package:foosel/interface/interface_local/service/interface_patch_transaksi.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class CubitPatchTransaksi extends Cubit<DataStatePatchTransaksi> implements updateTransaksi{
  final interfacePatchTransaksi dataPatchTransaksi = getItInstance<interfacePatchTransaksi>();
  final interfaceUpdateDataProductTransaksiLocal dataUpdateTransaksiLocal = getItInstance<interfaceUpdateDataProductTransaksiLocal>();
  CubitPatchTransaksi() : super(DataStatePatchTransaksi(loadingTransaksi: false, status: false));
  
  @override
  UpdateDataTransaksi({
    required String transactionsId, 
    required String status,
    required BuildContext context
  }) async{
    emit(DataStatePatchTransaksi(loadingTransaksi: true, status: false));
    String respons = await dataPatchTransaksi.PatchTransaksi(
      transactionsId: transactionsId, 
      status: status,
    );
    if(respons == "berhasil"){
      await dataUpdateTransaksiLocal.UpdateDataProductTransaksiLocal(tokenTransaksi: transactionsId, status: status);
      await context.read<CubitGetTransaksiProduct>().GetDataTransaksiHistory();
      emit(DataStatePatchTransaksi(loadingTransaksi: false, status: true));
    }else{
      emit(DataStatePatchTransaksi(loadingTransaksi: false, status: false));
    }
  }
}