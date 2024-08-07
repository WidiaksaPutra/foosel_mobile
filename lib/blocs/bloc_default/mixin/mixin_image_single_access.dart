import 'package:image_picker/image_picker.dart';

mixin ImageSingleAccess{
  Future imageSingle({
    required String namaProduct,
    required String deskripsi,
    required String price,
    required String typeProduct,
  }) async{
    final ImagePicker _imagePicker = ImagePicker();
    if(namaProduct != 'null' 
    && deskripsi != 'null'
    && deskripsi.length < 255
    && price != 'null'
    && price != '0.00'
    && typeProduct != "All Product"
    && typeProduct != 'null'
    && price.length <= 16){
      return await _imagePicker.pickImage(source: ImageSource.gallery, maxWidth: 800, maxHeight: 600);
    }else{
      return null;
    }
  }
}