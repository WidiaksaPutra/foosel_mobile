// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_add_product/event_add_barang.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_add_product/interfaces_add_products.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_add_product/state_add_barang.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/event_default/event_form_products.dart';
import 'package:flutter_laravel_toko_sepatu/blocs/bloc_default/default/default_shared_pref.dart';
import 'package:flutter_laravel_toko_sepatu/interface/interface_local/service/interface_post_data_product.dart';
import 'package:flutter_laravel_toko_sepatu/service/api_products/api_post_products.dart';
import 'package:flutter_laravel_toko_sepatu/shared/theme_global_variabel.dart';
import 'package:image_picker/image_picker.dart';

late BuildContext context1;
class BlocUploadInsertProduct extends Bloc<DataEventAddBarang, StateAddPostBarang> with interfacesButtonUploadProduct, apiPostProducts, defaultSharedPref{
  final interfacePostDataProduct postDataProduct = getItInstance<interfacePostDataProduct>();
  BlocUploadInsertProduct() : super(AddPostBarang(loading: false, snackBar: false, responApi: '-')){
    on<ButtonFormProducts>((event, emit) async{
      ButtonUploadProduct(
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
  ButtonUploadProduct({
    required String nameProduct, 
    required String price, 
    required String description, 
    required XFile? image, 
    required List images, 
    required String type, 
    required BuildContext context,
  }) async {
    print("test type product $type");
    emit(AddPostBarang(loading: true, snackBar: false, responApi: '-'));
    await sharedPref();
    String responPostProducts = await postDataProduct.PostDataProduct(
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