import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_transaksi/interfaces_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_local/state_transaksi.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_update_data_transaksi_local.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
class CubitUpdateTransaksiLocal extends Cubit<DataStateUpdateTransaksiLocal> implements InterfacesUpdateTransaksiLocal{
  final InterfaceUpdateDataTransaksiLocal dataUpdateTransaksiLocal = getItInstance<InterfaceUpdateDataTransaksiLocal>();
  CubitUpdateTransaksiLocal() : super(DataUpdateTransaksiLocal(status: false));

  @override
  updateDataTransaksiLocal({
    required String tokenId,
    required int jumlah,
    required String hargaTotal,
  }) async{
    emit(DataUpdateTransaksiLocal(status: false));
    await dataUpdateTransaksiLocal.updateDataTransaksiLocal(
      tokenId: tokenId, 
      jumlah: jumlah, 
      hargaTotal: hargaTotal,
    );
    emit(DataUpdateTransaksiLocal(status: true));
  }
}