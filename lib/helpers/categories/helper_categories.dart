import 'package:flutter_laravel_toko_sepatu/helpers/categories/sql_categories_tabel.dart';
import 'package:flutter_laravel_toko_sepatu/interface/default/interface_delete_data_storage_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_get_data_category_storage_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_insert_data_category_local.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/helpers/interface_update_data_category_local.dart';

class helperCategories implements interfaceInsertDataCategoryLocal, interfaceGetDataCategoryStorageLocal, interfaceDeleteDataStorageLocal, interfaceUpdateDataCategoryLocal{
  @override
  Future<int> InsertDataLocal({required String id, required String name}) async{
    print("test helper local");
    print(id);
    print(name);
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
  DeleteDataLocal() async{
    final db = await SqlCategoriesTabel.db();
    return await db.delete('categories');
  }
  
  @override
  Future<int> UpdateDataLocal({required String id, required String name}) async{
    final db = await SqlCategoriesTabel.db();
    final dataUpdate = {'id': id, 'name': name};
    return await db.update('categories', dataUpdate);
  }
}