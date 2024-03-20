import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_transaksi/interfaces_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_delete_data_product_transaksi_local.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_delete_data_transaksi_local.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_insert_data_product_transaksi_local.dart';
import 'package:foosel/service/api_transaksi/interfaces/interface_get_transaksi.dart';
import 'package:foosel/service/api_transaksi/interfaces/interface_post_transaksi.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CubitPostTransaksi extends Cubit<DataStatePostTransaksi> implements InterfacesInsertTransaksi{
  final InterfacePostTransaksi dataInsertTransaksi = getItInstance<InterfacePostTransaksi>();
  final InterfaceDeleteDataTransaksiLocal dataDeleteTransaksiLocal = getItInstance<InterfaceDeleteDataTransaksiLocal>();
  final InterfaceInsertDataProductTransaksiLocal dataInsertTransaksiProductLocal = getItInstance<InterfaceInsertDataProductTransaksiLocal>();
  final InterfaceGetTransaksi dataGetTransaksi = getItInstance<InterfaceGetTransaksi>();
  final InterfaceDeleteDataProductTransaksiLocal dataDeleteTransaksi = getItInstance<InterfaceDeleteDataProductTransaksiLocal>();
  CubitPostTransaksi() : super(DataPostTransaksi(loadingTransaksi: false, status: false));
  
  @override
  saveDataTransaksi({
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
    String respons = await dataInsertTransaksi.postTransaksi(
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
      await dataDeleteTransaksiLocal.deleteDataTransaksiLocal();
      await dataDeleteTransaksi.deleteDataProductTransaksiLocal();
      List dataListTransaksi = await dataGetTransaksi.getTransaksi(email: prefs.getString('email').toString());
      await _insertDataTransaksiHistoryLocal(dataListTransaksi: dataListTransaksi);
      emit(DataPostTransaksi(loadingTransaksi: false, status: true));
    }else{
      emit(DataPostTransaksi(loadingTransaksi: false, status: false));
    }
  }

  Future<void> _insertDataTransaksiHistoryLocal({required List dataListTransaksi}) async{
    late int dataLengthListTransaksi = (dataListTransaksi.length <= 10) ? dataListTransaksi.length : 10; 
    dataListTransaksi.take(dataLengthListTransaksi).forEach((data) async {
      await dataInsertTransaksiProductLocal.insertDataProductTransaksiLocal(
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