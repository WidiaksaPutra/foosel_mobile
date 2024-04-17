import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_transaksi/interfaces_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_get_data_product_transaksi_local.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_insert_data_product_transaksi_local.dart';
import 'package:foosel/service/api_transaksi/interfaces/interface_get_transaksi.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:shared_preferences/shared_preferences.dart';

late List _dataTransaksi = [], _dataLocal = [], _dataListTransaksi = [];
class CubitGetTransaksiProduct extends Cubit<DataStateGetTransaksi> implements InterfacesGetTransaksiHistory, InterfacesGetTransaksiProductPenjual{
  final InterfaceGetTransaksi _dataGetTransaksi = getItInstance<InterfaceGetTransaksi>();
  final InterfaceInsertDataProductTransaksiLocal _dataInsertTransaksiProductLocal = getItInstance<InterfaceInsertDataProductTransaksiLocal>();
  final InterfaceGetDataProductTransaksiLocal _dataGetTransaksiLocal = getItInstance<InterfaceGetDataProductTransaksiLocal>();
  CubitGetTransaksiProduct() : super(DataGetTransaksi(loading: false, dataTransaksi: []));

  @override
  Future<void> getDataTransaksiHistory() async{
    await _getDataTransaksi();
    if(_dataListTransaksi.isNotEmpty){
      await _insertDataTransaksiHistoryLocal(dataLocal: _dataLocal, dataListTransaksi: _dataListTransaksi);
      emit(DataGetTransaksi(loading: false, dataTransaksi: _dataListTransaksi));
    }else{
      emit(DataGetTransaksi(loading: false, dataTransaksi: _dataListTransaksi));
    }
  }

  @override
  Future<void> getDataTransaksiProductPenjual() async{
    await _getDataTransaksi();
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    List _dataTransaksiProductPenjual = [];
    if(_dataListTransaksi.isNotEmpty){
      await _insertDataTransaksiHistoryLocal(dataLocal: _dataLocal, dataListTransaksi: _dataListTransaksi);
      if(_prefs.getString('usersEmailPembeli') != null){
        for(int i = 0; i < _dataListTransaksi.length; i++){
          if(_dataListTransaksi[i].usersEmailPembeli.toString() == _prefs.getString('usersEmailPembeli')){
            _dataTransaksiProductPenjual.add(_dataListTransaksi[i]);
          }  
        }
      }
      emit(DataGetTransaksi(loading: false, dataTransaksi: _dataTransaksiProductPenjual));
    }else{
      emit(DataGetTransaksi(loading: false, dataTransaksi: _dataTransaksiProductPenjual));
    }
  }

  Future<void> _getDataTransaksi() async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    emit(DataGetTransaksi(loading: true, dataTransaksi: []));
    _dataLocal = await _dataGetTransaksiLocal.getDataProductTransaksiLocal();
    _dataListTransaksi = await _dataGetTransaksi.getTransaksi(email: _prefs.getString('email').toString());
  }

  Future<void> _insertDataTransaksiHistoryLocal({
    required List dataLocal,
    required List dataListTransaksi,
  }) async{
    if(dataLocal.isEmpty){
      _dataTransaksi.clear();
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
}