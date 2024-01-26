import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

abstract class interfacesButtonUpdateProduct{
  ButtonUploadProduct({
    required String tokenId,
    required String nameProduct,
    required String price,
    required String description,
    required String oldImage,
    required XFile? image,
    required List images,
    required String type,
    required BuildContext context,
  });
}