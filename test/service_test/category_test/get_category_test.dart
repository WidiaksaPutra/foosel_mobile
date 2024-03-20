import 'package:foosel/service/api_categories/interface_get_data_category.dart';
import 'package:foosel/service/api_categories/injection_categories.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group("Unit Test Service Get Category", (){
    setupDInjectionCategories();
    final InterfaceGetDataCategory dataGetNameCategoryFuture = getItInstance<InterfaceGetDataCategory>();
    test("Unit Test Service Data Get Category", () async{
      final data = await dataGetNameCategoryFuture.getDataCategory(testing: true, loadingApiService: true);
      expect(data, equals([]));
    });
    test("Unit Test Service Data Get Category No Parameters", () async{
      final data = await dataGetNameCategoryFuture.getDataCategoryNoParameters(testing: true, loadingApiService: true);
      expect(data, equals([]));
    });
  });
}