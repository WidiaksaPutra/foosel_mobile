import 'package:foosel/model/categories.dart';

abstract class InterfaceGetDataCategory{
  Future<List<Datum>> getDataCategory({
    bool testing = false,
    required bool loadingApiService,
  });

  Future<List<Datum>> getDataCategoryNoParameters({
    bool testing = false,
    required bool loadingApiService,
  });
}