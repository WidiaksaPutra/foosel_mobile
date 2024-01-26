import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_detail_products/state_products.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_get_data_detail_product.dart';
import 'package:flutter_laravel_toko_sepatu/model/detail_products.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';

late Datum dataList = Datum();
late bool loading = true;
class CubitDetailProductConnect extends Cubit<DataStateProducts>{
  final interfaceGetDataDetailProduct dataGetDetailProduct = getItInstance<interfaceGetDataDetailProduct>();
  CubitDetailProductConnect() : super(DataProducts(loading, dataList));
  GetDetailProductConnect(String idProduct) async{
    emit(DataProducts(loading, dataList));
    dataList = await dataGetDetailProduct.GetDataDetailProduct(tokenId: idProduct);
    loading = await dataGetDetailProduct.LoadingGetDataDetailProduct();
    if(loading == false){ 
      emit(DataProducts(loading, dataList));
    }
  }
}