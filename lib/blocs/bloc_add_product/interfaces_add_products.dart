import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

abstract class InterfacesUploadProduct{
  Future<void> uploadProduct({
    required String nameProduct,
    required String price,
    required String description,
    required XFile? image,
    required List images,
    required String type,
    required BuildContext context,
  });
}