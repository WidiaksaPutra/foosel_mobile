// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_like/interfaces_like.dart';
import 'package:foosel/helpers/like/interfaces/interface_insert_data_like_local.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class CubitInsertLike extends Cubit<dynamic> implements InsertLike{
  final InterfaceInsertDataLikeLocal dataInsertLike = getItInstance<InterfaceInsertDataLikeLocal>();
  CubitInsertLike() : super("");
  
  @override
  saveLocalDataLike({
    required String tokenId,
    required String name,
    required String email,
    required String description,
    required String nameCategory,
    required String price,
    required String imagePath,
  }) async{
    await dataInsertLike.insertDataLikeLocal(
      tokenId: tokenId,
      name: name,
      email: email,
      description: description,
      nameCategory: nameCategory,
      price: price,
      imagePath: imagePath
    );
  }

  // @override
  // saveImageToLocalPath(String imageUrl) async{
    // final response = await http.get(Uri.parse(imageUrl));
    // final bytes = response.bodyBytes;
    // Directory appDocDir = await getApplicationDocumentsDirectory();
    // String appDocPath = appDocDir.path;
    // String imagePath = '$appDocPath/sample_image.jpg';

    // await File(imagePath).writeAsBytes(Uint8List.fromList(bytes));
    // throw UnimplementedError();
  // }
}