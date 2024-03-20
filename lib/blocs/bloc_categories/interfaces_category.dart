abstract class InterfacesProductsCategoryConnect{
  getDataCategoryProduct({
    required String categoryKey, 
  });
  scrollControlCategoryProduct({
    required String categoryKey, 
  });
}

abstract class InterfacesCategoryNameConnect{
  getNameCategories();
  saveLocalDataCategories();
  scrollControlNameCategories();
}

abstract class InterfacesProductsCategoryDisconnect{
  getDataCategoryProductLocal({required String categoryKey});
}

abstract class InterfacesCategoryNameDisconnect{
  getDataNameCategoriesLocal();
}