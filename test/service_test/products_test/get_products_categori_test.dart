import 'package:foosel/interface/interface_local/service/interface_get_data_products_category.dart';
import 'package:foosel/service/api_products/injection_product.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../default_test/data_dummy_test.dart';

void main(){
  group("Unit Test Service Get Products Categori", () { 
    setupDInjectionProduct();
    final interfaceGetDataProductsCategory dataGetProductCategoryFuture = getItInstance<interfaceGetDataProductsCategory>();
    
    test("Unit Test Service Get Data Products Categori Null", () async{
      final data = await dataGetProductCategoryFuture.GetDataProductsCategory(
        testing: true,
        categoriesId: idCategory, 
        fresh: true,
      );
      expect(data, equals("berhasil"));
    });

    test("Unit Test Service Get Data Categori Products Token Null", () async{
      final data = await dataGetProductCategoryFuture.TokenNull(
        testing: true,  
        categoriesId: idCategory,
      );
      expect(data, equals("berhasil"));
    });

    test("Unit Test Service Get Data Categori Products Pembeli", () async{
      final data = await dataGetProductCategoryFuture.GetDataProductsCategory(
        testing: true, 
        testingToken: tokenUserPembeli,
        categoriesId: idCategory, 
        fresh: true,
      );
      expect(data, equals("berhasil"));
    });

    test("Unit Test Service Get Data Categori Products Penjual", () async{
      final data = await dataGetProductCategoryFuture.GetDataProductsCategory(
        testing: true, 
        testingToken: tokenUserPenjual,
        categoriesId: idCategory, 
        fresh: true,
      );
      expect(data, equals("berhasil"));
    });
    
    test("Unit Test Service Get Data Categori Product Pembeli Token Not Null", () async{
      final data = await dataGetProductCategoryFuture.TokenNotNull(
        testing: true, 
        tokens: tokenUserPembeli,
        categoriesId: idCategory,
      );
      expect(data, equals("berhasil"));
    });

    test("Unit Test Service Get Data Categori Product Penjual Token Not Null", () async{
      final data = await dataGetProductCategoryFuture.TokenNotNull(
        testing: true, 
        tokens: tokenUserPenjual,
        categoriesId: idCategory,
      );
      expect(data, equals("berhasil"));
    });

    test("Unit Test Service Get Data Categori Product Role Pembeli", () async{
      Map<String, String> headers = {
        'Authorization': 'Bearer $tokenUserPembeli',
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final data = await dataGetProductCategoryFuture.RolePembeli(
        testing: true, 
        headers: headers,
        categoriesId: idCategory,
      );
      expect(data, equals("berhasil"));
    });

    test("Unit Test Service Get Data Categori Product Role Penjual", () async{
      Map<String, String> headers = {
        'Authorization': 'Bearer $tokenUserPenjual',
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final data = await dataGetProductCategoryFuture.RolePenjual(
        testing: true, 
        headers: headers,
        categoriesId: idCategory,
      );
      expect(data, equals("berhasil"));
    });

    test("Unit Test Service Get Data Categori Product Users Pembeli", () async{
      Map<String, String> headers = {
        'Authorization': 'Bearer $tokenUserPembeli',
        'Content-Type': 'application/json; charset=UTF-8',
      };
      Map<String, String> parameterApi = {
        'categories_id' : idCategory,
        'page' : '1',
        'limit' : '5',
      };
      final data = await dataGetProductCategoryFuture.GetDataProductUsers(
        testing: true, 
        headers: headers, 
        link: 'detailPembeli',
        parameterApi: parameterApi,
      );
      expect(data, equals("berhasil"));
    });

    test("Unit Test Service Get Data Categori Product Users Penjual", () async{
      Map<String, String> headers = {
        'Authorization': 'Bearer $tokenUserPenjual',
        'Content-Type': 'application/json; charset=UTF-8',
      };
      Map<String, String> parameterApi = {
        'categories_id' : idCategory,
        'page' : '1',
        'limit' : '5',
      };
      final data = await dataGetProductCategoryFuture.GetDataProductUsers(
        testing: true, 
        headers: headers, 
        link: 'detailPenjual',
        parameterApi: parameterApi,
      );
      expect(data, equals("berhasil"));
    });
  });
}