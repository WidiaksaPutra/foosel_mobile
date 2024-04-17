abstract class DataEventAllProduct{}
//kegunaan abstract hanya sebagai tanda pengenal saja yang membuktikan class yang diimplement bagian dari abstract,
//tujuannya agar class event dapat terhubung dengan bloc.

class Product implements DataEventAllProduct{
  final int pages = 6;
  Product({pages});
}