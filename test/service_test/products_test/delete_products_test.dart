import 'package:foosel/interface/interface_local/service/interface_delete_data_product.dart';
import 'package:foosel/service/api_products/injection_product.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../default_test/data_dummy_test.dart';

void main(){
  test("Unit Test Service Delete Product", () async{
    setupDInjectionProduct();
    final interfaceDeleteDataProduct dataDeleteProduct = await getItInstance<interfaceDeleteDataProduct>();
    final data = await dataDeleteProduct.DeleteDataProduct(
      testing: true,
      testingTokenPenjual: tokenUserPenjual,
      idProduct: idProducts, 
      image: urlProducts,
    );
    expect(data, equals("berhasil"));
  });
}