abstract class DataEventKlasifikasi{}

class NameCategories implements DataEventKlasifikasi{
  NameCategories();
}

class KlasifikasiCategories implements DataEventKlasifikasi{
  late String categoryKey;
  // late bool connect;
  KlasifikasiCategories({required this.categoryKey});
}