import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_delete_product/interface_delete_product.dart';
import 'package:foosel/blocs/bloc_delete_product/state_delete_product.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_delete_data_product_transaksi_local.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_delete_data_transaksi_local.dart';
import 'package:foosel/helpers/like/interfaces/interface_get_data_like_local.dart';
import 'package:foosel/service/api_products/interfaces/interface_delete_data_product.dart';
import 'package:foosel/service/api_transaksi/interfaces/interface_delete_transaksi.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class CubitDeleteProduct extends Cubit<StateDeleteProduct> with InterfaceDeleteProduct{
  final InterfaceDeleteDataProduct dataDeleteProduct = getItInstance<InterfaceDeleteDataProduct>();
  final InterfaceDeleteTransaksi dataDeleteTransaksi = getItInstance<InterfaceDeleteTransaksi>();
  final InterfaceDeleteDataProductTransaksiLocal dataDeleteProductTransaksiLocal = getItInstance<InterfaceDeleteDataProductTransaksiLocal>();
  final InterfaceDeleteDataTransaksiLocal dataDeleteTransaksiLocal = getItInstance<InterfaceDeleteDataTransaksiLocal>();
  final InterfaceGetDataLikeLocal dataGetLike = getItInstance<InterfaceGetDataLikeLocal>();
  CubitDeleteProduct() : super(DeleteProduct(loadingDeleteProduct: false, statusAlert: '-'));

  @override
  deleteDataProduct({
    required String idProduct, 
    required String image,
  }) async {
    emit(DeleteProduct(loadingDeleteProduct: true, statusAlert: '-'));
    String statusApiProduct = await dataDeleteProduct.deleteDataProduct(idProduct: idProduct, image: image); 
    bool loadingDeleteProduct = await dataDeleteProduct.loadingDeleteDataProduct();
    await dataDeleteTransaksi.deleteTransaksi(productsId: idProduct);
    bool loadingDeleteTransaksi = await dataDeleteTransaksi.loadingDeleteDataTransaksi();
    if(loadingDeleteProduct == false && loadingDeleteTransaksi == false){
      await dataDeleteTransaksiLocal.deleteDataTransaksiLocalWhereId(tokenId: idProduct);
      await dataDeleteProductTransaksiLocal.deleteDataProductTransaksiWhereIdProduct(tokenProduct: idProduct);
      await dataGetLike.getDataLikeWhereIdLocal(tokenId: idProduct);
      emit(DeleteProduct(loadingDeleteProduct: loadingDeleteProduct, statusAlert: statusApiProduct));
    }
  }
}