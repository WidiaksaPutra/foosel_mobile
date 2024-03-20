import 'package:foosel/helpers/like/sql_like_tabel.dart';
import 'package:foosel/helpers/like/interfaces/interface_delete_data_like_local.dart';
import 'package:foosel/helpers/like/interfaces/interface_get_data_like_local.dart';
import 'package:foosel/helpers/like/interfaces/interface_insert_data_like_local.dart';

class HelperLike implements 
  InterfaceGetDataLikeLocal, 
  InterfaceInsertDataLikeLocal, 
  InterfaceDeleteDataLikeLocal{
  @override
  Future<List<Map<String, dynamic>>> getDataLikeLocal() async {
    final dbGet = await SqlLikeTabel.db();
    return await dbGet.query('like');
  }

  @override
  Future<List<Map<String, dynamic>>> getDataLikeWhereIdLocal({required String tokenId}) async{
    final dbGet = await SqlLikeTabel.db();
    return await dbGet.query('like', where: "tokenId = '$tokenId'");
  }

  @override
  Future<int> deleteDataLikeLocal() async{
    final db = await SqlLikeTabel.db();
    return await db.delete('like');
  }

  @override
  Future<int> deleteDataLikeLocalWhereIdLocal({required String tokenId}) async{
    final db = await SqlLikeTabel.db();
    return await db.delete('like', where: "tokenId = '$tokenId'");
  }
  
  @override
  Future<int> insertDataLikeLocal({
    required String tokenId, 
    required String name,
    required String email,
    required String description, 
    required String nameCategory, 
    required String price, 
    required String imagePath,
  }) async {
    final db = await SqlLikeTabel.db();
    final dataInsert = {
      'tokenId': tokenId, 
      'name': name,
      'email': email,
      'description': description, 
      'nameCategory': nameCategory, 
      'price': price,
      'imagePath': imagePath
    };
    return await db.insert('like', dataInsert);
  }
}