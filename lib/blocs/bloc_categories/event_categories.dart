abstract class DataEventKlasifikasi{}

class NameCategories implements DataEventKlasifikasi{
  NameCategories();
}

class KlasifikasiCategories implements DataEventKlasifikasi{
  late String categoryKey;
  late int pages = 6;
  // late bool connect;
  KlasifikasiCategories({pages, required this.categoryKey});
}