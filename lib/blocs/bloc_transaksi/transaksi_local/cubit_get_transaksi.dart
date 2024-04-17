import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_transaksi/interfaces_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_local/state_transaksi.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_get_data_transaksi_local.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

late List _dataTransaksi = [];
class CubitGetTransaksiLocal extends Cubit<DataStateGetTransaksiLocal> implements InterfacesGetTransaksiLocal{
  final InterfaceGetDataTransaksiLocal _dataTransaksiLocal = getItInstance<InterfaceGetDataTransaksiLocal>();
  CubitGetTransaksiLocal() : super(DataGetTransaksiLocal(
    getData: _dataTransaksi, 
    loadingTransaksi: true, 
    totalHarga: 0,
  ));

  @override
  Future<void> getDataTransaksi() async{
    _dataTransaksi.clear();
    emit(DataGetTransaksiLocal(
      getData: _dataTransaksi, 
      loadingTransaksi: true, 
      totalHarga: 0,
    ));
    _dataTransaksi.addAll(await _dataTransaksiLocal.getDataTransaksiLocal());
    late int _totalHarga = 0;
    _dataTransaksi.forEach((data) {
      _totalHarga = _totalHarga + double.parse(data['hargaTotal'].toString()).toInt();
    });
    emit(DataGetTransaksiLocal(
      loadingTransaksi: false, 
      getData: _dataTransaksi, 
      totalHarga: _totalHarga,
    ));
  }

  @override
  Future<void> getDataTransaksiWhereId({required String tokenId}) async{
    _dataTransaksi.clear();
    emit(DataGetTransaksiLocal(
      getData: _dataTransaksi,
      loadingTransaksi: true, 
      totalHarga: 0,
    ));
    _dataTransaksi.addAll(await _dataTransaksiLocal.getDataTransaksiWhereIdLocal(tokenId: tokenId));
    emit(DataGetTransaksiLocal(
      loadingTransaksi: false,
      getData: _dataTransaksi, 
      totalHarga: 0,
    ));
  }
}