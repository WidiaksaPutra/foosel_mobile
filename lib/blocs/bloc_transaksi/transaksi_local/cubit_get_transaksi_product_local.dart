import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_transaksi/interfaces_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_get_data_product_transaksi_local.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

late List dataTransaksi = [];
class CubitGetTransaksiProductLocal extends Cubit<DataStateGetTransaksi> implements InterfacesGetTransaksiLocal{
  final InterfaceGetDataProductTransaksiLocal dataGetTransaksiLocal = getItInstance<InterfaceGetDataProductTransaksiLocal>();
  CubitGetTransaksiProductLocal() : super(DataGetTransaksi(loading: false, dataTransaksi: []));

  @override
  getDataTransaksi() async{
    dataTransaksi.clear();
    emit(DataGetTransaksi(loading: true, dataTransaksi: []));
    dataTransaksi.addAll(await dataGetTransaksiLocal.getDataProductTransaksiLocal());
    emit(DataGetTransaksi(loading: false, dataTransaksi: dataTransaksi));
  }

  @override
  getDataTransaksiWhereId({required String tokenId}) async{
    dataTransaksi.clear();
    emit(DataGetTransaksi(loading: true, dataTransaksi: dataTransaksi));
    if(tokenId.isNotEmpty){
      dataTransaksi.addAll(await dataGetTransaksiLocal.getDataProductTransaksiWhereIdLocal(tokenTransaksi: tokenId));
      // dataTransaksi.addAll(await dataGetTransaksiLocal.GetDataProductTransaksiLocal());
      emit(DataGetTransaksi(loading: false, dataTransaksi: dataTransaksi));
    }
  }
}