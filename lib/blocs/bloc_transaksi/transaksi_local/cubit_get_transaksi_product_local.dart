import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_transaksi/interfaces_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:foosel/interface/interface_local/helpers/interface_get_data_product_transaksi_storage_local.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

late List dataTransaksi = [];
class CubitGetTransaksiProductLocal extends Cubit<DataStateGetTransaksi> with getTransaksiLocal{
  final interfaceGetDataProductTransaksiStorageLocal dataGetTransaksiLocal = getItInstance<interfaceGetDataProductTransaksiStorageLocal>();
  CubitGetTransaksiProductLocal() : super(DataGetTransaksi(loading: false, dataTransaksi: []));

  @override
  GetDataTransaksi() async{
    dataTransaksi.clear();
    emit(DataGetTransaksi(loading: true, dataTransaksi: []));
    dataTransaksi.addAll(await dataGetTransaksiLocal.GetDataProductTransaksiLocal());
    emit(DataGetTransaksi(loading: false, dataTransaksi: dataTransaksi));
  }

  @override
  GetDataTransaksiWhereId({required String tokenId}) async{
    dataTransaksi.clear();
    emit(DataGetTransaksi(loading: true, dataTransaksi: dataTransaksi));
    if(tokenId.isNotEmpty){
      dataTransaksi.addAll(await dataGetTransaksiLocal.GetDataProductTransaksiWhereIdLocal(tokenTransaksi: tokenId));
      // dataTransaksi.addAll(await dataGetTransaksiLocal.GetDataProductTransaksiLocal());
      emit(DataGetTransaksi(loading: false, dataTransaksi: dataTransaksi));
    }
  }
}