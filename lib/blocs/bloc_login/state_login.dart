// part of 'bloc_main_login.dart';//semua import dialihkan ke package ini.

import 'package:foosel/blocs/bloc_default/state_default/state_multipe_form.dart';

class DataMultiStateForm extends DataStateMultiFormUser{
  DataMultiStateForm(
    bool formVisibleEmail, bool formVisiblePassword,
    String messageEmail, String messagePassword) 
  : super(formVisibleEmail, formVisiblePassword, false, false, false,
    messageEmail, messagePassword, '', '', '');
}
