import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/interfaces_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_get_data_product_transaksi_storage_local.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

late List dataTransaksi = [];
class CubitGetTransaksiProductLocal extends Cubit<DataStateGetTransaksi> with getTransaksi{
  final interfaceGetDataProductTransaksiStorageLocal dataGetTransaksiLocal = getItInstance<interfaceGetDataProductTransaksiStorageLocal>();
  CubitGetTransaksiProductLocal() : super(DataGetTransaksi(loading: false, dataTransaksi: []));

  @override
  GetDataTransaksi() async{
    dataTransaksi.clear();
    emit(DataGetTransaksi(loading: true, dataTransaksi: []));
    dataTransaksi.addAll(await dataGetTransaksiLocal.GetDataProductTransaksiLocal());
    print("data transaksi local $dataTransaksi");
    emit(DataGetTransaksi(loading: false, dataTransaksi: dataTransaksi));
  }
}