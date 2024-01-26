abstract class dataEventPopularProduct{}

class ProductPopular implements dataEventPopularProduct{
  late int pages = 5;
  final bool connect;
  ProductPopular({required this.connect, pages});
}