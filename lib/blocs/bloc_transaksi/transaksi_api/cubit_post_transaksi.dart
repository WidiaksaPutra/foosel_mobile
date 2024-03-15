import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_transaksi/interfaces_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:foosel/interface/interface_local/helpers/interface_delete_data_product_transaksi_storage_local.dart';
import 'package:foosel/interface/interface_local/helpers/interface_delete_data_transaksi_local.dart';
import 'package:foosel/interface/interface_local/helpers/interface_insert_product_transaksi_local.dart';
import 'package:foosel/interface/interface_local/service/interface_get_transaksi.dart';
import 'package:foosel/interface/interface_local/service/interface_post_transaksi.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CubitPostTransaksi extends Cubit<DataStatePostTransaksi> with insertTransaksi{
  final interfacePostTransaksi dataInsertTransaksi = getItInstance<interfacePostTransaksi>();
  final interfaceDeleteDataTransaksiLocal dataDeleteTransaksiLocal = getItInstance<interfaceDeleteDataTransaksiLocal>();
  final interfaceInsertDataProductTransaksiLocal dataInsertTransaksiProductLocal = getItInstance<interfaceInsertDataProductTransaksiLocal>();
  final interfaceGetTransaksi dataGetTransaksi = getItInstance<interfaceGetTransaksi>();
  final interfaceDeleteDataProductTransaksiStorageLocal dataDeleteTransaksi = getItInstance<interfaceDeleteDataProductTransaksiStorageLocal>();
  CubitPostTransaksi() : super(DataPostTransaksi(loadingTransaksi: false, status: false));
  
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
      await _insertDataTransaksiHistoryLocal(dataListTransaksi: dataListTransaksi);
      emit(DataPostTransaksi(loadingTransaksi: false, status: true));
    }else{
      emit(DataPostTransaksi(loadingTransaksi: false, status: false));
    }
  }

  Future<void> _insertDataTransaksiHistoryLocal({required List dataListTransaksi}) async{
    late int dataLengthListTransaksi = (dataListTransaksi.length <= 10) ? dataListTransaksi.length : 10; 
    dataListTransaksi.take(dataLengthListTransaksi).forEach((data) async {
      await dataInsertTransaksiProductLocal.InsertDataLocal(
        tokenTransaksi: data.transactionsId.toString(),
        usersEmailPembeli: data.usersEmailPembeli.toString(),
        usersEmailPenjual: data.usersEmailPenjual.toString(),
        tokenProduct: data.productsId.toString(),
        name: data.productsName.toString(),
        description: data.productsDescription.toString(),
        nameCategory: data.productCategoriesName.toString(),
        price: data.productPrice.toString(),
        imagePath: data.productsUrlImage.toString(),
        quantity: data.quantity.toString(),
        totalPrice: data.totalPrice.toString(),
        status: data.status.toString(),
      );
    });
  }
}