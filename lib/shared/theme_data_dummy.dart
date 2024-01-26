
//home_all_shoes
class PopularProduct {
  String gambar, jenis, nama, harga;
  PopularProduct(this.gambar, this.jenis, this.nama, this.harga);
}

class NewArrivals{
  String gambar, type, nama, harga;
  NewArrivals(this.gambar, this.type, this.nama, this.harga);
}

List<PopularProduct> popularProducts = [//home_all_shoes horizontal
  PopularProduct("asset/image/sampel_sepatu_home_medium.png", "Hiking", "TERREX URBAN LOW", "143980"),
  PopularProduct("asset/image/sampel_sepatu_home_medium_2.png", "Hiking", "COURT VISION 2.0", "58670"),
  PopularProduct("asset/image/sampel_sepatu_home_medium_3.png", "Training", "SL 72 SHOES", "115190"),
  PopularProduct("asset/image/sampel_sepatu_home_medium.png", "Hiking", "TERREX URBAN LOW", "143980"),
  PopularProduct("asset/image/sampel_sepatu_home_medium_2.png", "Hiking", "COURT VISION 2.0", "58670"),
  PopularProduct("asset/image/sampel_sepatu_home_medium_3.png", "Training", "SL 72 SHOES", "115190"),
  PopularProduct("asset/image/sampel_sepatu_home_medium.png", "Hiking", "TERREX URBAN LOW", "143980"),
  PopularProduct("asset/image/sampel_sepatu_home_medium_2.png", "Hiking", "COURT VISION 2.0", "58670"),
  PopularProduct("asset/image/sampel_sepatu_home_medium_3.png", "Training", "SL 72 SHOES", "115190"),
  PopularProduct("asset/image/sampel_sepatu_home_medium.png", "Hiking", "TERREX URBAN LOW", "143980"),
  PopularProduct("asset/image/sampel_sepatu_home_medium_2.png", "Hiking", "COURT VISION 2.0", "58670"),
  PopularProduct("asset/image/sampel_sepatu_home_medium_3.png", "Training", "SL 72 SHOES", "115190"),
];

List<NewArrivals> newArrivals = [//home_all_shoes vertical
  NewArrivals("asset/image/sampel_sepatu_home_small.png", "Football", "Predator 20.3 Firm Ground", "68470"),
  NewArrivals("asset/image/sampel_sepatu_home_small_2.png", "Running", "Ultra 4D 5 Shoes", "285730"),
  NewArrivals("asset/image/sampel_sepatu_home_small_3.png", "Basketball", "Court Vision 2.0 Shoes", "57150"),
  NewArrivals("asset/image/sampel_sepatu_home_small_4.png", "Training", "LEGO® SPORT SHOES", "92720"),
];

//data message

class Message{
  String gambar, titleName, contentName, time;
  Message(this.gambar, this.titleName, this.contentName, this.time); 
}

List<Message> messageList = [
  Message("asset/icon/logo_shop_picture.png", "Shoe Store", "Good night, This item is on This item is on", "02 - 07 - 1999"),
  Message("asset/icon/logo_shop_picture.png", "Shoe Store", "Good night, This item is on This item is on", "Now"),
  Message("asset/icon/logo_shop_picture.png", "Shoe Store", "Good night, This item is on This item is on", "Now"),
  Message("asset/icon/logo_shop_picture.png", "Shoe Store", "Good night, This item is on This item is on", "Now"),
  Message("asset/icon/logo_shop_picture.png", "Shoe Store", "Good night, This item is on This item is on", "Now"),
  Message("asset/icon/logo_shop_picture.png", "Shoe Store", "Good night, This item is on This item is on", "Now"),
  Message("asset/icon/logo_shop_picture.png", "Shoe Store", "Good night, This item is on This item is on", "Now"),
  Message("asset/icon/logo_shop_picture.png", "Shoe Store", "Good night, This item is on This item is on", "02 - 07 - 1999"),
  Message("asset/icon/logo_shop_picture.png", "Shoe Store", "Good night, This item is on This item is on", "Now"),
  Message("asset/icon/logo_shop_picture.png", "Shoe Store", "Good night, This item is on This item is on", "Now"),
  Message("asset/icon/logo_shop_picture.png", "Shoe Store", "Good night, This item is on This item is on", "Now"),
  Message("asset/icon/logo_shop_picture.png", "Shoe Store", "Good night, This item is on This item is on", "Now"),
  Message("asset/icon/logo_shop_picture.png", "Shoe Store", "Good night, This item is on This item is on", "Now"),
  Message("asset/icon/logo_shop_picture.png", "Shoe Store", "Good night, This item is on This item is on", "Now"),
];

