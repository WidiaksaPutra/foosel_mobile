import 'package:foosel/interface/interface_local/service/interface_update_data_product.dart';
import 'package:foosel/service/api_products/injection_product.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import '../../default_test/data_dummy_test.dart';
void main(){
  test("Unit Test Service Update Products", () async{
    setupDInjectionProduct();
    final interfaceUpdateDataProduct updateDataProduct = await getItInstance<interfaceUpdateDataProduct>();
    final respons = await updateDataProduct.UpdateDataProduct(
      testing: true,
      testingTokenPenjual: tokenUserPenjual,
      tokenId: idProducts,
      description: randomText,
      email: emailPenjual,
      image: XFile(""),
      oldImage:idImagesOld,
      images: [],
      name: randomText,
      price: randomText,
      type: randomText,  
    );
    expect(respons, equals("berhasil"));
  });
}