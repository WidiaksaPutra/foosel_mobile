import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_detail_products/state_products.dart';
import 'package:foosel/service/api_products/interfaces/interface_get_data_detail_product.dart';
import 'package:foosel/model/detail_products.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

late Datum dataList = Datum();
late bool loading = true;
class CubitDetailProductConnect extends Cubit<DataStateProducts>{
  final InterfaceGetDataDetailProduct dataGetDetailProduct = getItInstance<InterfaceGetDataDetailProduct>();
  CubitDetailProductConnect() : super(DataProducts(loading: loading, dataProducts: dataList, jenisDetail: true));
  getDetailProductConnect({bool jenisDetail = true, required String idProduct}) async{
    Future.delayed(Duration(milliseconds: 3000));
    emit(DataProducts(loading: loading, dataProducts: dataList, jenisDetail: jenisDetail));
    dataList = await dataGetDetailProduct.getDataDetailProduct(tokenId: idProduct);
    loading = await dataGetDetailProduct.loadingGetDataDetailProduct();
    if(loading == false){ 
      emit(DataProducts(loading: loading, dataProducts: dataList, jenisDetail: jenisDetail));
    }
  }
}