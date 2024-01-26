mixin DataEventKlasifikasi{}

class NameCategories with DataEventKlasifikasi{
  NameCategories();
}

class KlasifikasiCategories with DataEventKlasifikasi{
  late String categoryKey;
  // late bool connect;
  KlasifikasiCategories({required this.categoryKey});
}