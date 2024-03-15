import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_transaksi/interfaces_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_local/state_transaksi.dart';
import 'package:foosel/interface/interface_local/helpers/interface_get_data_transaksi_local.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

late List dataTransaksi = [];
class CubitGetTransaksiLocal extends Cubit<DataStateGetTransaksiLocal> with getTransaksiLocal{
  final interfaceGetDataTransaksiLocal dataTransaksiLocal = getItInstance<interfaceGetDataTransaksiLocal>();
  CubitGetTransaksiLocal() : super(DataGetTransaksiLocal(
    getData: dataTransaksi, 
    loadingTransaksi: true, 
    totalHarga: 0,
  ));

  @override
  GetDataTransaksi() async{
    dataTransaksi.clear();
    emit(DataGetTransaksiLocal(
      getData: dataTransaksi, 
      loadingTransaksi: true, 
      totalHarga: 0,
    ));
    dataTransaksi.addAll(await dataTransaksiLocal.GetDataTransaksiLocal());
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
  GetDataTransaksiWhereId({required String tokenId}) async{
    dataTransaksi.clear();
    emit(DataGetTransaksiLocal(
      getData: dataTransaksi,
      loadingTransaksi: true, 
      totalHarga: 0,
    ));
    dataTransaksi.addAll(await dataTransaksiLocal.GetDataTransaksiWhereIdLocal(tokenId: tokenId));
    emit(DataGetTransaksiLocal(
      loadingTransaksi: false,
      getData: dataTransaksi, 
      totalHarga: 0,
    ));
  }
}