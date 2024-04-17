import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_delete_product/interface_delete_product.dart';
import 'package:foosel/blocs/bloc_delete_product/state_delete_product.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_delete_data_product_transaksi_local.dart';
import 'package:foosel/helpers/transaksi/interfaces/interface_delete_data_transaksi_local.dart';
import 'package:foosel/helpers/like/interfaces/interface_get_data_like_local.dart';
import 'package:foosel/service/api_products/interfaces/interface_delete_data_product.dart';
import 'package:foosel/service/api_transaksi/interfaces/interface_delete_transaksi.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class CubitDeleteProduct extends Cubit<StateDeleteProduct> implements InterfaceDeleteProduct{
  final InterfaceDeleteDataProduct _dataDeleteProduct = getItInstance<InterfaceDeleteDataProduct>();
  final InterfaceDeleteTransaksi _dataDeleteTransaksi = getItInstance<InterfaceDeleteTransaksi>();
  final InterfaceDeleteDataProductTransaksiLocal _dataDeleteProductTransaksiLocal = getItInstance<InterfaceDeleteDataProductTransaksiLocal>();
  final InterfaceDeleteDataTransaksiLocal _dataDeleteTransaksiLocal = getItInstance<InterfaceDeleteDataTransaksiLocal>();
  final InterfaceGetDataLikeLocal _dataGetLike = getItInstance<InterfaceGetDataLikeLocal>();
  CubitDeleteProduct() : super(DeleteProduct(loadingDeleteProduct: false, statusAlert: '-'));

  @override
  Future<void> deleteDataProduct({
    required String idProduct, 
    required String image,
  }) async{
    emit(DeleteProduct(loadingDeleteProduct: true, statusAlert: '-'));
    String _statusApiProduct = await _dataDeleteProduct.deleteDataProduct(idProduct: idProduct, image: image); 
    bool _loadingDeleteProduct = await _dataDeleteProduct.loadingDeleteDataProduct();
    await _dataDeleteTransaksi.deleteTransaksi(productsId: idProduct);
    bool _loadingDeleteTransaksi = await _dataDeleteTransaksi.loadingDeleteDataTransaksi();
    if(_loadingDeleteProduct == false && _loadingDeleteTransaksi == false){
      await _dataDeleteTransaksiLocal.deleteDataTransaksiLocalWhereId(tokenId: idProduct);
      await _dataDeleteProductTransaksiLocal.deleteDataProductTransaksiWhereIdProduct(tokenProduct: idProduct);
      await _dataGetLike.getDataLikeWhereIdLocal(tokenId: idProduct);
      emit(DeleteProduct(loadingDeleteProduct: _loadingDeleteProduct, statusAlert: _statusApiProduct));
    }
  }
}