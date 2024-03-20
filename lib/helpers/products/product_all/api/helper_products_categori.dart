import 'package:foosel/helpers/products/product_all/sql_products_tabel.dart';
import 'package:foosel/helpers/products/product_all/interfaces/interface_get_data_products_category_local.dart';

class HelperProductsCategory implements InterfaceGetDataProductsCategoryLocal{ 
  @override
  Future<List<Map<String, dynamic>>> getDataLocal({required String nameCategory}) async{
    final dbGet = await SqlProductsTabel.db();
    // final dbGetData = await dbGet.rawQuery("SELECT * FROM products WHERE nameCategory = '${nameCategory.toString()}'");
    return await dbGet.query('products', where: "nameCategory = '$nameCategory'");
  }
}