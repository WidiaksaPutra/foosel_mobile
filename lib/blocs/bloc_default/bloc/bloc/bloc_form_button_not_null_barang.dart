// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/event/event_form_products.dart';
import 'package:foosel/blocs/bloc_default/bloc/interfaces/interfaces_form_button_not_null_barang.dart';
import 'package:foosel/blocs/bloc_default/state/state_form_button_not_null_barang.dart';
import 'package:foosel/blocs/bloc_default/state/state_multipe_form.dart';
import 'package:foosel/shared/theme_konstanta.dart';

class BlocFormButtonNotNullBarang extends Bloc<ButtonFormProducts, DataStateMultiFormProduct> implements InterfacesFormButtonNotNullBarang{
  late bool _formVisibleNameProduct, _formVisiblePrice, _formVisibleDescription, _formVisibleType, _formLengthVisiblePrice;
  late String _messageNameProduct, _messagePrice, _messageDescription, _messageType, _lengthPriceMessage;
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
  Future<void> formButtonNotNullBarang({
    required String nameProduct,
    required String price, 
    required String description, 
    required String type,
  }) async{
    _formVisibleNameProduct = false; _formVisiblePrice = false; _formVisibleDescription = false; _formVisibleType = false; _formLengthVisiblePrice = false;
    _messageNameProduct = ""; _messagePrice = ""; _messageDescription = ""; _messageType = ""; _lengthPriceMessage = "";
    _emitState();
    if(nameProduct == "" && price == "" && (description == "" || description.length >= 255) && type == "" && price.length > 16){
      _formVisibleNameProduct = true; 
      _formVisiblePrice = true;
      _formVisibleDescription = true;
      _formVisibleType = true;
      _formLengthVisiblePrice = true;
      _messageNameProduct = nameProductKosong;
      _messagePrice = priceProductKosong;
      _messageDescription = descriptionProduct;
      _messageType = typeProductKosong;
      _lengthPriceMessage = priceProductLebih;
      _emitState();
    }
    else if(nameProduct == "" && price != "" && (description != "" && description.length < 255) && type == "" && price.length > 16){
      _formVisibleNameProduct = true; 
      _formVisibleType = true;
      _formLengthVisiblePrice = true;
      _messageNameProduct = nameProductKosong;
      _messageType = typeProductKosong;
      _lengthPriceMessage = priceProductLebih;
      _emitState();
    }
    else if(nameProduct == "" && price == "" && (description != "" && description.length < 255) && type == "" && price.length > 16){
      _formVisibleNameProduct = true; 
      _formVisiblePrice = true;
      _formVisibleType = true;
      _formLengthVisiblePrice = true;
      _messageNameProduct = nameProductKosong;
      _messagePrice = priceProductKosong;
      _messageType = typeProductKosong;
      _lengthPriceMessage = priceProductLebih;
      _emitState();
    }
    else if(nameProduct != "" && price == "" && (description == "" || description.length >= 255) && type == "" && price.length > 16){
      _formVisiblePrice = true;
      _formVisibleDescription = true;
      _formVisibleType = true;
      _formLengthVisiblePrice = true;
      _messagePrice = priceProductKosong;
      _messageDescription = descriptionProduct;
      _messageType = typeProductKosong;
      _lengthPriceMessage = priceProductLebih;
      _emitState();
    }
    else if(nameProduct == "" && price != "" && (description == "" || description.length >= 255) && type == "" && price.length > 16){
      _formVisibleNameProduct = true; 
      _formVisibleDescription = true;
      _formVisibleType = true;
      _formLengthVisiblePrice = true;
      _messageNameProduct = nameProductKosong;
      _messageDescription = descriptionProduct;
      _messageType = typeProductKosong;
      _lengthPriceMessage = priceProductLebih;
      _emitState();
    }
    else if(nameProduct != "" && price != "" && (description == "" || description.length >= 255) && type == "" && price.length > 16){
      _formVisibleDescription = true;
      _formVisibleType = true;
      _formLengthVisiblePrice = true;
      _messageDescription = descriptionProduct;
      _messageType = typeProductKosong;
      _lengthPriceMessage = priceProductLebih;
      _emitState();
    }
    else if(nameProduct != "" && price == "" && (description != "" && description.length < 255) && type == "" && price.length > 16){
      _formVisiblePrice = true;
      _formVisibleType = true;
      _formLengthVisiblePrice = true;
      _messagePrice = priceProductKosong;
      _messageType = typeProductKosong;
      _lengthPriceMessage = priceProductLebih;
      _emitState();
    }
    else if(nameProduct != "" && price != "" && (description != "" && description.length < 255) && type == "" && price.length > 16){
      _formVisibleType = true;
      _formLengthVisiblePrice = true;
      _messageType = typeProductKosong;
      _lengthPriceMessage = priceProductLebih;
      _emitState();
    }
    else if(nameProduct == "" && price == "" && (description == "" || description.length >= 255) && type != "" && price.length > 16){
      _formVisibleNameProduct = true; 
      _formVisiblePrice = true;
      _formVisibleDescription = true;
      _formLengthVisiblePrice = true;
      _messageNameProduct = nameProductKosong;
      _messagePrice = priceProductKosong;
      _messageDescription = descriptionProduct;
      _lengthPriceMessage = priceProductLebih;
      _emitState();
    }
    else if(nameProduct == "" && price != "" && (description != "" && description.length < 255) && type != "" && price.length > 16){
      _formVisibleNameProduct = true; 
      _formLengthVisiblePrice = true;
      _messageNameProduct = nameProductKosong;
      _lengthPriceMessage = priceProductLebih;
      _emitState();
    }
    else if(nameProduct == "" && price == "" && (description != "" && description.length < 255) && type != "" && price.length > 16){
      _formVisibleNameProduct = true; 
      _formVisiblePrice = true;
      _formLengthVisiblePrice = true;
      _messageNameProduct = nameProductKosong;
      _messagePrice = priceProductKosong;
      _lengthPriceMessage = priceProductLebih;
      _emitState();
    }
    else if(nameProduct != "" && price == "" && (description == "" || description.length >= 255) && type != "" && price.length > 16){
      _formVisiblePrice = true;
      _formVisibleDescription = true;
      _formLengthVisiblePrice = true;
      _messagePrice = priceProductKosong;
      _messageDescription = descriptionProduct;
      _lengthPriceMessage = priceProductLebih;
      _emitState();
    }
    else if(nameProduct == "" && price != "" && (description == "" || description.length >= 255) && type != "" && price.length > 16){
      _formVisibleNameProduct = true;
      _formVisibleDescription = true;
      _formLengthVisiblePrice = true;
      _messageNameProduct = nameProductKosong;
      _messageDescription = descriptionProduct;
      _lengthPriceMessage = priceProductLebih;
      _emitState();
    }
    else if(nameProduct != "" && price != "" && (description == "" || description.length >= 255) && type != "" && price.length > 16){
      _formVisibleDescription = true;
      _formLengthVisiblePrice = true;
      _messageDescription = descriptionProduct;
      _lengthPriceMessage = priceProductLebih;
      _emitState();
    }
    else if(nameProduct != "" && price == "" && (description != "" && description.length < 255) && type != "" && price.length > 16){
      _formVisiblePrice = true;
      _formLengthVisiblePrice = true;
      _messagePrice = priceProductKosong;
      _lengthPriceMessage = priceProductLebih;
      _emitState();
    }
    else if(nameProduct != "" && price != "" && (description != "" && description.length < 255) && type != "" && price.length > 16){
      _formLengthVisiblePrice = true;
      _lengthPriceMessage = priceProductLebih;
      _emitState();
    }
    else if(nameProduct == "" && price == "" && (description == "" || description.length >= 255) && type == "" && price.length <= 16){
      _formVisibleNameProduct = true;
      _formVisiblePrice = true;
      _formVisibleDescription = true;
      _formVisibleType = true;
      _messageNameProduct = nameProductKosong;
      _messagePrice = priceProductKosong;
      _messageDescription = descriptionProduct;
      _messageType = typeProductKosong;
      _emitState();
    }
    else if(nameProduct == "" && price != "" && (description != "" && description.length < 255) && type == "" && price.length <= 16){
      _formVisibleNameProduct = true; 
      _formVisibleType = true;
      _messageNameProduct = nameProductKosong;
      _messageType = typeProductKosong;
      _emitState();
    }
    else if(nameProduct == "" && price == "" && (description != "" && description.length < 255) && type == "" && price.length <= 16){
      _formVisibleNameProduct = true; 
      _formVisiblePrice = true;
      _formVisibleType = true;
      _messageNameProduct = nameProductKosong;
      _messagePrice = priceProductKosong;
      _messageType = typeProductKosong;
      _emitState();
    }
    else if(nameProduct != "" && price == "" && (description == "" || description.length >= 255) && type == "" && price.length <= 16){
      _formVisiblePrice = true;
      _formVisibleDescription = true;
      _formVisibleType = true;
      _messagePrice = priceProductKosong;
      _messageDescription = descriptionProduct;
      _messageType = typeProductKosong;
      _emitState();
    }
    else if(nameProduct == "" && price != "" && (description == "" || description.length >= 255) && type == "" && price.length <= 16){
      _formVisibleNameProduct = true; 
      _formVisibleDescription = true;
      _formVisibleType = true;
      _messageNameProduct = nameProductKosong;
      _messageDescription = descriptionProduct;
      _messageType = typeProductKosong;
      _emitState();
    }
    else if(nameProduct != "" && price != "" && (description == "" || description.length >= 255) && type == "" && price.length <= 16){
      _formVisibleDescription = true;
      _formVisibleType = true;
      _messageDescription = descriptionProduct;
      _messageType = typeProductKosong;
      _emitState();
    }
    else if(nameProduct != "" && price == "" && (description != "" && description.length < 255) && type == "" && price.length <= 16){
      _formVisiblePrice = true;
      _formVisibleType = true;
      _messagePrice = priceProductKosong;
      _messageType = typeProductKosong;
      _emitState();
    }
    else if(nameProduct != "" && price != "" && (description != "" && description.length < 255) && type == "" && price.length <= 16){
      _formVisibleType = true;
      _messageType = typeProductKosong;
      _emitState();
    }
    else if(nameProduct == "" && price == "" && (description == "" || description.length >= 255) && type != "" && price.length <= 16){
      _formVisibleNameProduct = true; 
      _formVisiblePrice = true;
      _formVisibleDescription = true;
      _messageNameProduct = nameProductKosong;
      _messagePrice = priceProductKosong;
      _messageDescription = descriptionProduct;
      _emitState();
    }
    else if(nameProduct == "" && price != "" && (description != "" && description.length < 255) && type != "" && price.length <= 16){
      _formVisibleNameProduct = true; 
      _messageNameProduct = nameProductKosong;
      _emitState();
    }
    else if(nameProduct == "" && price == "" && (description != "" && description.length < 255) && type != "" && price.length <= 16){
      _formVisibleNameProduct = true; 
      _formVisiblePrice = true;
      _messageNameProduct = nameProductKosong;
      _messagePrice = priceProductKosong;
      _emitState();
    }
    else if(nameProduct != "" && price == "" && (description == "" || description.length >= 255) && type != "" && price.length <= 16){
      _formVisiblePrice = true;
      _formVisibleDescription = true;
      _messagePrice = priceProductKosong;
      _messageDescription = descriptionProduct;
      _emitState();
    }
    else if(nameProduct == "" && price != "" && (description == "" || description.length >= 255) && type != "" && price.length <= 16){
      _formVisibleNameProduct = true; 
      _formVisibleDescription = true;
      _messageNameProduct = nameProductKosong;
      _messageDescription = descriptionProduct;
      _emitState();
    }
    else if(nameProduct != "" && price != "" && (description == "" || description.length >= 255) && type != "" && price.length <= 16){
      _formVisibleDescription = true;
      _messageDescription = descriptionProduct;
      _emitState();
    }
    else if(nameProduct != "" && price == "" && (description != "" && description.length < 255) && type != "" && price.length <= 16){
      _formVisiblePrice = true;
      _messagePrice = priceProductKosong;
      _emitState();
    }
    else if(nameProduct != "" && price != "" && (description != "" && description.length < 255) && type != "" && price.length <= 16){
      _emitState();
    }
  }
  
  void _emitState(){
    emit(DataStateFormButtonNotNullBarang(
      formVisibleNameProduct: _formVisibleNameProduct, 
      formVisiblePrice: _formVisiblePrice,
      formVisibleDescription: _formVisibleDescription,
      formVisibleType: _formVisibleType,
      formLengthVisiblePrice: _formLengthVisiblePrice,
      messageNameProduct: _messageNameProduct,
      messagePrice: _messagePrice,
      messageDescription: _messageDescription,
      messageType: _messageType,
      lengthPriceMessage: _lengthPriceMessage,
    ));
  }
}