//data detail message

class dataMessage{
  late String image, dataName, dataHarga;
  late String data;
  late bool jenisUserPembeli;

  dataMessage(this.image, this.dataName, this.dataHarga ,this.data, this.jenisUserPembeli);
}

List<dataMessage> listDataMessage = [
  dataMessage("-", "-", "-", "Hi, This item is still available?", true),
  dataMessage("asset/image/sampel_sepatu_home_small.png", "COURT VISION 2.0 SHOES", "5715", "-", true),
  dataMessage("-", "-", "-", "Hi, This item is still available?", true),
  dataMessage("-", "-", "-", "Good night, This item is only available in size 42 and 43", false),
  dataMessage("asset/image/sampel_sepatu_home_small.png", "COURT VISION 2.0 SHOES", "5715", "-", false),
  dataMessage("-", "-", "-", "Good night, This item is only available in size 42 and 43", false),
  dataMessage("asset/image/sampel_sepatu_home_small.png", "COURT VISION 2.0 SHOES", "5715", "-", true),
  dataMessage("-", "-", "-", "Hi, This item is still available?", true),
  dataMessage("asset/image/sampel_sepatu_home_small.png", "COURT VISION 2.0 SHOES", "5715", "-", false),
  dataMessage("-", "-", "-", "Good night, This item is only available in size 42 and 43", false),
  dataMessage("-", "-", "-", "Good night, This item is only available in size 42 and 43", false),
  dataMessage("-", "-", "-", "Hi, This item is still available?", true),
  dataMessage("-", "-", "-", "Hi, This item is still available?", true),
  dataMessage("-", "-", "-", "Good night, This item is only available in size 42 and 43", false),
  dataMessage("-", "-", "-", "Good night, This item is only available in size 42 and 43", false),
  dataMessage("-", "-", "-", "Hi, This item is still available?", true),
  dataMessage("-", "-", "-", "Good night, This item is only available in size 42 and 43", false),
  dataMessage("-", "-", "-", "Good night, This item is only available in size 42 and 43", false),
];

//data like

class DataLike {
  String image, title, harga;
  bool status;
  DataLike(this.image, this.title, this.harga, this.status);
}
List<DataLike> likeList = [
  DataLike("asset/image/sampel_sepatu_home_small.png", "Terrex Urban Low", "14398", true),
  DataLike("asset/image/sampel_sepatu_home_small.png", "Predator 20.3 Firm Ground Boots", "6847", true),
  DataLike("asset/image/sampel_sepatu_home_small.png", "Terrex Urban Low", "14398", true),
  DataLike("asset/image/sampel_sepatu_home_small.png", "Predator 20.3 Firm Ground Boots", "6847", true),
  DataLike("asset/image/sampel_sepatu_home_small.png", "Terrex Urban Low", "14398", true),
  DataLike("asset/image/sampel_sepatu_home_small.png", "Predator 20.3 Firm Ground Boots", "6847", true),
  DataLike("asset/image/sampel_sepatu_home_small.png", "Terrex Urban Low", "14398", true),
  DataLike("asset/image/sampel_sepatu_home_small.png", "Predator 20.3 Firm Ground Boots", "6847", true),
  DataLike("asset/image/sampel_sepatu_home_small.png", "Terrex Urban Low", "14398", true),
  DataLike("asset/image/sampel_sepatu_home_small.png", "Predator 20.3 Firm Ground Boots", "6847", true),
  DataLike("asset/image/sampel_sepatu_home_small.png", "Terrex Urban Low", "14398", true),
  DataLike("asset/image/sampel_sepatu_home_small.png", "Predator 20.3 Firm Ground Boots", "6847", true),
  DataLike("asset/image/sampel_sepatu_home_small.png", "Terrex Urban Low", "14398", true),
  DataLike("asset/image/sampel_sepatu_home_small.png", "Predator 20.3 Firm Ground Boots", "6847", true),
  DataLike("asset/image/sampel_sepatu_home_small.png", "Terrex Urban Low", "14398", true),
  DataLike("asset/image/sampel_sepatu_home_small.png", "Predator 20.3 Firm Ground Boots", "6847", true),
];

