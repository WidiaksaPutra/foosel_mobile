abstract class interfacesProductsCategoryConnect{
  GetDataCategoryProduct({
    required String categoryKey, 
  });
  ScrollControlCategoryProduct({
    required String categoryKey, 
  });
}

abstract class interfacesCategoryNameConnect{
  GetNameCategories();
  SaveLocalDataCategories();
  ScrollControlNameCategories();
}

abstract class interfacesProductsCategoryDisconnect{
  GetDataCategoryProductLocal(String categoryKey);
}

abstract class interfacesCategoryNameDisconnect{
  GetDataNameCategoriesLocal();
}