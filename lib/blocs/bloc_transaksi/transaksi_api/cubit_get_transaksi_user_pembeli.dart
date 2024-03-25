import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_transaksi/interfaces_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:foosel/service/api_transaksi/interfaces/interface_get_transaksi.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:shared_preferences/shared_preferences.dart';

late List<Map<String, dynamic>> _dataUserTransaksiProducts = [];
class CubitGetTransaksiUserPembeli extends Cubit<DataStateGetTransaksi> implements InterfacesGetTransaksiHistory{
  final InterfaceGetTransaksi _dataGetTransaksi = getItInstance<InterfaceGetTransaksi>();
  CubitGetTransaksiUserPembeli() : super(DataGetTransaksi(loading: true, dataTransaksi: []));

  @override
  getDataTransaksiHistory() async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _dataUserTransaksiProducts.clear();
    emit(DataGetTransaksi(loading: true, dataTransaksi: []));
    List _dataListTransaksi = await _dataGetTransaksi.getTransaksi(email: _prefs.getString('email').toString());
    if(_dataListTransaksi.isNotEmpty){
      await _addListGetDataTransaksiHistory(_dataListTransaksi);
    }
    emit(DataGetTransaksi(loading: false, dataTransaksi: _dataUserTransaksiProducts));
  }

  Future<void> _addListGetDataTransaksiHistory(List dataListTransaksi) async{
    dataListTransaksi.forEach((data) { 
      late bool _status = false;
      for(int k = 0; k < _dataUserTransaksiProducts.length; k++){
        if(_dataUserTransaksiProducts[k]['usersEmailPembeli'].toString() == data.usersEmailPembeli.toString()){
          _status = true;
          break;
        }
      }
      if(_status == false){
        _dataUserTransaksiProducts.add({
          'usersEmailPembeli': data.usersEmailPembeli.toString(),
          'usersNamePembeli': data.usersNamePembeli.toString(),
          'usersUsernamePembeli': data.usersUsernamePembeli.toString(),
          'usersPhonePembeli': data.usersPhonePembeli.toString(),
          'usersAlamatPembeli': data.usersAlamatPembeli.toString(),
          'usersPhotoPembeli': data.usersPhotoPembeli.toString(),
        });
      }
    });
  }
}