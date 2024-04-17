import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/service/api_products/interfaces/interface_delete_data_product.dart';
import 'package:foosel/service/api_konstanta.dart';

class ApiDeleteProducts with SharedPref implements InterfaceDeleteDataProduct{
  late bool loading = true;
  late String? tokens;

  @override
  Future<String> deleteDataProduct({
    bool testing = false,
    String testingTokenPenjual = "",
    required String idProduct,
    required String image,
  }) async{
    try {
      if(testing == false){
        await sharedPref();
        tokens = prefs.getString('token').toString();
      }else{
        tokens = testingTokenPenjual;
      }
      Map<String, String> parameterApi = {
        'token_id' : idProduct,
        'url_image' : image,
        'unit_test' : testing.toString(),
      };
      String? parameterString = await Uri(queryParameters: parameterApi).query;
      final responseDeleteProducts = await Api.client.delete(
        Uri.parse('${Api.baseURL}/deleteProductDetail?' + parameterString),
        headers: {
          'Authorization': 'Bearer $tokens',
          'Content-Type': 'application/json; charset=UTF-8',
        }
      ).timeout(const Duration(seconds: 10));
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
  bool loadingDeleteDataProduct() {
    return loading;
  }
}