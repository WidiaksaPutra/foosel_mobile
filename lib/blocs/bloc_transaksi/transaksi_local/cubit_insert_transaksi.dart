import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/interfaces_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_local/state_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_insert_data_transaksi_local.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

class CubitInsertTransaksiLocal extends Cubit<DataStatePostTransaksiLocal> with insertTransaksiLocal{
  final interfaceInsertDataTransaksiLocal dataInsertTransaksiLocal = getItInstance<interfaceInsertDataTransaksiLocal>();
  CubitInsertTransaksiLocal() : super(DataPostTransaksiLocal(loadingTransaksi: true, status: false));
  
  @override
  SaveLocalDataTransaksi({
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
    required String imagePath
  }) async{
    emit(DataPostTransaksiLocal(loadingTransaksi: true, status: false));
    int respons = await dataInsertTransaksiLocal.InsertDataTransaksiLocal(
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
    );
    if(respons != 0){
      emit(DataPostTransaksiLocal(loadingTransaksi: false, status: true));
    }else{
      emit(DataPostTransaksiLocal(loadingTransaksi: false, status: false));
    }
  }
}