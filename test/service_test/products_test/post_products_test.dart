import 'package:foosel/service/api_products/interfaces/interface_post_data_product.dart';
import 'package:foosel/service/api_products/injection_product.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import '../../default_test/data_dummy_test.dart';
void main(){
  test("Unit Test Service Post Products", () async{
    setupDInjectionProduct();
    final InterfacePostDataProduct postDataProduct = await getItInstance<InterfacePostDataProduct>();
    final respons = await postDataProduct.postDataProduct(
      testing: true,
      testingTokenPenjual: tokenUserPenjual,
      description: randomText,
      email: emailPenjual,
      image: XFile(""),
      images: [],
      name: randomText,
      price: randomText,
      type: randomText,
    );
    expect(respons, equals("berhasil"));
  });
}