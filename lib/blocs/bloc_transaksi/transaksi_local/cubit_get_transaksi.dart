import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_transaksi/interfaces_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_local/state_transaksi.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_get_data_transaksi_local.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

late List dataTransaksi = [];
class CubitGetTransaksiLocal extends Cubit<DataStateGetTransaksiLocal> implements InterfacesGetTransaksiLocal{
  final InterfaceGetDataTransaksiLocal dataTransaksiLocal = getItInstance<InterfaceGetDataTransaksiLocal>();
  CubitGetTransaksiLocal() : super(DataGetTransaksiLocal(
    getData: dataTransaksi, 
    loadingTransaksi: true, 
    totalHarga: 0,
  ));

  @override
  getDataTransaksi() async{
    dataTransaksi.clear();
    emit(DataGetTransaksiLocal(
      getData: dataTransaksi, 
      loadingTransaksi: true, 
      totalHarga: 0,
    ));
    dataTransaksi.addAll(await dataTransaksiLocal.getDataTransaksiLocal());
    late int totalHarga = 0;
    dataTransaksi.forEach((data) {
      totalHarga = totalHarga + double.parse(data['hargaTotal'].toString()).toInt();
    });
    emit(DataGetTransaksiLocal(
      loadingTransaksi: false, 
      getData: dataTransaksi, 
      totalHarga: totalHarga,
    ));
  }

  @override
  getDataTransaksiWhereId({required String tokenId}) async{
    dataTransaksi.clear();
    emit(DataGetTransaksiLocal(
      getData: dataTransaksi,
      loadingTransaksi: true, 
      totalHarga: 0,
    ));
    dataTransaksi.addAll(await dataTransaksiLocal.getDataTransaksiWhereIdLocal(tokenId: tokenId));
    emit(DataGetTransaksiLocal(
      loadingTransaksi: false,
      getData: dataTransaksi, 
      totalHarga: 0,
    ));
  }
}