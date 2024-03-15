// ignore_for_file: override_on_non_overriding_member
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:foosel/interface/interface_local/service/interface_get_transaksi.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

late List<Map<String, String>> dataTransaksiProducts = [];
late String userPembeli = "-"; 
late List dataTransaksi = [];
class CubitGetDetailTransaksiProduct extends Cubit<DataStateGetTransaksi>{
  final interfaceGetTransaksi dataGetTransaksi = getItInstance<interfaceGetTransaksi>();
  CubitGetDetailTransaksiProduct() : super(DataGetTransaksi(loading: false, dataTransaksi: []));

  @override
  GetDataTransaksiDetail({required String transactionsId}) async{
    dataTransaksiProducts.clear();
    emit(DataGetTransaksi(loading: true, dataTransaksi: []));
    List dataListTransaksi = await dataGetTransaksi.GetTransaksi(transactionsId: transactionsId);
    if(dataListTransaksi.isNotEmpty){
      await _addDetailDataTransaksi(dataListTransaksi);
      emit(DataGetTransaksi(loading: false, dataTransaksi: dataTransaksiProducts));
    }else{
      emit(DataGetTransaksi(loading: false, dataTransaksi: dataTransaksiProducts));
    }
  }

  Future<List<Map<String, String>>> _addDetailDataTransaksi(List dataListTransaksi) async{
    dataTransaksiProducts.add({
      'tokenTransaksi': dataListTransaksi[0].transactionsId.toString(),
      'usersEmailPembeli': dataListTransaksi[0].usersEmailPembeli.toString(),
      'usersEmailPenjual': dataListTransaksi[0].usersEmailPenjual.toString(),	
      'tokenProduct': dataListTransaksi[0].productsId.toString(),
      'name': dataListTransaksi[0].productsName.toString(),
      'description': dataListTransaksi[0].productsDescription.toString(),
      'nameCategory': dataListTransaksi[0].productCategoriesName.toString(),
      'price': dataListTransaksi[0].productPrice.toString(),
      'quantity': dataListTransaksi[0].quantity.toString(),
      'totalPrice': dataListTransaksi[0].totalPrice.toString(),
      'status': dataListTransaksi[0].status.toString(),
      'imagePath': dataListTransaksi[0].productsUrlImage.toString(),
    });
    return dataTransaksiProducts;
  }
}