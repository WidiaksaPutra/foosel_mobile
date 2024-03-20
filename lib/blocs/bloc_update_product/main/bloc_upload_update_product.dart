// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:foosel/blocs/bloc_default/event/event_form_products.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/blocs/bloc_update_product/event_update_barang.dart';
import 'package:foosel/blocs/bloc_update_product/interfaces_update_products.dart';
import 'package:foosel/blocs/bloc_update_product/state_update_barang.dart';
import 'package:foosel/service/api_products/interfaces/interface_update_data_product.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

late BuildContext context1;
class BlocUploadUpdateProduct extends Bloc<DataEventUpdateBarang, StateUpdateBarang> with SharedPref implements InterfacesButtonUpdateProduct{
  final InterfaceUpdateDataProduct updateDataProduct = getItInstance<InterfaceUpdateDataProduct>();
  BlocUploadUpdateProduct() : super(UpdateBarang(loading: false, snackBar: false, responApi: '-')){
    on<ButtonFormProducts>((event, emit) async{
      buttonUploadProduct(
        tokenId: event.tokenId,
        nameProduct: event.nameProduct,
        price: event.price,
        description: event.description,
        type: event.type,
        image: event.image,
        images: event.images, 
        oldImage: event.oldImage,
        context: event.context,
      );
    });
  }

  @override
  buttonUploadProduct({
    required String tokenId,
    required String nameProduct, 
    required String price, 
    required String description, 
    required XFile? image, 
    required List images, 
    required String type,
    required String oldImage,
    required BuildContext context,
  }) async {
    emit(UpdateBarang(loading: true, snackBar: false, responApi: '-'));
    await sharedPref();
    String responUpdateProducts = await updateDataProduct.updateDataProduct(
      tokenId: tokenId,
      email: prefs.getString('email').toString(),
      description: description, 
      name: nameProduct,
      price: price,
      oldImage: oldImage,
      image: image,
      images: images,
      type: type,
    );
    if(responUpdateProducts == "berhasil"){
      emit(UpdateBarang(loading: false, snackBar: true, responApi: responUpdateProducts));
      prefs.remove('namaProduct');
      prefs.remove('deskripsi');
      prefs.remove('price');
      prefs.remove('typeProduct');
      prefs.remove('indexDropdown');
      prefs.remove('tokenId');
      prefs.remove('oldImage');
    }else{
      emit(UpdateBarang(loading: false, snackBar: true, responApi: responUpdateProducts));
    }
  }
}