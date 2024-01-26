import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/interfaces_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_transaksi/transaksi_api/state_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_get_data_product_transaksi_storage_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_insert_product_transaksi_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_get_transaksi.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';
import 'package:shared_preferences/shared_preferences.dart';

late List<Map<String, dynamic>> dataTransaksiProducts = [];
class CubitGetTransaksiProduct extends Cubit<DataStateGetTransaksi> with getTransaksiHistory{
  final interfaceGetTransaksi dataGetTransaksi = getItInstance<interfaceGetTransaksi>();
  final interfaceInsertDataProductTransaksiLocal dataInsertTransaksiProductLocal = getItInstance<interfaceInsertDataProductTransaksiLocal>();
  final interfaceGetDataProductTransaksiStorageLocal dataGetTransaksiLocal = getItInstance<interfaceGetDataProductTransaksiStorageLocal>();
  CubitGetTransaksiProduct() : super(DataGetTransaksi(loading: false, dataTransaksi: []));

  @override
  GetDataTransaksiHistory() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dataTransaksiProducts.clear();
    emit(DataGetTransaksi(loading: true, dataTransaksi: []));
    List dataLocal = await dataGetTransaksiLocal.GetDataProductTransaksiLocal();
    List dataListTransaksi = await dataGetTransaksi.GetTransaksi(email: prefs.getString('email').toString());
    if(dataListTransaksi.isNotEmpty){
      late int dataLengthListTransaksi; 
      if(dataListTransaksi.length <= 10){
        dataLengthListTransaksi = dataListTransaksi.length; 
      }else{
        dataLengthListTransaksi = 10;
      }
      for(int i = 0; i < dataLengthListTransaksi; i++){
        dataTransaksiProducts.add({
          'transactionsId': dataListTransaksi[i].transactionsId.toString(),
          'productId': dataListTransaksi[i].productsId.toString(),
          'name': dataListTransaksi[i].products.name.toString(),
          'price': dataListTransaksi[i].products.price.toString(),
          'urlImage': dataListTransaksi[i].products.urlImage.toString(),
          'categoryName': dataListTransaksi[i].category.name.toString(),
          'status': dataListTransaksi[i].status.toString(),
        });
        if(dataLocal.isEmpty){
          await dataInsertTransaksiProductLocal.InsertDataLocal(
            tokenId: dataListTransaksi[i].productsId.toString(), 
            name: dataListTransaksi[i].products.name.toString(), 
            description: dataListTransaksi[i].products.description.toString(), 
            nameCategory: dataListTransaksi[i].category.name.toString(), 
            price: dataListTransaksi[i].products.price.toString(), 
            imagePath: dataListTransaksi[i].products.urlImage.toString(), 
            status: dataListTransaksi[i].status.toString(),
          );
        }
      }
    }
    emit(DataGetTransaksi(loading: false, dataTransaksi: dataTransaksiProducts));
  }
}