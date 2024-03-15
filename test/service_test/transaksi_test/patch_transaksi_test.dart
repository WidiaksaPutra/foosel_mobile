import 'package:foosel/interface/interface_local/service/interface_patch_transaksi.dart';
import 'package:foosel/service/api_transaksi/injection_transaksi.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../default_test/data_dummy_test.dart';

void main(){
  test("Unit Test Service Patch Transaksi", () async{
    setupDInjectionTransaksi();
    final interfacePatchTransaksi dataPatchTransaksi = await getItInstance<interfacePatchTransaksi>();
    final data = await dataPatchTransaksi.PatchTransaksi(
      testing: true,
      testingToken: tokenUserPenjual,
      transactionsId: idTransaksi, 
      status: 'approved',
    );
    expect(data, equals("berhasil"));
  });
}