import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_transaksi/interfaces_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_get_data_product_transaksi_local.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_insert_data_product_transaksi_local.dart';
import 'package:foosel/service/api_transaksi/interfaces/interface_get_transaksi.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:shared_preferences/shared_preferences.dart';

late List<Map<String, String>> _dataTransaksiProducts = [];
late String _userPembeli = "-"; 
late List _dataTransaksi = [];
class CubitGetTransaksiProduct extends Cubit<DataStateGetTransaksi> implements InterfacesGetTransaksiHistory{
  final InterfaceGetTransaksi _dataGetTransaksi = getItInstance<InterfaceGetTransaksi>();
  final InterfaceInsertDataProductTransaksiLocal _dataInsertTransaksiProductLocal = getItInstance<InterfaceInsertDataProductTransaksiLocal>();
  final InterfaceGetDataProductTransaksiLocal _dataGetTransaksiLocal = getItInstance<InterfaceGetDataProductTransaksiLocal>();
  CubitGetTransaksiProduct() : super(DataGetTransaksi(loading: false, dataTransaksi: []));

  @override
  getDataTransaksiHistory() async{
    _dataTransaksiProducts.clear();
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    emit(DataGetTransaksi(loading: true, dataTransaksi: []));
    List _dataLocal = await _dataGetTransaksiLocal.getDataProductTransaksiLocal();
    List _dataListTransaksi = await _dataGetTransaksi.getTransaksi(email: _prefs.getString('email').toString());
    if(_dataListTransaksi.isNotEmpty){
      _insertDataTransaksiHistoryLocal(dataLocal: _dataLocal, dataListTransaksi: _dataListTransaksi);
      _addListDataTransaksiHistory(_dataListTransaksi);
      emit(DataGetTransaksi(loading: false, dataTransaksi: _dataTransaksiProducts));
    }else{
      emit(DataGetTransaksi(loading: false, dataTransaksi: _dataTransaksiProducts));
    }
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

  Future<List<Map<String, String>>> _addListDataTransaksiHistory(List dataListTransaksi) async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    if(_prefs.getString('usersEmailPembeli') != null){
      _userPembeli = _prefs.getString('usersEmailPembeli').toString();
    }
    for(int index = 0; index < dataListTransaksi.length; index++){
      _dataTransaksiProducts.add({
        'tokenTransaksi': dataListTransaksi[index].transactionsId.toString(),
        'usersEmailPembeli': dataListTransaksi[index].usersEmailPembeli.toString(),
        'usersEmailPenjual': dataListTransaksi[index].usersEmailPenjual.toString(),	
        'tokenProduct': dataListTransaksi[index].productsId.toString(),
        'name': dataListTransaksi[index].productsName.toString(),
        'description': dataListTransaksi[index].productsDescription.toString(),
        'nameCategory': dataListTransaksi[index].productCategoriesName.toString(),
        'price': dataListTransaksi[index].productPrice.toString(),
        'quantity': dataListTransaksi[index].quantity.toString(),
        'totalPrice': dataListTransaksi[index].totalPrice.toString(),
        'status': dataListTransaksi[index].status.toString(),
        'imagePath': dataListTransaksi[index].productsUrlImage.toString(),
        'usersEmailPembeliOnClick': _userPembeli,
      });
    }
    return _dataTransaksiProducts;
  }
}