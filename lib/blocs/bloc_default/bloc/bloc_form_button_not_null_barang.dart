// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/event/event_form_products.dart';
import 'package:foosel/blocs/bloc_default/interfaces/interfaces_form_button_not_null_barang.dart';
import 'package:foosel/blocs/bloc_default/state/state_form_button_not_null_barang.dart';
import 'package:foosel/blocs/bloc_default/state/state_multipe_form.dart';
import 'package:foosel/shared/theme_konstanta.dart';

class BlocFormButtonNotNullBarang extends Bloc<ButtonFormProducts, DataStateMultiFormProduct> implements InterfacesFormButtonNotNullBarang{
  BlocFormButtonNotNullBarang() : super(DataStateInitialFormProduct()){
    on<ButtonFormProducts>((event, emit) async{
      await formButtonNotNullBarang(
        nameProduct: event.nameProduct,
        price: event.price,
        description: event.description,
        type: event.type,
      );
    });
  }
  
  @override
  formButtonNotNullBarang({
    required String nameProduct, 
    required String price, 
    required String description, 
    required String type,
  }) {
    emit(DataStateFormButtonNotNullBarang(
      formVisibleNameProduct: false, 
      formVisiblePrice: false,
      formVisibleDescription: false,
      formVisibleType: false,
      formLengthVisiblePrice: false,
      messageNameProduct: '',
      messagePrice: '',
      messageDescription: '',
      messageType: '',
      lengthPriceMessage: '',
    ));
    if(nameProduct == "" && price == "" && (description == "" || description.length >= 255) && type == "" && price.length > 16){
      emit(DataStateFormButtonNotNullBarang(
        formVisibleNameProduct: true, 
        formVisiblePrice: true,
        formVisibleDescription: true,
        formVisibleType: true,
        formLengthVisiblePrice: true,
        messageNameProduct: nameProductKosong,
        messagePrice: priceProductKosong,
        messageDescription: descriptionProduct,
        messageType: typeProductKosong,
        lengthPriceMessage: priceProductLebih,
      ));
    }
    else if(nameProduct == "" && price != "" && (description != "" && description.length < 255) && type == "" && price.length > 16){
      emit(DataStateFormButtonNotNullBarang(
        formVisibleNameProduct: true, 
        formVisiblePrice: false,
        formVisibleDescription: false,
        formVisibleType: true,
        formLengthVisiblePrice: true,
        messageNameProduct: nameProductKosong,
        messagePrice: '',
        messageDescription: '',
        messageType: typeProductKosong,
        lengthPriceMessage: priceProductLebih,
      ));
    }
    else if(nameProduct == "" && price == "" && (description != "" && description.length < 255) && type == "" && price.length > 16){
      emit(DataStateFormButtonNotNullBarang(
        formVisibleNameProduct: true, 
        formVisiblePrice: true,
        formVisibleDescription: false,
        formVisibleType: true,
        formLengthVisiblePrice: true,
        messageNameProduct: nameProductKosong,
        messagePrice: priceProductKosong,
        messageDescription: '',
        messageType: typeProductKosong,
        lengthPriceMessage: priceProductLebih,
      ));
    }
    else if(nameProduct != "" && price == "" && (description == "" || description.length >= 255) && type == "" && price.length > 16){
      emit(DataStateFormButtonNotNullBarang(
        formVisibleNameProduct: false, 
        formVisiblePrice: true,
        formVisibleDescription: true,
        formVisibleType: true,
        formLengthVisiblePrice: true,
        messageNameProduct: '',
        messagePrice: priceProductKosong,
        messageDescription: descriptionProduct,
        messageType: typeProductKosong,
        lengthPriceMessage: priceProductLebih,
      ));
    }
    else if(nameProduct == "" && price != "" && (description == "" || description.length >= 255) && type == "" && price.length > 16){
      emit(DataStateFormButtonNotNullBarang(
        formVisibleNameProduct: true, 
        formVisiblePrice: false,
        formVisibleDescription: true,
        formVisibleType: true,
        formLengthVisiblePrice: true,
        messageNameProduct: nameProductKosong,
        messagePrice: '',
        messageDescription: descriptionProduct,
        messageType: typeProductKosong,
        lengthPriceMessage: priceProductLebih,
      ));
    }
    else if(nameProduct != "" && price != "" && (description == "" || description.length >= 255) && type == "" && price.length > 16){
      emit(DataStateFormButtonNotNullBarang(
        formVisibleNameProduct: false, 
        formVisiblePrice: false,
        formVisibleDescription: true,
        formVisibleType: true,
        formLengthVisiblePrice: true,
        messageNameProduct: '',
        messagePrice: '',
        messageDescription: descriptionProduct,
        messageType: typeProductKosong,
        lengthPriceMessage: priceProductLebih,
      ));
    }
    else if(nameProduct != "" && price == "" && (description != "" && description.length < 255) && type == "" && price.length > 16){
      emit(DataStateFormButtonNotNullBarang(
        formVisibleNameProduct: false, 
        formVisiblePrice: true,
        formVisibleDescription: false,
        formVisibleType: true,
        formLengthVisiblePrice: true,
        messageNameProduct: '',
        messagePrice: priceProductKosong,
        messageDescription: '',
        messageType: typeProductKosong,
        lengthPriceMessage: priceProductLebih,
      ));
    }
    else if(nameProduct != "" && price != "" && (description != "" && description.length < 255) && type == "" && price.length > 16){
      emit(DataStateFormButtonNotNullBarang(
        formVisibleNameProduct: false, 
        formVisiblePrice: false,
        formVisibleDescription: false,
        formVisibleType: true,
        formLengthVisiblePrice: true,
        messageNameProduct: '',
        messagePrice: '',
        messageDescription: '',
        messageType: typeProductKosong,
        lengthPriceMessage: priceProductLebih,
      ));
    }
    else if(nameProduct == "" && price == "" && (description == "" || description.length >= 255) && type != "" && price.length > 16){
      emit(DataStateFormButtonNotNullBarang(
        formVisibleNameProduct: true, 
        formVisiblePrice: true,
        formVisibleDescription: true,
        formVisibleType: false,
        formLengthVisiblePrice: true,
        messageNameProduct: nameProductKosong,
        messagePrice: priceProductKosong,
        messageDescription: descriptionProduct,
        messageType: '',
        lengthPriceMessage: priceProductLebih,
      ));
    }
    else if(nameProduct == "" && price != "" && (description != "" && description.length < 255) && type != "" && price.length > 16){
      emit(DataStateFormButtonNotNullBarang(
        formVisibleNameProduct: true, 
        formVisiblePrice: false,
        formVisibleDescription: false,
        formVisibleType: false,
        formLengthVisiblePrice: true,
        messageNameProduct: nameProductKosong,
        messagePrice: '',
        messageDescription: '',
        messageType: '',
        lengthPriceMessage: priceProductLebih,
      ));
    }
    else if(nameProduct == "" && price == "" && (description != "" && description.length < 255) && type != "" && price.length > 16){
      emit(DataStateFormButtonNotNullBarang(
        formVisibleNameProduct: true, 
        formVisiblePrice: true,
        formVisibleDescription: false,
        formVisibleType: false,
        formLengthVisiblePrice: true,
        messageNameProduct: nameProductKosong,
        messagePrice: priceProductKosong,
        messageDescription: '',
        messageType: '',
        lengthPriceMessage: priceProductLebih,
      ));
    }
    else if(nameProduct != "" && price == "" && (description == "" || description.length >= 255) && type != "" && price.length > 16){
      emit(DataStateFormButtonNotNullBarang(
        formVisibleNameProduct: false, 
        formVisiblePrice: true,
        formVisibleDescription: true,
        formVisibleType: false,
        formLengthVisiblePrice: true,
        messageNameProduct: '',
        messagePrice: priceProductKosong,
        messageDescription: descriptionProduct,
        messageType: '',
        lengthPriceMessage: priceProductLebih,
      ));
    }
    else if(nameProduct == "" && price != "" && (description == "" || description.length >= 255) && type != "" && price.length > 16){
      emit(DataStateFormButtonNotNullBarang(
        formVisibleNameProduct: true, 
        formVisiblePrice: false,
        formVisibleDescription: true,
        formVisibleType: false,
        formLengthVisiblePrice: true,
        messageNameProduct: nameProductKosong,
        messagePrice: '',
        messageDescription: descriptionProduct,
        messageType: '',
        lengthPriceMessage: priceProductLebih,
      ));
    }
    else if(nameProduct != "" && price != "" && (description == "" || description.length >= 255) && type != "" && price.length > 16){
      emit(DataStateFormButtonNotNullBarang(
        formVisibleNameProduct: false, 
        formVisiblePrice: false,
        formVisibleDescription: true,
        formVisibleType: false,
        formLengthVisiblePrice: true,
        messageNameProduct: '',
        messagePrice: '',
        messageDescription: descriptionProduct,
        messageType: '',
        lengthPriceMessage: priceProductLebih,
      ));
    }
    else if(nameProduct != "" && price == "" && (description != "" && description.length < 255) && type != "" && price.length > 16){
      emit(DataStateFormButtonNotNullBarang(
        formVisibleNameProduct: false, 
        formVisiblePrice: true,
        formVisibleDescription: false,
        formVisibleType: false,
        formLengthVisiblePrice: true,
        messageNameProduct: '',
        messagePrice: priceProductKosong,
        messageDescription: '',
        messageType: '',
        lengthPriceMessage: priceProductLebih,
      ));
    }
    else if(nameProduct != "" && price != "" && (description != "" && description.length < 255) && type != "" && price.length > 16){
      emit(DataStateFormButtonNotNullBarang(
        formVisibleNameProduct: false, 
        formVisiblePrice: false,
        formVisibleDescription: false,
        formVisibleType: false,
        formLengthVisiblePrice: true,
        messageNameProduct: '',
        messagePrice: '',
        messageDescription: '',
        messageType: '',
        lengthPriceMessage: priceProductLebih,
      ));
    }
    else if(nameProduct == "" && price == "" && (description == "" || description.length >= 255) && type == "" && price.length <= 16){
      emit(DataStateFormButtonNotNullBarang(
        formVisibleNameProduct: true, 
        formVisiblePrice: true,
        formVisibleDescription: true,
        formVisibleType: true,
        formLengthVisiblePrice: false,
        messageNameProduct: nameProductKosong,
        messagePrice: priceProductKosong,
        messageDescription: descriptionProduct,
        messageType: typeProductKosong,
        lengthPriceMessage: '',
      ));
    }
    else if(nameProduct == "" && price != "" && (description != "" && description.length < 255) && type == "" && price.length <= 16){
      emit(DataStateFormButtonNotNullBarang(
        formVisibleNameProduct: true, 
        formVisiblePrice: false,
        formVisibleDescription: false,
        formVisibleType: true,
        formLengthVisiblePrice: false,
        messageNameProduct: nameProductKosong,
        messagePrice: '',
        messageDescription: '',
        messageType: typeProductKosong,
        lengthPriceMessage: '',
      ));
    }
    else if(nameProduct == "" && price == "" && (description != "" && description.length < 255) && type == "" && price.length <= 16){
      emit(DataStateFormButtonNotNullBarang(
        formVisibleNameProduct: true, 
        formVisiblePrice: true,
        formVisibleDescription: false,
        formVisibleType: true,
        formLengthVisiblePrice: false,
        messageNameProduct: nameProductKosong,
        messagePrice: priceProductKosong,
        messageDescription: '',
        messageType: typeProductKosong,
        lengthPriceMessage: '',
      ));
    }
    else if(nameProduct != "" && price == "" && (description == "" || description.length >= 255) && type == "" && price.length <= 16){
      emit(DataStateFormButtonNotNullBarang(
        formVisibleNameProduct: false, 
        formVisiblePrice: true,
        formVisibleDescription: true,
        formVisibleType: true,
        formLengthVisiblePrice: false,
        messageNameProduct: '',
        messagePrice: priceProductKosong,
        messageDescription: descriptionProduct,
        messageType: typeProductKosong,
        lengthPriceMessage: '',
      ));
    }
    else if(nameProduct == "" && price != "" && (description == "" || description.length >= 255) && type == "" && price.length <= 16){
      emit(DataStateFormButtonNotNullBarang(
        formVisibleNameProduct: true, 
        formVisiblePrice: false,
        formVisibleDescription: true,
        formVisibleType: true,
        formLengthVisiblePrice: false,
        messageNameProduct: nameProductKosong,
        messagePrice: '',
        messageDescription: descriptionProduct,
        messageType: typeProductKosong,
        lengthPriceMessage: '',
      ));
    }
    else if(nameProduct != "" && price != "" && (description == "" || description.length >= 255) && type == "" && price.length <= 16){
      emit(DataStateFormButtonNotNullBarang(
        formVisibleNameProduct: false, 
        formVisiblePrice: false,
        formVisibleDescription: true,
        formVisibleType: true,
        formLengthVisiblePrice: false,
        messageNameProduct: '',
        messagePrice: '',
        messageDescription: descriptionProduct,
        messageType: typeProductKosong,
        lengthPriceMessage: '',
      ));
    }
    else if(nameProduct != "" && price == "" && (description != "" && description.length < 255) && type == "" && price.length <= 16){
      emit(DataStateFormButtonNotNullBarang(
        formVisibleNameProduct: false, 
        formVisiblePrice: true,
        formVisibleDescription: false,
        formVisibleType: true,
        formLengthVisiblePrice: false,
        messageNameProduct: '',
        messagePrice: priceProductKosong,
        messageDescription: '',
        messageType: typeProductKosong,
        lengthPriceMessage: '',
      ));
    }
    else if(nameProduct != "" && price != "" && (description != "" && description.length < 255) && type == "" && price.length <= 16){
      emit(DataStateFormButtonNotNullBarang(
        formVisibleNameProduct: false, 
        formVisiblePrice: false,
        formVisibleDescription: false,
        formVisibleType: true,
        formLengthVisiblePrice: false,
        messageNameProduct: '',
        messagePrice: '',
        messageDescription: '',
        messageType: typeProductKosong,
        lengthPriceMessage: '',
      ));
    }
    else if(nameProduct == "" && price == "" && (description == "" || description.length >= 255) && type != "" && price.length <= 16){
      emit(DataStateFormButtonNotNullBarang(
        formVisibleNameProduct: true, 
        formVisiblePrice: true,
        formVisibleDescription: true,
        formVisibleType: false,
        formLengthVisiblePrice: false,
        messageNameProduct: nameProductKosong,
        messagePrice: priceProductKosong,
        messageDescription: descriptionProduct,
        messageType: '',
        lengthPriceMessage: '',
      ));
    }
    else if(nameProduct == "" && price != "" && (description != "" && description.length < 255) && type != "" && price.length <= 16){
      emit(DataStateFormButtonNotNullBarang(
        formVisibleNameProduct: true, 
        formVisiblePrice: false,
        formVisibleDescription: false,
        formVisibleType: false,
        formLengthVisiblePrice: false,
        messageNameProduct: nameProductKosong,
        messagePrice: '',
        messageDescription: '',
        messageType: '',
        lengthPriceMessage: '',
      ));
    }
    else if(nameProduct == "" && price == "" && (description != "" && description.length < 255) && type != "" && price.length <= 16){
      emit(DataStateFormButtonNotNullBarang(
        formVisibleNameProduct: true, 
        formVisiblePrice: true,
        formVisibleDescription: false,
        formVisibleType: false,
        formLengthVisiblePrice: false,
        messageNameProduct: nameProductKosong,
        messagePrice: priceProductKosong,
        messageDescription: '',
        messageType: '',
        lengthPriceMessage: '',
      ));
    }
    else if(nameProduct != "" && price == "" && (description == "" || description.length >= 255) && type != "" && price.length <= 16){
      emit(DataStateFormButtonNotNullBarang(
        formVisibleNameProduct: false, 
        formVisiblePrice: true,
        formVisibleDescription: true,
        formVisibleType: false,
        formLengthVisiblePrice: false,
        messageNameProduct: '',
        messagePrice: priceProductKosong,
        messageDescription: descriptionProduct,
        messageType: '',
        lengthPriceMessage: '',
      ));
    }
    else if(nameProduct == "" && price != "" && (description == "" || description.length >= 255) && type != "" && price.length <= 16){
      emit(DataStateFormButtonNotNullBarang(
        formVisibleNameProduct: true, 
        formVisiblePrice: false,
        formVisibleDescription: true,
        formVisibleType: false,
        formLengthVisiblePrice: false,
        messageNameProduct: nameProductKosong,
        messagePrice: '',
        messageDescription: descriptionProduct,
        messageType: '',
        lengthPriceMessage: '',
      ));
    }
    else if(nameProduct != "" && price != "" && (description == "" || description.length >= 255) && type != "" && price.length <= 16){
      emit(DataStateFormButtonNotNullBarang(
        formVisibleNameProduct: false, 
        formVisiblePrice: false,
        formVisibleDescription: true,
        formVisibleType: false,
        formLengthVisiblePrice: false,
        messageNameProduct: '',
        messagePrice: '',
        messageDescription: descriptionProduct,
        messageType: '',
        lengthPriceMessage: '',
      ));
    }
    else if(nameProduct != "" && price == "" && (description != "" && description.length < 255) && type != "" && price.length <= 16){
      emit(DataStateFormButtonNotNullBarang(
        formVisibleNameProduct: false, 
        formVisiblePrice: true,
        formVisibleDescription: false,
        formVisibleType: false,
        formLengthVisiblePrice: false,
        messageNameProduct: '',
        messagePrice: priceProductKosong,
        messageDescription: '',
        messageType: '',
        lengthPriceMessage: '',
      ));
    }
    else if(nameProduct != "" && price != "" && (description != "" && description.length < 255) && type != "" && price.length <= 16){
      emit(DataStateFormButtonNotNullBarang(
        formVisibleNameProduct: false, 
        formVisiblePrice: false,
        formVisibleDescription: false,
        formVisibleType: false,
        formLengthVisiblePrice: false,
        messageNameProduct: '',
        messagePrice: '',
        messageDescription: '',
        messageType: '',
        lengthPriceMessage: '',
      ));
    }
  }
}