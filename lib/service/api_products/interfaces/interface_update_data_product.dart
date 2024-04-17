import 'package:image_picker/image_picker.dart';

abstract class InterfaceUpdateDataProduct{
  Future updateDataProduct({
    bool testing = false,
    String testingTokenPenjual = "",
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
  bool loadingUpdateDataProduct();
}