import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_transaksi/interfaces_transaksi.dart';
import 'package:foosel/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:foosel/interface/interface_local/helpers/interface_get_data_product_transaksi_storage_local.dart';
import 'package:foosel/interface/interface_local/helpers/interface_insert_product_transaksi_local.dart';
import 'package:foosel/interface/interface_local/service/interface_get_transaksi.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:shared_preferences/shared_preferences.dart';

late List<Map<String, String>> dataTransaksiProducts = [];
late String userPembeli = "-"; 
late List dataTransaksi = [];
class CubitGetTransaksiProduct extends Cubit<DataStateGetTransaksi> with getTransaksiHistory{
  final interfaceGetTransaksi dataGetTransaksi = getItInstance<interfaceGetTransaksi>();
  final interfaceInsertDataProductTransaksiLocal dataInsertTransaksiProductLocal = getItInstance<interfaceInsertDataProductTransaksiLocal>();
  final interfaceGetDataProductTransaksiStorageLocal dataGetTransaksiLocal = getItInstance<interfaceGetDataProductTransaksiStorageLocal>();
  CubitGetTransaksiProduct() : super(DataGetTransaksi(loading: false, dataTransaksi: []));

  @override
  GetDataTransaksiHistory() async{
    dataTransaksiProducts.clear();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(DataGetTransaksi(loading: true, dataTransaksi: []));
    List dataLocal = await dataGetTransaksiLocal.GetDataProductTransaksiLocal();
    List dataListTransaksi = await dataGetTransaksi.GetTransaksi(email: prefs.getString('email').toString());
    if(dataListTransaksi.isNotEmpty){
      _insertDataTransaksiHistoryLocal(dataLocal: dataLocal, dataListTransaksi: dataListTransaksi);
      _addListDataTransaksiHistory(dataListTransaksi);
      emit(DataGetTransaksi(loading: false, dataTransaksi: dataTransaksiProducts));
    }else{
      emit(DataGetTransaksi(loading: false, dataTransaksi: dataTransaksiProducts));
    }
  }

  Future<void> _insertDataTransaksiHistoryLocal({
    required List dataLocal,
    required List dataListTransaksi,
  }) async{
    if(dataLocal.isEmpty){
      dataTransaksi.clear();
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

  Future<List<Map<String, String>>> _addListDataTransaksiHistory(List dataListTransaksi) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString('usersEmailPembeli') != null){
      userPembeli = prefs.getString('usersEmailPembeli').toString();
    }
    for(int index = 0; index < dataListTransaksi.length; index++){
      dataTransaksiProducts.add({
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
        'usersEmailPembeliOnClick': userPembeli,
      });
    }
    return dataTransaksiProducts;
  }
}