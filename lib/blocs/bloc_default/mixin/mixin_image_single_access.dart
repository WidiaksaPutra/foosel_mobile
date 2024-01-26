import 'package:image_picker/image_picker.dart';

mixin imageSingleAccess{
  imageSingle({
    required String namaProduct,
    required String deskripsi,
    required String price,
    required String typeProduct,
  }) async{
    final ImagePicker imagePicker = ImagePicker();
    if(namaProduct != 'null' 
    && deskripsi != 'null' 
    && price != 'null'
    && price != '0.00'
    && typeProduct != "All Product"
    && typeProduct != 'null'
    && price.length <= 16){
      return await imagePicker.pickImage(source: ImageSource.gallery, maxWidth: 800, maxHeight: 600);
    }else{
      return null;
    }
  }
}