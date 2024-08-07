import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_transaksi/interfaces_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_local/state_transaksi.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_insert_data_transaksi_local.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class CubitInsertTransaksiLocal extends Cubit<DataStatePostTransaksiLocal> implements InterfacesInsertTransaksiLocal{
  final InterfaceInsertDataTransaksiLocal _dataInsertTransaksiLocal = getItInstance<InterfaceInsertDataTransaksiLocal>();
  CubitInsertTransaksiLocal() : super(DataPostTransaksiLocal(loadingTransaksi: true, status: false));
  
  @override
  Future<void> saveLocalDataTransaksi({
    required String emailPenjual,
    required String emailPembeli,
    required String tokenId, 
    required String idCategory,
    required String name, 
    required String description, 
    required String nameCategory, 
    required String hargaSatuan,
    required String hargaTotal,
    required int jumlah, 
    required String imagePath,
    required dynamic alamat,
  }) async{
    emit(DataPostTransaksiLocal(loadingTransaksi: true, status: false));
    Future.delayed(Duration(seconds: 2));
    int _respons = await _dataInsertTransaksiLocal.insertDataTransaksiLocal(
      emailPenjual: emailPenjual,
      emailPembeli: emailPembeli,
      tokenId: tokenId,
      idCategory: idCategory,
      name: name,
      description: description,
      nameCategory: nameCategory,
      jumlah: jumlah,
      hargaSatuan: hargaSatuan,
      hargaTotal: hargaTotal,
      imagePath: imagePath, 
      alamat: alamat,
    );
    if(_respons != 0){
      emit(DataPostTransaksiLocal(loadingTransaksi: false, status: true));
    }else{
      emit(DataPostTransaksiLocal(loadingTransaksi: false, status: false));
    }
  }
}