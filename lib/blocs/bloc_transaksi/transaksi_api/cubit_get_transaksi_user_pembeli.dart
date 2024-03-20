import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_transaksi/interfaces_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:foosel/service/api_transaksi/interfaces/interface_get_transaksi.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:shared_preferences/shared_preferences.dart';

late List<Map<String, dynamic>> dataUserTransaksiProducts = [];
class CubitGetTransaksiUserPembeli extends Cubit<DataStateGetTransaksi> implements InterfacesGetTransaksiHistory{
  final InterfaceGetTransaksi dataGetTransaksi = getItInstance<InterfaceGetTransaksi>();
  CubitGetTransaksiUserPembeli() : super(DataGetTransaksi(loading: true, dataTransaksi: []));

  @override
  getDataTransaksiHistory() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dataUserTransaksiProducts.clear();
    emit(DataGetTransaksi(loading: true, dataTransaksi: []));
    List dataListTransaksi = await dataGetTransaksi.getTransaksi(email: prefs.getString('email').toString());
    if(dataListTransaksi.isNotEmpty){
      await _addListGetDataTransaksiHistory(dataListTransaksi);
    }
    emit(DataGetTransaksi(loading: false, dataTransaksi: dataUserTransaksiProducts));
  }

  Future<void> _addListGetDataTransaksiHistory(List dataListTransaksi) async{
    dataListTransaksi.forEach((data) { 
      late bool status = false;
      for(int k = 0; k < dataUserTransaksiProducts.length; k++){
        if(dataUserTransaksiProducts[k]['usersEmailPembeli'].toString() == data.usersEmailPembeli.toString()){
          status = true;
          break;
        }
      }
      if(status == false){
        dataUserTransaksiProducts.add({
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