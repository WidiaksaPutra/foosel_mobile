import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_detail_products/state_products.dart';
import 'package:foosel/routes/route_name.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class cubitDetailNavigasiProduct extends Cubit<DataStateDetailProduct>{
  cubitDetailNavigasiProduct() : super(DataDetailProduct(navigation: ""));
  navigationDetailProduct() async{
    SharedPreferences token = await SharedPreferences.getInstance();
    if(token.getString('token').toString() != 'null'){
      Map<String, dynamic> decodeTokenUser = await JwtDecoder.decode(token.getString('token').toString());
      if(decodeTokenUser['roles'].toString() == "PEMBELI"){ 
        emit(DataDetailProduct(navigation: RouteName.detailProductPembeli));
      }
      if(decodeTokenUser['roles'].toString() == "PENJUAL"){
        emit(DataDetailProduct(navigation: RouteName.detailProductPenjual));
      }  
    }else{
      emit(DataDetailProduct(navigation: RouteName.detailProductGuest));
    }
  }
}