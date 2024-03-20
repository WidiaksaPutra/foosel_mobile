import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foosel/blocs/bloc_default/mixin/mixin_shared_pref.dart';
import 'package:foosel/blocs/bloc_default/state/state_connection.dart';
class CubitConnectionNavigasi extends Cubit<DataStateConnection> with SharedPref{
  CubitConnectionNavigasi() : super(DataConnection(false));
  klasifikasiConnection(String key) async{
    await sharedPref();
    bool sharedHasil = prefs.getBool(key) as bool;
    emit(DataConnection(sharedHasil));
  }
}