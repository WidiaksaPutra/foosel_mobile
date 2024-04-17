import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

abstract class InterfacesCubitNavigationListImageBarang{
  void navigation({
    required String namaProduct,
    required String deskripsi,
    required String price,
    required String typeProduct,
    required XFile? image,
    required String navigation,
    required BuildContext context,
  });
}