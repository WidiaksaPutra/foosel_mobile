import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_detail_products/interfaces/interfaces_cubit_detail_navigasi_product.dart';
import 'package:foosel/blocs/bloc_detail_products/state_products.dart';
import 'package:foosel/routes/route_name.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CubitDetailNavigasiProduct extends Cubit<DataStateDetailProduct> implements InterfacesCubitDetailNavigasiProduct{
  CubitDetailNavigasiProduct() : super(DataDetailProduct(navigation: ""));
  @override
  Future<void> navigationDetailProduct() async{
    SharedPreferences _token = await SharedPreferences.getInstance();
    if(_token.getString('token').toString() != 'null'){
      Map<String, dynamic> _decodeTokenUser = await JwtDecoder.decode(_token.getString('token').toString());
      if(_decodeTokenUser['roles'].toString() == "PEMBELI"){ 
        emit(DataDetailProduct(navigation: RouteName.detailProductPembeli));
      }
      if(_decodeTokenUser['roles'].toString() == "PENJUAL"){
        emit(DataDetailProduct(navigation: RouteName.detailProductPenjual));
      }  
    }else{
      emit(DataDetailProduct(navigation: RouteName.detailProductGuest));
    }
  }
}