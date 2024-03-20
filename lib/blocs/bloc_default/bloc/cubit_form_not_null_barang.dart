import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/state/state_form_products.dart';

class CubitFormNotNullBarang extends Cubit<DataStateFormProduct>{
  CubitFormNotNullBarang() : super(DataStateInitial());

  nameProductValidasiEmpty(String nameProduct){
    if(nameProduct.isEmpty){
      emit(DataStateNameProduct(true));
    }else{
      emit(DataStateNameProduct(false));
    }
  }

  priceProductValidasiEmpty(String priceProduct){
    if(priceProduct.isEmpty){
      emit(DataStatePriceProduct(true));
    }else{
      emit(DataStatePriceProduct(false));
    }
  }

  descriptionValidasi(String description){
    if(description.isEmpty || description.length >= 255){
      emit(DataStateDescriptionProduct(true));
    }else{
      emit(DataStateDescriptionProduct(false));
    }
  }
  
  typeProductValidasiEmpty(String typeProduct){
    if(typeProduct == "All Product"){
      emit(DataStateTypeProduct(true));
    }else{
      emit(DataStateTypeProduct(false));
    }
  } // _formKey.currentState!.validate()
}