//cart
class DataListCart{
  late String id, image, title, harga, jumlahItem;
  DataListCart(this.id ,this.image, this.title, this.harga, this.jumlahItem);
}

List<DataListCart> ListDataCart = [
  DataListCart("1", "asset/image/sampel_sepatu_home_small.png", "Terrex Urban Low", "14398", "2"),
  DataListCart("2", "asset/image/sampel_sepatu_home_small.png", "Predator 20.3 Firm Ground Boots", "6847", "1"),
  DataListCart("3", "asset/image/sampel_sepatu_home_small.png", "Terrex Urban Low", "14398", "1"),
  DataListCart("4", "asset/image/sampel_sepatu_home_small.png", "Predator 20.3 Firm Ground Boots", "6847", "1"),
  DataListCart("5", "asset/image/sampel_sepatu_home_small.png", "Terrex Urban Low", "14398", "1"),
  DataListCart("6", "asset/image/sampel_sepatu_home_small.png", "Predator 20.3 Firm Ground Boots", "6847", "1"),
  DataListCart("7", "asset/image/sampel_sepatu_home_small.png", "Terrex Urban Low", "14398", "1"),
  DataListCart("8", "asset/image/sampel_sepatu_home_small.png", "Predator 20.3 Firm Ground Boots", "6847", "1"),
  DataListCart("9", "asset/image/sampel_sepatu_home_small.png", "Terrex Urban Low", "14398", "1"),
  DataListCart("10","asset/image/sampel_sepatu_home_small.png", "Predator 20.3 Firm Ground Boots", "6847", "1"),
  DataListCart("11","asset/image/sampel_sepatu_home_small.png", "Terrex Urban Low", "14398", "1"),
  DataListCart("12","asset/image/sampel_sepatu_home_small.png", "Predator 20.3 Firm Ground Boots", "6847", "1"),
  DataListCart("13","asset/image/sampel_sepatu_home_small.png", "Terrex Urban Low", "14398", "1"),
  DataListCart("14","asset/image/sampel_sepatu_home_small.png", "Predator 20.3 Firm Ground Boots", "6847", "1"),
  DataListCart("15","asset/image/sampel_sepatu_home_small.png", "Terrex Urban Low", "14398", "1"),
  DataListCart("16","asset/image/sampel_sepatu_home_small.png", "Predator 20.3 Firm Ground Boots", "6847", "1"),
  DataListCart("17","asset/image/sampel_sepatu_home_small.png", "Terrex Urban Low", "14398", "1"),
  DataListCart("18","asset/image/sampel_sepatu_home_small.png", "Predator 20.3 Firm Ground Boots", "6847", "1"),
  DataListCart("19","asset/image/sampel_sepatu_home_small.png", "Terrex Urban Low", "14398", "1"),
  DataListCart("20","asset/image/sampel_sepatu_home_small.png", "Predator 20.3 Firm Ground Boots", "6847", "1"),
];

//detail
List imageProduct = [
  'asset/image/sampel_sepatu_home_small_2.png',
  'asset/image/sampel_detail_sepatu_2.png',
  'asset/image/sampel_detail_sepatu_3.png',
];

List imageFamiliarShoes = [
  'asset/image/familiar_shoes1.png',
  'asset/image/familiar_shoes2.png',
  'asset/image/familiar_shoes3.png',
  'asset/image/familiar_shoes4.png',
  'asset/image/familiar_shoes5.png',
  'asset/image/familiar_shoes1.png',
  'asset/image/familiar_shoes2.png',
  'asset/image/familiar_shoes3.png',
  'asset/image/familiar_shoes4.png',
  'asset/image/familiar_shoes5.png',
];