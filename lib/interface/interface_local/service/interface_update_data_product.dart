import 'package:image_picker/image_picker.dart';

abstract class interfaceUpdateDataProduct{
  UpdateDataProduct({
    required String tokenId,
    required String email,
    required String name,
    required String price,
    required String type,
    required String description,
    required String oldImage,
    required XFile? image,
    required List images,
  });
  bool LoadingUpdateDataProduct();
}