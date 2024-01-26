import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/interfaces_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_patch_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

class CubitPatchTransaksi extends Cubit<DataStatePatchTransaksi> implements updateTransaksi{
  final interfacePatchTransaksi dataPatchTransaksi = getItInstance<interfacePatchTransaksi>();
  CubitPatchTransaksi() : super(DataStatePatchTransaksi(loadingTransaksi: true, status: false));
  
  @override
  UpdateDataTransaksi({
    required String transactionsId, 
    required String status,
  }) async{
    emit(DataStatePatchTransaksi(loadingTransaksi: true, status: false));
    String respons = await dataPatchTransaksi.PatchTransaksi(
      transactionsId: transactionsId, 
      status: status,
    );
    if(respons == "berhasil"){
      emit(DataStatePatchTransaksi(loadingTransaksi: false, status: true));
    }else{
      emit(DataStatePatchTransaksi(loadingTransaksi: false, status: false));
    }
  }
}