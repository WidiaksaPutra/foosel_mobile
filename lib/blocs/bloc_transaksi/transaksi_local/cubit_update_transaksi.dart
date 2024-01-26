import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/interfaces_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_local/state_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_update_data_transaksi_local.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

class CubitUpdateTransaksiLocal extends Cubit<DataStateUpdateTransaksiLocal> with updateTransaksiLocal{
  final interfaceUpdateDataTransaksiLocal dataUpdateTransaksiLocal = getItInstance<interfaceUpdateDataTransaksiLocal>();
  CubitUpdateTransaksiLocal() : super(DataUpdateTransaksiLocal(status: false));

  @override
  UpdateDataTransaksiLocal({
    required String tokenId,
    required int jumlah,
    required String hargaTotal,
  }) async{
    emit(DataUpdateTransaksiLocal(status: false));
    await dataUpdateTransaksiLocal.UpdateDataTransaksiLocal(
      tokenId: tokenId, 
      jumlah: jumlah, 
      hargaTotal: hargaTotal,
    );
    emit(DataUpdateTransaksiLocal(status: true));
  }
}