// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_like/interfaces_like.dart';
import 'package:foosel/interface/interface_local/helpers/interface_insert_data_like_local.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class cubitInsertLike extends Cubit<dynamic> with insertLike{
  final interfaceInsertDataLikeLocal dataInsertLike = getItInstance<interfaceInsertDataLikeLocal>();
  cubitInsertLike() : super("");
  
  @override
  SaveLocalDataLike({
    required String tokenId,
    required String name,
    required String email,
    required String description,
    required String nameCategory,
    required String price,
    required String imagePath,
  }) async{
    await dataInsertLike.InsertDataLikeLocal(
      tokenId: tokenId,
      name: name,
      email: email,
      description: description,
      nameCategory: nameCategory,
      price: price,
      imagePath: imagePath
    );
  }

  @override
  SaveImageToLocalPath(String imageUrl) async{
    // final response = await http.get(Uri.parse(imageUrl));
    // final bytes = response.bodyBytes;
    // Directory appDocDir = await getApplicationDocumentsDirectory();
    // String appDocPath = appDocDir.path;
    // String imagePath = '$appDocPath/sample_image.jpg';

    // await File(imagePath).writeAsBytes(Uint8List.fromList(bytes));
    // throw UnimplementedError();
  }
}