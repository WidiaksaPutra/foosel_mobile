import 'package:foosel/interface/interface_local/service/interface_get_data_category.dart';
import 'package:foosel/service/api_categories/injection_categories.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group("Unit Test Service Get Category", (){
    setupDInjectionCategories();
    final interfaceGetDataCategory dataGetNameCategoryFuture = getItInstance<interfaceGetDataCategory>();
    test("Unit Test Service Data Get Category", () async{
      final data = await dataGetNameCategoryFuture.GetDataCategory(testing: true, loadingApiService: true);
      expect(data, equals([]));
    });
    test("Unit Test Service Data Get Category No Parameters", () async{
      final data = await dataGetNameCategoryFuture.GetDataCategoryNoParameters(testing: true, loadingApiService: true);
      expect(data, equals([]));
    });
  });
}