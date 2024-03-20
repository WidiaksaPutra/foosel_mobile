import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/service/api_products/interfaces/interface_post_data_product.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:foosel/service/api_konstanta.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class ApiPostProducts with SharedPref implements InterfacePostDataProduct{
  late String tokens;

  @override
  postDataProduct({
    bool testing = false,
    String testingTokenPenjual = "",
    required String email, 
    required String name, 
    required String price, 
    required String description, 
    required XFile? image, 
    required List images, 
    required String type,
  }) async {
    try {
      if(testing == false){
        await sharedPref();
        tokens = prefs.getString('token').toString();
      }else{
        tokens = testingTokenPenjual;
      }
      final productPost = await http.MultipartRequest('POST', Uri.parse('${Api.baseURL}/insertProduct?'));
      for(dynamic img in images){
        final minesTypeData = await lookupMimeType(img.path, headerBytes: [0xFF, 0xD8]);
        productPost.files.add(await http.MultipartFile.fromPath('images[]', img.path, contentType: MediaType(minesTypeData![0], minesTypeData[1])));
      }
      if(testing == false){
        final mineTypeData = await lookupMimeType(image!.path, headerBytes: [0xFF, 0xD8]);
        final imageFile = await http.MultipartFile.fromPath('image', image.path, contentType: MediaType(mineTypeData![0], mineTypeData[1])).timeout(const Duration(seconds: 10)); 
        productPost.files.add(imageFile);
      }
      String dataPrice = price.replaceAll(",", "").split('.')[0];
      productPost.fields['unit_test'] = testing.toString();
      productPost.fields['email'] = email;
      productPost.fields['name'] = name;
      productPost.fields['price'] = dataPrice;
      productPost.fields['type'] = type;
      productPost.fields['description'] = description;
      Map<String, String> headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokens',
        'Content-Type': 'application/json; charset=UTF-8',
      };
      productPost.headers.addAll(headers);
      final streamResponse = await productPost.send().timeout(const Duration(seconds: 10));
      final response = await http.Response.fromStream(streamResponse).timeout(const Duration(seconds: 10));
      return (response.statusCode == 200) ? "berhasil" : "gagal";
    } catch (e) {
      return "error";
    }
  }
}