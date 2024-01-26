import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_update_data_product.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_konstanta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class apiUpdateProducts implements interfaceUpdateDataProduct{
  late bool loading = true;
  
  @override
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
  }) async{
    try {
      await Future.delayed(const Duration(milliseconds: 3000));
      SharedPreferences token = await SharedPreferences.getInstance();
      late String? tokens = token.getString("token")!;
      final mineTypeData = lookupMimeType(image!.path, headerBytes: [0xFF, 0xD8]);
      final productPost = http.MultipartRequest('POST', Uri.parse('${Api.baseURL}/updateProduct?'));
      final imageFile = await http.MultipartFile.fromPath('image', image.path, contentType: MediaType(mineTypeData![0], mineTypeData[1])); 
      for(var img in images){
        final minesTypeData = lookupMimeType(img.path, headerBytes: [0xFF, 0xD8]);
        productPost.files.add(await http.MultipartFile.fromPath('images[]', img.path, contentType: MediaType(minesTypeData![0], minesTypeData[1])));
      }
      String dataPrice = price.replaceAll(",", "").split('.')[0];
      productPost.files.add(imageFile);
      productPost.fields['token_id'] = tokenId;
      productPost.fields['email'] = email;
      productPost.fields['name'] = name;
      productPost.fields['price'] = dataPrice;
      productPost.fields['type'] = type;
      productPost.fields['description'] = description;
      productPost.fields['oldImage'] = oldImage;
      Map<String, String> headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokens',
        'Content-Type': 'application/json; charset=UTF-8',
      };
      productPost.headers.addAll(headers);
      final streamResponse = await productPost.send();
      final response = await http.Response.fromStream(streamResponse);
      if(response.statusCode == 200){
        loading = false;
        return "berhasil";
      }else{
        return "gagal";
      }
    } catch (e) {
      return "error";
    }    
  }

  @override
  bool LoadingUpdateDataProduct() {
    return loading;
  }
}