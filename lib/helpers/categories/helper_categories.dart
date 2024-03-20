import 'package:foosel/helpers/categories/sql_categories_tabel.dart';
import 'package:foosel/helpers/categories/interfaces/interface_delete_data_category_local.dart';
import 'package:foosel/helpers/categories/interfaces/interface_get_data_category_local.dart';
import 'package:foosel/helpers/categories/interfaces/interface_insert_data_category_local.dart';
import 'package:foosel/helpers/categories/interfaces/interface_update_data_category_local.dart';

class HelperCategories implements 
  InterfaceInsertDataCategoryLocal, 
  InterfaceGetDataCategoryLocal, 
  InterfaceDeleteDataCategoryLocal, 
  InterfaceUpdateDataCategoryLocal{
  @override
  Future<int> insertDataCategoryLocal({required String id, required String name}) async{
    final db = await SqlCategoriesTabel.db();
    final dataInsert = {'id': id, 'name': name};
    return await db.insert('categories', dataInsert);
  }

  @override
  Future<List<Map<String, dynamic>>> getDataCategoryLocal() async{
    final dbGet = await SqlCategoriesTabel.db();
    return await dbGet.query('categories');
  }

  @override
  Future<int> updateDataCategoryLocal({required String id, required String name}) async{
    final db = await SqlCategoriesTabel.db();
    final dataUpdate = {'id': id, 'name': name};
    return await db.update('categories', dataUpdate);
  }
  
  @override
  Future<int> deleteDataCategoryLocal() async{
    final db = await SqlCategoriesTabel.db();
    return await db.delete('categories');
  }
}