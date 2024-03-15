import 'package:foosel/helpers/products/product_all/sql_products_tabel.dart';
import 'package:foosel/interface/interface_local/helpers/interface_get_data_products_category_local.dart';

class helperProductsCategory implements interfaceGetDataProductsCategoryLocal{ 
  @override
  Future<List<Map<String, dynamic>>> GetDataLocal({required String nameCategory}) async{
    final dbGet = await SqlProductsTabel.db();
    // final dbGetData = await dbGet.rawQuery("SELECT * FROM products WHERE nameCategory = '${nameCategory.toString()}'");
    return await dbGet.query('products', where: "nameCategory = '$nameCategory'");
  }
}