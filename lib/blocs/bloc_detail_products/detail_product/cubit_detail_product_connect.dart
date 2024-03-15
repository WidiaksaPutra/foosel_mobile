import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_detail_products/state_products.dart';
import 'package:foosel/interface/interface_local/service/interface_get_data_detail_product.dart';
import 'package:foosel/model/detail_products.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

late Datum dataList = Datum();
late bool loading = true;
class CubitDetailProductConnect extends Cubit<DataStateProducts>{
  final interfaceGetDataDetailProduct dataGetDetailProduct = getItInstance<interfaceGetDataDetailProduct>();
  CubitDetailProductConnect() : super(DataProducts(loading: loading, dataProducts: dataList, jenisDetail: true));
  GetDetailProductConnect({bool jenisDetail = true, required String idProduct}) async{
    Future.delayed(Duration(milliseconds: 3000));
    emit(DataProducts(loading: loading, dataProducts: dataList, jenisDetail: jenisDetail));
    dataList = await dataGetDetailProduct.GetDataDetailProduct(tokenId: idProduct);
    loading = await dataGetDetailProduct.LoadingGetDataDetailProduct();
    if(loading == false){ 
      emit(DataProducts(loading: loading, dataProducts: dataList, jenisDetail: jenisDetail));
    }
  }
}