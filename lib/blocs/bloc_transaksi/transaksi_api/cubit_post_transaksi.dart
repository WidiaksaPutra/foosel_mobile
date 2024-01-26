import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/interfaces_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_delete_data_product_transaksi_storage_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_delete_data_transaksi_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_insert_product_transaksi_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_get_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_post_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CubitPostTransaksi extends Cubit<DataStatePostTransaksi> with insertTransaksi{
  final interfacePostTransaksi dataInsertTransaksi = getItInstance<interfacePostTransaksi>();
  final interfaceDeleteDataTransaksiLocal dataDeleteTransaksiLocal = getItInstance<interfaceDeleteDataTransaksiLocal>();
  final interfaceInsertDataProductTransaksiLocal dataInsertTransaksiProductLocal = getItInstance<interfaceInsertDataProductTransaksiLocal>();
  final interfaceGetTransaksi dataGetTransaksi = getItInstance<interfaceGetTransaksi>();
  final interfaceDeleteDataProductTransaksiStorageLocal dataDeleteTransaksi = getItInstance<interfaceDeleteDataProductTransaksiStorageLocal>();
  CubitPostTransaksi() : super(DataPostTransaksi(loadingTransaksi: true, status: false));
  
  @override
  SaveDataTransaksi({
    required String emailPembeli, 
    required String emailPenjual, 
    required String productsId,
    required String categoryId,
    required String total,
    required String totalPrice, 
    required String shippingPrice, 
    required String quantity, 
    required String status,
  }) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(DataPostTransaksi(loadingTransaksi: true, status: false));
    String respons = await dataInsertTransaksi.PostTransaksi(
      usersEmailPembeli: emailPembeli, 
      usersEmailPenjual: emailPenjual, 
      productsId: productsId, 
      categoryId: categoryId,
      quantity: quantity, 
      shippingPrice: shippingPrice, 
      status: status,
      total: total, 
      totalPrice: totalPrice,
    );
    if(respons == "berhasil"){
      await dataDeleteTransaksiLocal.DeleteDataTransaksiLocal();
      await dataDeleteTransaksi.DeleteDataProductTransaksiLocal();
      List dataListTransaksi = await dataGetTransaksi.GetTransaksi(email: prefs.getString('email').toString());
      late int dataLengthListTransaksi; 
      if(dataListTransaksi.length <= 10){
        dataLengthListTransaksi = dataListTransaksi.length; 
      }else{
        dataLengthListTransaksi = 10;
      }
      for(int i = 0; i < dataLengthListTransaksi; i++){
        await dataInsertTransaksiProductLocal.InsertDataLocal(
          tokenId: dataListTransaksi[i].productsId.toString(), 
          name: dataListTransaksi[i].products.name.toString(), 
          description: dataListTransaksi[i].products.description.toString(), 
          nameCategory: dataListTransaksi[i].category.name.toString(), 
          price: dataListTransaksi[i].products.price.toString(), 
          imagePath: dataListTransaksi[i].products.urlImage.toString(), 
          status: dataListTransaksi[i].status,
        );
      }
      emit(DataPostTransaksi(loadingTransaksi: false, status: true));
    }else{
      emit(DataPostTransaksi(loadingTransaksi: false, status: false));
    }
  }
}