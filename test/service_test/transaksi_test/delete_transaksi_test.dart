import 'package:foosel/interface/interface_local/service/interface_delete_transaksi.dart';
import 'package:foosel/service/api_products/injection_product.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../default_test/data_dummy_test.dart';

void main(){
  group("Unit Test Service Delete Transaksi", () {
    setupDInjectionProduct();
    final interfaceDeleteTransaksi dataDeleteTransaksi = getItInstance<interfaceDeleteTransaksi>();
    test("Unit Test Service Delete Transaksi Products", () async{  
      final dataTransaksiProduct = await dataDeleteTransaksi.DeleteTransaksi(
        testing: true,
        productsId: idProducts,
      );
      expect(dataTransaksiProduct, equals("berhasil"));
    });
    test("Unit Test Service Delete Transaksi Transaksi", () async{
      final dataTransaksi = await dataDeleteTransaksi.DeleteTransaksi(
        testing: true,
        transactionsId: idTransaksi,
      );
      expect(dataTransaksi, equals("berhasil"));
    });
  });
}