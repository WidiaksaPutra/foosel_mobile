import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/interfaces_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_local/state_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_get_data_transaksi_local.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

class CubitGetTransaksiLocal extends Cubit<DataStateGetTransaksiLocal> with getTransaksiLocal{
  final interfaceGetDataTransaksiLocal dataTransaksiLocal = getItInstance<interfaceGetDataTransaksiLocal>();
  CubitGetTransaksiLocal() : super(DataGetTransaksiLocal(
    getData: [], 
    loadingTransaksi: true, 
    totalHarga: 0,
  ));

  @override
  GetDataTransaksi() async{
    emit(DataGetTransaksiLocal(
      getData: [], 
      loadingTransaksi: true, 
      totalHarga: 0,
    ));
    final dataLocal = await dataTransaksiLocal.GetDataTransaksiLocal();
    late int totalHarga = 0;
    for(int i = 0; i < dataLocal.length; i++){
      totalHarga = totalHarga + double.parse(dataLocal[i]['hargaTotal'].toString()).toInt();
    }
    emit(DataGetTransaksiLocal(
      loadingTransaksi: false, 
      getData: dataLocal, 
      totalHarga: totalHarga,
    ));
  }

  @override
  GetDataTransaksiWhereId({required String tokenId}) async{
    emit(DataGetTransaksiLocal(
      getData: [], 
      loadingTransaksi: true, 
      totalHarga: 0,
    ));
    List dataLocal = await dataTransaksiLocal.GetDataTransaksiWhereIdLocal(tokenId: tokenId);
    emit(DataGetTransaksiLocal(
      loadingTransaksi: false, 
      getData: dataLocal, 
      totalHarga: 0,
    ));
  }
}