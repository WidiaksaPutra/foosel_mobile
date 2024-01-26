import 'package:image_picker/image_picker.dart';

abstract class interfacePostDataProduct{
  PostDataProduct({
    required String email,
    required String name, 
    required String price, 
    required String description,
    required XFile? image,
    required List images,
    required String type,
  });
}