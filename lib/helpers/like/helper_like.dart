import 'package:foosel/helpers/like/sql_like_tabel.dart';
import 'package:foosel/interface/interface_local/helpers/interface_delete_data_like_local.dart';
import 'package:foosel/interface/interface_local/helpers/interface_get_data_like_local.dart';
import 'package:foosel/interface/interface_local/helpers/interface_insert_data_like_local.dart';

class helperLike implements interfaceGetDataLikeLocal, interfaceInsertDataLikeLocal, interfaceDeleteDataLikeLocal{
  
  @override
  Future<List<Map<String, dynamic>>> GetDataLikeLocal() async {
    final dbGet = await SqlLikeTabel.db();
    return await dbGet.query('like');
  }

  @override
  Future<List<Map<String, dynamic>>> GetDataLikeWhereIdLocal({required String tokenId}) async{
    final dbGet = await SqlLikeTabel.db();
    return await dbGet.query('like', where: "tokenId = '$tokenId'");
  }

  @override
  Future<int> DeleteDataLikeLocal() async{
    final db = await SqlLikeTabel.db();
    return await db.delete('like');
  }

  @override
  Future<int> DeleteDataLikeLocalWhereIdLocal({required String tokenId}) async{
    final db = await SqlLikeTabel.db();
    return await db.delete('like', where: "tokenId = '$tokenId'");
  }
  
  @override
  Future<int> InsertDataLikeLocal({
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