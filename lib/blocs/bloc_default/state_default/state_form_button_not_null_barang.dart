import 'package:foosel/blocs/bloc_default/state_default/state_multipe_form.dart';

class DataStateFormButtonNotNullBarang extends DataStateMultiFormProduct{
  DataStateFormButtonNotNullBarang({
    required bool formVisibleNameProduct,
    required bool formVisiblePrice,
    required bool formVisibleDescription,
    required bool formVisibleType,
    required bool formLengthVisiblePrice,
    required String messageNameProduct,
    required String messagePrice,
    required String messageDescription,
    required String messageType,
    required String lengthPriceMessage, 
  })
  : super(
      formVisibleNameProduct, 
      formVisiblePrice, 
      formVisibleDescription, 
      formVisibleType, 
      formLengthVisiblePrice,
      messageNameProduct, 
      messagePrice, 
      messageDescription, 
      messageType, 
      lengthPriceMessage,
    );
}