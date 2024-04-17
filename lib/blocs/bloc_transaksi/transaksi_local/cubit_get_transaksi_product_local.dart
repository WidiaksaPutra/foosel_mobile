import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_transaksi/interfaces_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_get_data_product_transaksi_local.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

late List _dataTransaksi = [];
class CubitGetTransaksiProductLocal extends Cubit<DataStateGetTransaksi> implements InterfacesGetTransaksiLocal{
  final InterfaceGetDataProductTransaksiLocal _dataGetTransaksiLocal = getItInstance<InterfaceGetDataProductTransaksiLocal>();
  CubitGetTransaksiProductLocal() : super(DataGetTransaksi(loading: false, dataTransaksi: []));

  @override
  Future<void> getDataTransaksi() async{
    _dataTransaksi.clear();
    emit(DataGetTransaksi(loading: true, dataTransaksi: []));
    _dataTransaksi.addAll(await _dataGetTransaksiLocal.getDataProductTransaksiLocal());
    emit(DataGetTransaksi(loading: false, dataTransaksi: _dataTransaksi));
  }

  @override
  Future<void> getDataTransaksiWhereId({required String tokenId}) async{
    _dataTransaksi.clear();
    emit(DataGetTransaksi(loading: true, dataTransaksi: _dataTransaksi));
    if(tokenId.isNotEmpty){
      _dataTransaksi.addAll(await _dataGetTransaksiLocal.getDataProductTransaksiWhereIdLocal(tokenTransaksi: tokenId));
      // dataTransaksi.addAll(await dataGetTransaksiLocal.GetDataProductTransaksiLocal());
      emit(DataGetTransaksi(loading: false, dataTransaksi: _dataTransaksi));
    }
  }
}