import 'package:foosel/helpers/categories/sql_categories_tabel.dart';
import 'package:foosel/interface/interface_local/helpers/interface_delete_data_category_storage_local.dart';
import 'package:foosel/interface/interface_local/helpers/interface_get_data_category_storage_local.dart';
import 'package:foosel/interface/interface_local/helpers/interface_insert_data_category_local.dart';
import 'package:foosel/interface/interface_local/helpers/interface_update_data_category_local.dart';

class helperCategories implements interfaceInsertDataCategoryLocal, interfaceGetDataCategoryStorageLocal, interfaceDeleteDataCategoryStorageLocal, interfaceUpdateDataCategoryLocal{
  @override
  Future<int> InsertDataLocal({required String id, required String name}) async{
    final db = await SqlCategoriesTabel.db();
    final dataInsert = {'id': id, 'name': name};
    return await db.insert('categories', dataInsert);
  }

  @override
  Future<List<Map<String, dynamic>>> GetDataCategoryLocal() async{
    final dbGet = await SqlCategoriesTabel.db();
    return await dbGet.query('categories');
  }

  @override
  Future<int> UpdateDataLocal({required String id, required String name}) async{
    final db = await SqlCategoriesTabel.db();
    final dataUpdate = {'id': id, 'name': name};
    return await db.update('categories', dataUpdate);
  }
  
  @override
  Future<int> DeleteDataCategoryLocal() async{
    final db = await SqlCategoriesTabel.db();
    return await db.delete('categories');
  }
}