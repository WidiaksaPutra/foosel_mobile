import 'package:foosel/service/api_transaksi/interfaces/interface_get_transaksi.dart';
import 'package:foosel/service/api_transaksi/injection_transaksi.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../default_test/data_dummy_test.dart';

void main(){
  group("Unit Test Service Get Transaksi", () { 
    setupDInjectionTransaksi();
    final InterfaceGetTransaksi dataGetTransaksi = getItInstance<InterfaceGetTransaksi>();
    test("Unit Test Service Get Data Transaksi Penjual", () async{
      final data = await dataGetTransaksi.getTransaksi(
        testing: true,
        testingToken: tokenUserPenjual,
        email: emailPenjual,
      );
      expect(data, equals("berhasil"));
    });
    test("Unit Test Service Get Data Transaksi Pembeli", () async{
      final data = await dataGetTransaksi.getTransaksi(
        testing: true,
        testingToken: tokenUserPembeli,
        email: emailPembeli,
      );
      expect(data, equals("berhasil"));
    });
    test("Unit Test Service Get Data Transaksi Role Pembeli", () async{
      Map<String, String> headers = {
        'Authorization': 'Bearer $tokenUserPembeli',
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final data = await dataGetTransaksi.rolePembeli(
        headers: headers,
        testing: true,
        email: emailPembeli,
      );
      expect(data, equals("berhasil"));
    });
    test("Unit Test Service Get Data Transaksi Role Penjual", () async{
      Map<String, String> headers = {
        'Authorization': 'Bearer $tokenUserPenjual',
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final data = await dataGetTransaksi.rolePenjual(
        headers: headers,
        testing: true,
        email: emailPenjual,
      );
      expect(data, equals("berhasil"));
    });
    test("Unit Test Service Get Data Transaksi Users Pembeli", () async{
      Map<String, String> headers = {
        'Authorization': 'Bearer $tokenUserPembeli',
        'Content-Type': 'application/json; charset=UTF-8',
      };
      Map<String, String> parameterApi = {
        'email_pembeli' : emailPembeli,
      };
      final data = await dataGetTransaksi.getDataTransaksi(
        testing: true, 
        headers: headers, 
        link: 'fetchTransaksiPembeli',
        parameterApi: parameterApi,
      );
      expect(data, equals("berhasil"));
    });
    test("Unit Test Service Get Data Transaksi Users Penjual", () async{
      Map<String, String> headers = {
        'Authorization': 'Bearer $tokenUserPenjual',
        'Content-Type': 'application/json; charset=UTF-8',
      };
      Map<String, String> parameterApi = {
        'email_penjual' : emailPenjual,
      };
      final data = await dataGetTransaksi.getDataTransaksi(
        testing: true, 
        headers: headers, 
        link: 'fetchTransaksiPenjual',
        parameterApi: parameterApi,
      );
      expect(data, equals("berhasil"));
    });
  });
}