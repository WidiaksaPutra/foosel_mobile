class DataStateCategori{
  dynamic scrollControl;
  bool loadingScrollKlassifikasi, loadingKlassifikasi;
  List dataKlassifikasiCategories;
  DataStateCategori(this.loadingScrollKlassifikasi, this.loadingKlassifikasi, this.dataKlassifikasiCategories, this.scrollControl);
}

class DataCategori extends DataStateCategori{
  DataCategori({
    required bool loadingScrollKlassifikasi, 
    required bool loadingKlassifikasi, 
    required List dataKlassifikasiCategories, 
    required dynamic scrollControl,
  })
  : super(loadingScrollKlassifikasi, loadingKlassifikasi, dataKlassifikasiCategories, scrollControl);
}

class DataStateNameCategories{
  dynamic scrollControl;
  bool loadingScrollNameCategories, loadingNameCategories;
  List dataNameCategories;
  DataStateNameCategories(this.loadingScrollNameCategories, this.loadingNameCategories, this.dataNameCategories, this.scrollControl);
}

class DataNameCategories extends DataStateNameCategories{
  DataNameCategories({
    required bool loadingScrollNameCategories, 
    required bool loadingNameCategories, 
    required List dataNameCategories, 
    required dynamic scrollControl,
  })
  : super(loadingScrollNameCategories, loadingNameCategories, dataNameCategories, scrollControl);
}

class DataStateCategoriNameNoscroll{
  bool loading;
  List<String> dataNameCategory;
  DataStateCategoriNameNoscroll(this.loading, this.dataNameCategory);
}

class DataCategoriNameNoscroll extends DataStateCategoriNameNoscroll{
  DataCategoriNameNoscroll(bool loading, List<String> dataNameCategory) : super(loading, dataNameCategory);
}