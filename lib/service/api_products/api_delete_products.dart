import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_delete_data_product.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_konstanta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class apiDeleteProducts implements interfaceDeleteDataProduct{
  late bool loading = true;

  @override
  DeleteDataProduct({
    required String idProduct,
    required String image,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      SharedPreferences token = await SharedPreferences.getInstance();
      late String? tokens = token.getString("token")!;
      Map<String, String> parameterApi = {
        'token_id' : idProduct,
        'url_image' : image,
      };
      String? parameterString = await Uri(queryParameters: parameterApi).query;
      final responseDeleteProducts = await Api.client.delete(
        Uri.parse('${Api.baseURL}/deleteProductDetail?' + parameterString),
        headers: {
          'Authorization': 'Bearer $tokens',
          'Content-Type': 'application/json; charset=UTF-8',
        }
      );
      if(responseDeleteProducts.statusCode == 200){
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
  bool LoadingDeleteDataProduct() {
    return loading;
  }
}