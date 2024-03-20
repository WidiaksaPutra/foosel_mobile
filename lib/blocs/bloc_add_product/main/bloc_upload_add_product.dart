// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_add_product/event_add_barang.dart';
import 'package:foosel/blocs/bloc_add_product/interfaces_add_products.dart';
import 'package:foosel/blocs/bloc_add_product/state_add_barang.dart';
import 'package:foosel/blocs/bloc_default/event/event_form_products.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/service/api_products/interfaces/interface_post_data_product.dart';
import 'package:foosel/shared/theme_global_variabel.dart';
import 'package:image_picker/image_picker.dart';

late BuildContext context1;
class BlocUploadInsertProduct extends Bloc<DataEventAddBarang, StateAddPostBarang> with SharedPref implements InterfacesButtonUploadProduct{
  final InterfacePostDataProduct postDataProduct = getItInstance<InterfacePostDataProduct>();
  BlocUploadInsertProduct() : super(AddPostBarang(loading: false, snackBar: false, responApi: '-')){
    on<ButtonFormProducts>((event, emit) async{
      buttonUploadProduct(
        nameProduct: event.nameProduct,
        price: event.price,
        description: event.description,
        type: event.type,
        image: event.image,
        images: event.images, 
        context: event.context,
      );
    });
  }

  @override
  buttonUploadProduct({
    required String nameProduct, 
    required String price, 
    required String description, 
    required XFile? image, 
    required List images, 
    required String type, 
    required BuildContext context,
  }) async {
    emit(AddPostBarang(loading: true, snackBar: false, responApi: '-'));
    await sharedPref();
    String responPostProducts = await postDataProduct.postDataProduct(
      email: prefs.getString('email').toString(),
      description: description, 
      name: nameProduct,
      price: price,
      image: image,
      images: images,
      type: type,
    );
    if(responPostProducts == "berhasil"){
      emit(AddPostBarang(loading: false, snackBar: true, responApi: responPostProducts));
      prefs.remove('namaProduct');
      prefs.remove('deskripsi');
      prefs.remove('price');
      prefs.remove('typeProduct');
      prefs.remove('indexDropdown');
    }else{
      emit(AddPostBarang(loading: false, snackBar: true, responApi: responPostProducts));
    }
  }
}