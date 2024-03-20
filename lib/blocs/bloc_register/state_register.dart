import 'package:foosel/blocs/bloc_default/state/state_multipe_form.dart';

class DataStateFormRegister extends DataStateMultiFormUser{
  DataStateFormRegister({
    required bool formVisibleEmail, 
    required bool formVisiblePassword, 
    required bool formVisibleFullName, 
    required bool formVisibleUsername,
    required bool formVisibleAlamat,
    required String messageEmail, 
    required String messagePassword, 
    required String messageFullName, 
    required String messageUsername,
    required String messageAlamat,
  })
  : super(formVisibleEmail, formVisiblePassword, formVisibleFullName, formVisibleUsername, formVisibleAlamat,
    messageEmail, messagePassword, messageFullName, messageUsername, messageAlamat);
}