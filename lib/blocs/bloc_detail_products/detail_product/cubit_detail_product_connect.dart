import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_detail_products/interfaces/interfaces_cubit_detail_product_connect.dart';
import 'package:foosel/blocs/bloc_detail_products/state_products.dart';
import 'package:foosel/service/api_products/interfaces/interface_get_data_detail_product.dart';
import 'package:foosel/model/detail_products.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

late Datum _dataList = Datum();
late bool _loading = true;
class CubitDetailProductConnect extends Cubit<DataStateProducts> implements InterfacesCubitDetailProductConnect{
  final InterfaceGetDataDetailProduct _dataGetDetailProduct = getItInstance<InterfaceGetDataDetailProduct>();
  CubitDetailProductConnect() : super(DataProducts(loading: _loading, dataProducts: _dataList, jenisDetail: true));
  @override
  Future<void> getDetailProductConnect({bool jenisDetail = true, required String idProduct}) async{
    Future.delayed(Duration(milliseconds: 3000));
    emit(DataProducts(loading: _loading, dataProducts: _dataList, jenisDetail: jenisDetail));
    _dataList = await _dataGetDetailProduct.getDataDetailProduct(tokenId: idProduct);
    _loading = await _dataGetDetailProduct.loadingGetDataDetailProduct();
    if(_loading == false){ 
      emit(DataProducts(loading: _loading, dataProducts: _dataList, jenisDetail: jenisDetail));
    }
  }
}