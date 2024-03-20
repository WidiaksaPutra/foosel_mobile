import 'package:foosel/service/api_transaksi/interfaces/interface_post_transaksi.dart';
import 'package:foosel/service/api_transaksi/injection_transaksi.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../default_test/data_dummy_test.dart';

void main(){
  test("Unit Test Service Post Transaksi", () async{
    setupDInjectionTransaksi();
    final InterfacePostTransaksi dataInsertTransaksi = getItInstance<InterfacePostTransaksi>();
    final respons = await dataInsertTransaksi.postTransaksi(
      testing: true,
      testingToken: tokenUserPembeli,
      categoryId: idCategory, 
      productsId: idProducts, 
      quantity: quantity, 
      shippingPrice: shippingPrice, 
      status: status, 
      total: total,
      totalPrice: totalPrice, 
      usersEmailPembeli: emailPembeli, 
      usersEmailPenjual: emailPenjual,
    );
    expect(respons, equals("berhasil"));
  });
}