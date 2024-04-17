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
  final InterfacePostTransaksi _dataInsertTransaksi = getItInstance<InterfacePostTransaksi>();
  final InterfaceDeleteDataTransaksiLocal _dataDeleteTransaksiLocal = getItInstance<InterfaceDeleteDataTransaksiLocal>();
  final InterfaceInsertDataProductTransaksiLocal _dataInsertTransaksiProductLocal = getItInstance<InterfaceInsertDataProductTransaksiLocal>();
  final InterfaceGetTransaksi _dataGetTransaksi = getItInstance<InterfaceGetTransaksi>();
  final InterfaceDeleteDataProductTransaksiLocal _dataDeleteTransaksi = getItInstance<InterfaceDeleteDataProductTransaksiLocal>();
  CubitPostTransaksi() : super(DataPostTransaksi(loadingTransaksi: false, status: false));
  
  @override
  Future<void> saveDataTransaksi({
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
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    emit(DataPostTransaksi(loadingTransaksi: true, status: false));
    String _respons = await _dataInsertTransaksi.postTransaksi(
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
    if(_respons == "berhasil"){
      await _dataDeleteTransaksiLocal.deleteDataTransaksiLocal();
      await _dataDeleteTransaksi.deleteDataProductTransaksiLocal();
      List _dataListTransaksi = await _dataGetTransaksi.getTransaksi(email: _prefs.getString('email').toString());
      await _insertDataTransaksiHistoryLocal(dataListTransaksi: _dataListTransaksi);
      emit(DataPostTransaksi(loadingTransaksi: false, status: true));
    }else{
      emit(DataPostTransaksi(loadingTransaksi: false, status: false));
    }
  }

  Future<void> _insertDataTransaksiHistoryLocal({required List dataListTransaksi}) async{
    late int _dataLengthListTransaksi = (dataListTransaksi.length <= 10) ? dataListTransaksi.length : 10; 
    dataListTransaksi.take(_dataLengthListTransaksi).forEach((data) async {
      await _dataInsertTransaksiProductLocal.insertDataProductTransaksiLocal(
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