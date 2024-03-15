import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_delete_product/interface_delete_product.dart';
import 'package:foosel/blocs/bloc_delete_product/state_delete_product.dart';
import 'package:foosel/interface/interface_local/helpers/interface_delete_data_product_transaksi_storage_local.dart';
import 'package:foosel/interface/interface_local/helpers/interface_delete_data_transaksi_local.dart';
import 'package:foosel/interface/interface_local/helpers/interface_get_data_like_local.dart';
import 'package:foosel/interface/interface_local/service/interface_delete_data_product.dart';
import 'package:foosel/interface/interface_local/service/interface_delete_transaksi.dart';
import 'package:foosel/shared/theme_global_variabel.dart';

class cubitDeleteProduct extends Cubit<StateDeleteProduct> with interfaceDeleteProduct{
  final interfaceDeleteDataProduct dataDeleteProduct = getItInstance<interfaceDeleteDataProduct>();
  final interfaceDeleteTransaksi dataDeleteTransaksi = getItInstance<interfaceDeleteTransaksi>();
  final interfaceDeleteDataProductTransaksiStorageLocal dataDeleteProductTransaksiLocal = getItInstance<interfaceDeleteDataProductTransaksiStorageLocal>();
  final interfaceDeleteDataTransaksiLocal dataDeleteTransaksiLocal = getItInstance<interfaceDeleteDataTransaksiLocal>();
  final interfaceGetDataLikeLocal dataGetLike = getItInstance<interfaceGetDataLikeLocal>();
  cubitDeleteProduct() : super(DeleteProduct(loadingDeleteProduct: false, statusAlert: '-'));

  @override
  DeleteDataProduct({
    required String idProduct, 
    required String image,
  }) async {
    emit(DeleteProduct(loadingDeleteProduct: true, statusAlert: '-'));
    String statusApiProduct = await dataDeleteProduct.DeleteDataProduct(idProduct: idProduct, image: image); 
    bool loadingDeleteProduct = await dataDeleteProduct.LoadingDeleteDataProduct();
    await dataDeleteTransaksi.DeleteTransaksi(productsId: idProduct);
    bool loadingDeleteTransaksi = await dataDeleteTransaksi.LoadingDeleteDataTransaksi();
    if(loadingDeleteProduct == false && loadingDeleteTransaksi == false){
      await dataDeleteTransaksiLocal.DeleteDataTransaksiLocalWhereId(tokenId: idProduct);
      await dataDeleteProductTransaksiLocal.DeleteDataProductTransaksiWhereIdProduct(tokenProduct: idProduct);
      await dataGetLike.GetDataLikeWhereIdLocal(tokenId: idProduct);
      emit(DeleteProduct(loadingDeleteProduct: loadingDeleteProduct, statusAlert: statusApiProduct));
    }
  }
}