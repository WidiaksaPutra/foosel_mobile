import 'package:image_picker/image_picker.dart';

abstract class InterfacePostDataProduct{
  Future postDataProduct({
    bool testing = false,
    String testingTokenPenjual = "",
    required String email, 
    required String name, 
    required String price, 
    required String description, 
    required XFile? image, 
    required List images, 
    required String type,
  });
}