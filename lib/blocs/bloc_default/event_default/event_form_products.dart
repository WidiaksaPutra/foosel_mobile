import 'package:flutter/material.dart';
import 'package:foosel/blocs/bloc_add_product/event_add_barang.dart';
import 'package:foosel/blocs/bloc_update_product/event_update_barang.dart';
import 'package:image_picker/image_picker.dart';

class ButtonFormProducts with DataEventAddBarang, DataEventUpdateBarang{         
  late String nameProduct, description, price, type, tokenId, oldImage;
  final BuildContext context;
  late XFile? image;
  late List images;
  ButtonFormProducts(
    {
      required this.tokenId,
      required this.oldImage,
      required this.nameProduct,
      required this.description,
      required this.price,
      required this.image,
      required this.images,
      required this.type,
      required this.context,
    }
  ){
    if(nameProduct == "null"){
      nameProduct = "";
    }
    if(description == "null"){
      description = "";
    }
    if(price == "null" || price == "0.00"){
      price = "";
    }
    if(type == "null" || type == "All Product"){
      type = "";
    }
  }
}