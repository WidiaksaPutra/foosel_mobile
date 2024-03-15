import 'package:foosel/interface/interface_local/service/interface_get_data_detail_product.dart';
import 'package:foosel/service/api_products/injection_product.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../default_test/data_dummy_test.dart';

void main(){
  group("Unit Test Service Get Detail Product", () { 
    setupDInjectionProduct();
    final interfaceGetDataDetailProduct dataGetDetailProduct = getItInstance<interfaceGetDataDetailProduct>();

    test("Unit Test Service Get Data Detail Product Null", () async{
      final data = await dataGetDetailProduct.GetDataDetailProduct(
        testing: true, 
        tokenId: idProducts,
      );
      expect(data, equals("berhasil"));
    });

    test("Unit Test Service Get Data Detail Product Token Null", () async{
      final data = await dataGetDetailProduct.TokenNull(testing: true, tokenId: idProducts);
      expect(data, equals("berhasil"));
    });

    test("Unit Test Service Get Data Detail Product Pembeli", () async{
      final data = await dataGetDetailProduct.GetDataDetailProduct(
        testing: true, 
        testingToken: tokenUserPembeli,
        tokenId: idProducts,
      );
      expect(data, equals("berhasil"));
    });

    test("Unit Test Service Get Data Detail Product Penjual", () async{
      final data = await dataGetDetailProduct.GetDataDetailProduct(
        testing: true, 
        testingToken: tokenUserPenjual,
        tokenId: idProducts,
      );
      expect(data, equals("berhasil"));
    });

    test("Unit Test Service Get Data Detail Product Pembeli Token Not Null", () async{
      final data = await dataGetDetailProduct.TokenNotNull(
        testing: true, 
        tokens: tokenUserPembeli,
        tokenId: idProducts,
      );
      expect(data, equals("berhasil"));
    });

    test("Unit Test Service Get Data Detail Product Penjual Token Not Null", () async{
      final data = await dataGetDetailProduct.TokenNotNull(
        testing: true, 
        tokens: tokenUserPenjual,
        tokenId: idProducts,
      );
      expect(data, equals("berhasil"));
    });

    test("Unit Test Service Get Data Detail Product Role Pembeli", () async{
      Map<String, String> headers = {
        'Authorization': 'Bearer $tokenUserPembeli',
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final data = await dataGetDetailProduct.RolePembeli(
        testing: true, 
        headers: headers,
        tokenId: idProducts,
      );
      expect(data, equals("berhasil"));
    });

    test("Unit Test Service Get Data Detail Product Role Penjual", () async{
      Map<String, String> headers = {
        'Authorization': 'Bearer $tokenUserPenjual',
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final data = await dataGetDetailProduct.RolePenjual(
        testing: true, 
        headers: headers,
        tokenId: idProducts,
      );
      expect(data, equals("berhasil"));
    });

    test("Unit Test Service Get Data Detail Product Users Pembeli", () async{
      Map<String, String> headers = {
        'Authorization': 'Bearer $tokenUserPembeli',
        'Content-Type': 'application/json; charset=UTF-8',
      };
      Map<String, String> parameterApi = {
      'token_id' : idProducts,
      };
      final data = await dataGetDetailProduct.GetDataProductUsers(
        testing: true, 
        headers: headers, 
        link: 'detailPembeli',
        parameterApi: parameterApi,
      );
      expect(data, equals("berhasil"));
    });

    test("Unit Test Service Get Data Detail Product Users Penjual", () async{
      Map<String, String> headers = {
        'Authorization': 'Bearer $tokenUserPenjual',
        'Content-Type': 'application/json; charset=UTF-8',
      };
      Map<String, String> parameterApi = {
      'token_id' : idProducts,
      };
      final data = await dataGetDetailProduct.GetDataProductUsers(
        testing: true, 
        headers: headers, 
        link: 'detailPenjual',
        parameterApi: parameterApi,
      );
      expect(data, equals("berhasil"));
    });
  });
}