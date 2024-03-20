import 'package:foosel/service/api_products/interfaces/interface_get_data_product.dart';
import 'package:foosel/service/api_products/injection_product.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../default_test/data_dummy_test.dart';
void main(){
  group("Unit Test Service Get Products", () { 
    setupDInjectionProduct();
    final InterfaceGetDataProduct dataGetProduct = getItInstance<InterfaceGetDataProduct>();
    test("Unit Test Service Get Data Products Null", () async{
      final data = await dataGetProduct.getDataProduct(
        testing: true, 
        pages: 5,
      );
      expect(data, equals("berhasil"));
    });

    test("Unit Test Service Get Data Products Token Null", () async{
      final data = await dataGetProduct.tokenNull(
        testing: true,  
        pages: 5,
      );
      expect(data, equals("berhasil"));
    });

    test("Unit Test Service Get Data Products Pembeli", () async{
      final data = await dataGetProduct.getDataProduct(
        testing: true, 
        testingToken: tokenUserPembeli,
        pages: 5,
      );
      expect(data, equals("berhasil"));
    });

    test("Unit Test Service Get Data Products Penjual", () async{
      final data = await dataGetProduct.getDataProduct(
        testing: true, 
        testingToken: tokenUserPenjual,
        pages: 5,
      );
      expect(data, equals("berhasil"));
    });
    
    test("Unit Test Service Get Data Product Pembeli Token Not Null", () async{
      final data = await dataGetProduct.tokenNotNull(
        testing: true, 
        tokens: tokenUserPembeli,
        pages: 5,
      );
      expect(data, equals("berhasil"));
    });

    test("Unit Test Service Get Data Product Penjual Token Not Null", () async{
      final data = await dataGetProduct.tokenNotNull(
        testing: true, 
        tokens: tokenUserPenjual,
        pages: 5,
      );
      expect(data, equals("berhasil"));
    });

    test("Unit Test Service Get Data Product Role Pembeli", () async{
      Map<String, String> headers = {
        'Authorization': 'Bearer $tokenUserPembeli',
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final data = await dataGetProduct.rolePembeli(
        testing: true, 
        headers: headers,
        pages: 5,
      );
      expect(data, equals("berhasil"));
    });

    test("Unit Test Service Get Data Product Role Penjual", () async{
      Map<String, String> headers = {
        'Authorization': 'Bearer $tokenUserPenjual',
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final data = await dataGetProduct.rolePenjual(
        testing: true, 
        headers: headers,
        pages: 5,
      );
      expect(data, equals("berhasil"));
    });

    test("Unit Test Service Get Data Product Users Pembeli", () async{
      Map<String, String> headers = {
        'Authorization': 'Bearer $tokenUserPembeli',
        'Content-Type': 'application/json; charset=UTF-8',
      };
      Map<String, String> parameterApi = {
        'categories_id' : idCategory,
        'page' : '1',
        'limit' : '5',
      };
      final data = await dataGetProduct.getDataProductUsers(
        testing: true, 
        headers: headers, 
        link: 'detailPembeli',
        parameterApi: parameterApi,
      );
      expect(data, equals("berhasil"));
    });

    test("Unit Test Service Get Data Product Users Penjual", () async{
      Map<String, String> headers = {
        'Authorization': 'Bearer $tokenUserPenjual',
        'Content-Type': 'application/json; charset=UTF-8',
      };
      Map<String, String> parameterApi = {
        'categories_id' : idCategory,
        'page' : '1',
        'limit' : '5',
      };
      final data = await dataGetProduct.getDataProductUsers(
        testing: true, 
        headers: headers, 
        link: 'detailPenjual',
        parameterApi: parameterApi,
      );
      expect(data, equals("berhasil"));
    });
  });
}