import 'package:foosel/service/api_products/interfaces/interface_delete_data_product.dart';
import 'package:foosel/service/api_products/injection_product.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../default_test/data_dummy_test.dart';

void main(){
  test("Unit Test Service Delete Product", () async{
    setupDInjectionProduct();
    final InterfaceDeleteDataProduct dataDeleteProduct = await getItInstance<InterfaceDeleteDataProduct>();
    final data = await dataDeleteProduct.deleteDataProduct(
      testing: true,
      testingTokenPenjual: tokenUserPenjual,
      idProduct: idProducts, 
      image: urlProducts,
    );
    expect(data, equals("berhasil"));
  });
}