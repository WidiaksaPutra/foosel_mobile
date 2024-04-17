import 'package:flutter/material.dart';

abstract class InterfacesProductsCategoryConnect{
  Future<void> getDataCategoryProduct({
    required int pages,
    required String categoryKey, 
  });
  void scrollControlCategoryProduct({
    required int pages,
    required String categoryKey, 
  });
}

abstract class InterfacesCategoryNameConnect{
  Future<void> getNameCategories();
  Future<void> saveLocalDataCategories();
  void scrollControlNameCategories();
}

abstract class InterfacesProductsCategoryDisconnect{
  Future<void> getDataCategoryProductLocal({required String categoryKey});
}

abstract class InterfacesCategoryNameDisconnect{
  Future<void> getDataNameCategoriesLocal();
}

abstract class InterfacesConnectionNameCategories{
  Future<void> connectCheck(BuildContext context, dynamic connection);
}

abstract class InterfacesMainDataNoscrollCategories{
  Future<void> fetchCategoriesNoscroll();
}